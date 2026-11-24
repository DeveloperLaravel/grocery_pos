import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/category.dart';
import '../bloc/category_bloc.dart';
import '../bloc/category_event.dart';
import '../bloc/category_state.dart';

class CategoryFormPage extends StatefulWidget {
  final Category? category;

  const CategoryFormPage({
    super.key,
    this.category,
  });

  @override
  State<CategoryFormPage> createState() => _CategoryFormPageState();
}

class _CategoryFormPageState extends State<CategoryFormPage> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _sortOrderController;

  int? _parentId;
  bool _isActive = true;

  bool get isEditing => widget.category != null;

  @override
  void initState() {
    super.initState();

    final category = widget.category;

    _nameController = TextEditingController(
      text: category?.name ?? '',
    );

    _descriptionController = TextEditingController(
      text: category?.description ?? '',
    );

    _sortOrderController = TextEditingController(
      text: (category?.sortOrder ?? 0).toString(),
    );

    _parentId = category?.parentId;
    _isActive = category?.isActive ?? true;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _sortOrderController.dispose();
    super.dispose();
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;

    final oldCategory = widget.category;

    // إنشاء كائن جديد يسمح بمسح الوصف أو تغيير التصنيف الأب إلى null.
    final category = Category(
      id: oldCategory?.id,
      name: _nameController.text.trim(),
      description: _descriptionController.text.trim().isEmpty
          ? null
          : _descriptionController.text.trim(),
      parentId: _parentId,
      imagePath: oldCategory?.imagePath,
      isActive: _isActive,
      sortOrder: int.tryParse(_sortOrderController.text.trim()) ?? 0,
      createdAt: oldCategory?.createdAt,
      updatedAt: DateTime.now(),
    );

    final bloc = context.read<CategoryBloc>();

    if (isEditing) {
      bloc.add(CategoryUpdateRequested(category));
    } else {
      bloc.add(CategoryAddRequested(category));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'تعديل التصنيف' : 'إضافة تصنيف جديد'),
        centerTitle: false,
      ),
      body: BlocListener<CategoryBloc, CategoryState>(
        listenWhen: (previous, current) =>
            previous.successMessage != current.successMessage ||
            previous.errorMessage != current.errorMessage,
        listener: (context, state) {
          final success = state.successMessage;
          final error = state.errorMessage;

          if (success != null && success.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(success),
                behavior: SnackBarBehavior.floating,
              ),
            );

            context.pop();
          } else if (error != null && error.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(error),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
              ),
            );
          }
        },
        child: BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 760),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    padding: const EdgeInsets.all(22),
                    children: [
                      _FormIntro(isEditing: isEditing),
                      const SizedBox(height: 24),

                      _SectionCard(
                        title: 'المعلومات الأساسية',
                        subtitle: 'أدخل بيانات التصنيف',
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _nameController,
                              textDirection: TextDirection.rtl,
                              decoration: const InputDecoration(
                                labelText: 'اسم التصنيف',
                                hintText: 'مثال: المشروبات',
                                prefixIcon: Icon(Icons.category_outlined),
                              ),
                              validator: (value) {
                                final name = value?.trim() ?? '';

                                if (name.isEmpty) {
                                  return 'اسم التصنيف مطلوب';
                                }

                                if (name.length < 2) {
                                  return 'يجب ألا يقل الاسم عن حرفين';
                                }

                                if (name.length > 100) {
                                  return 'الاسم طويل جدًا';
                                }

                                return null;
                              },
                            ),
                            const SizedBox(height: 18),
                            TextFormField(
                              controller: _descriptionController,
                              textDirection: TextDirection.rtl,
                              minLines: 3,
                              maxLines: 5,
                              decoration: const InputDecoration(
                                labelText: 'الوصف',
                                hintText: 'أضف وصفًا مختصرًا للتصنيف...',
                                alignLabelWithHint: true,
                                prefixIcon: Icon(Icons.notes_rounded),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 18),

                      _SectionCard(
                        title: 'تنظيم التصنيف',
                        subtitle: 'حدد موقع التصنيف وترتيبه',
                        child: Column(
                          children: [
                            DropdownButtonFormField<int?>(
                              value: _parentId,
                              isExpanded: true,
                              decoration: const InputDecoration(
                                labelText: 'التصنيف الأب',
                                prefixIcon: Icon(
                                  Icons.account_tree_outlined,
                                ),
                              ),
                              items: [
                                const DropdownMenuItem<int?>(
                                  value: null,
                                  child: Text('تصنيف رئيسي'),
                                ),
                                ...state.categories
                                    .where(
                                      (item) =>
                                          item.id != null &&
                                          item.id != widget.category?.id,
                                    )
                                    .map(
                                      (item) => DropdownMenuItem<int?>(
                                        value: item.id,
                                        child: Text(item.name),
                                      ),
                                    ),
                              ],
                              onChanged: (value) {
                                setState(() => _parentId = value);
                              },
                            ),
                            const SizedBox(height: 18),
                            TextFormField(
                              controller: _sortOrderController,
                              keyboardType: TextInputType.number,
                              textDirection: TextDirection.rtl,
                              decoration: const InputDecoration(
                                labelText: 'ترتيب العرض',
                                hintText: '0',
                                prefixIcon: Icon(Icons.sort_rounded),
                              ),
                              validator: (value) {
                                if (int.tryParse(value?.trim() ?? '') ==
                                    null) {
                                  return 'أدخل رقمًا صحيحًا';
                                }

                                return null;
                              },
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 18),

                      _SectionCard(
                        title: 'حالة التصنيف',
                        subtitle: 'يمكنك تفعيل التصنيف أو تعطيله',
                        child: SwitchListTile(
                          contentPadding: EdgeInsets.zero,
                          value: _isActive,
                          onChanged: (value) {
                            setState(() => _isActive = value);
                          },
                          title: const Text(
                            'تصنيف نشط',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          subtitle: Text(
                            _isActive
                                ? 'التصنيف متاح للاستخدام'
                                : 'التصنيف غير متاح للاستخدام',
                          ),
                          activeColor: AppColors.primary,
                        ),
                      ),

                      const SizedBox(height: 28),

                      SizedBox(
                        height: 52,
                        child: FilledButton.icon(
                          onPressed: state.isSaving ? null : _save,
                          icon: state.isSaving
                              ? const SizedBox(
                                  width: 19,
                                  height: 19,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              : const Icon(Icons.save_outlined),
                          label: Text(
                            state.isSaving
                                ? 'جارٍ الحفظ...'
                                : isEditing
                                    ? 'حفظ التعديلات'
                                    : 'إضافة التصنيف',
                          ),
                          style: FilledButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      OutlinedButton(
                        onPressed: state.isSaving
                            ? null
                            : () => context.pop(),
                        child: const Text('إلغاء'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _FormIntro extends StatelessWidget {
  final bool isEditing;

  const _FormIntro({
    required this.isEditing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 54,
          height: 54,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.10),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(
            Icons.edit_note_rounded,
            color: AppColors.primary,
            size: 28,
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isEditing ? 'تحديث بيانات التصنيف' : 'تصنيف جديد',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
              ),
              const SizedBox(height: 5),
              Text(
                'املأ الحقول التالية ثم احفظ البيانات',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).hintColor,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;

  const _SectionCard({
    required this.title,
    required this.subtitle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Theme.of(context).dividerColor.withValues(alpha: 0.35),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
          ),
          const SizedBox(height: 5),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).hintColor,
                ),
          ),
          const SizedBox(height: 20),
          child,
        ],
      ),
    );
  }
}