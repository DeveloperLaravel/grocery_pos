
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/brand.dart';
import '../bloc/brand_bloc.dart';
import '../bloc/brand_event.dart';
import '../bloc/brand_state.dart';

class BrandFormPage extends StatefulWidget {
  final Brand? brand;

  const BrandFormPage({
    super.key,
    this.brand,
  });

  @override
  State<BrandFormPage> createState() => _BrandFormPageState();
}

class _BrandFormPageState extends State<BrandFormPage> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _imagePathController;

  late bool _isActive;

  bool get _isEditing => widget.brand != null;

  @override
  void initState() {
    super.initState();

    final brand = widget.brand;

    _nameController = TextEditingController(
      text: brand?.name ?? '',
    );

    _descriptionController = TextEditingController(
      text: brand?.description ?? '',
    );

    _imagePathController = TextEditingController(
      text: brand?.imagePath ?? '',
    );

    _isActive = brand?.isActive ?? true;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _imagePathController.dispose();
    super.dispose();
  }

  void _onNameChanged(String value) {
    final name = value.trim();

    context.read<BrandBloc>().add(
      BrandEvent.checkBrandNameRequested(
        name: name,
        excludeId: widget.brand?.id,
      ),
    );
  }

  void _save() {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) return;

    final state = context.read<BrandBloc>().state;

    if (state.isCheckingName) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('انتظر حتى ينتهي التحقق من الاسم'),
        ),
      );
      return;
    }

    if (state.nameExists == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('اسم العلامة التجارية مستخدم بالفعل'),
        ),
      );
      return;
    }

    final name = _nameController.text.trim();
    final description = _descriptionController.text.trim();
    final imagePath = _imagePathController.text.trim();

    if (_isEditing) {
      final old = widget.brand!;

      final updated = Brand(
        id: old.id,
        name: name,
        description: description.isEmpty ? null : description,
        imagePath: imagePath.isEmpty ? null : imagePath,
        isActive: _isActive,
        createdAt: old.createdAt,
        updatedAt: DateTime.now(),
      );

      context.read<BrandBloc>().add(
        BrandEvent.updateBrandRequested(brand: updated),
      );
    } else {
      context.read<BrandBloc>().add(
        BrandEvent.createBrandRequested(
          name: name,
          description: description.isEmpty ? null : description,
          imagePath: imagePath.isEmpty ? null : imagePath,
          isActive: _isActive,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BlocListener<BrandBloc, BrandState>(
      listenWhen: (previous, current) =>
          previous.successMessage != current.successMessage ||
          previous.errorMessage != current.errorMessage,
      listener: (context, state) {
        if (state.successMessage != null) {
          Navigator.of(context).pop();
        } else if (state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage!),
              backgroundColor: colors.error,
            ),
          );
          context.read<BrandBloc>().add(
            const BrandEvent.clearBrandMessagesRequested(),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            _isEditing
                ? 'تعديل العلامة التجارية'
                : 'إضافة علامة تجارية',
          ),
        ),
        body: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 760),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildIntro(context),
                      const SizedBox(height: 24),

                      _buildFieldTitle(
                        context,
                        'اسم العلامة التجارية',
                        required: true,
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _nameController,
                        textInputAction: TextInputAction.next,
                        onChanged: _onNameChanged,
                        decoration: const InputDecoration(
                          hintText: 'مثال: Samsung',
                          prefixIcon: Icon(Icons.sell_outlined),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'يرجى إدخال اسم العلامة التجارية';
                          }

                          if (value.trim().length > 100) {
                            return 'الاسم يجب ألا يتجاوز 100 حرف';
                          }

                          return null;
                        },
                      ),

                      BlocBuilder<BrandBloc, BrandState>(
                        builder: (context, state) {
                          if (state.isCheckingName) {
                            return const Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 14,
                                    height: 14,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text('جارٍ التحقق من الاسم...'),
                                ],
                              ),
                            );
                          }

                          if (state.nameExists == true) {
                            return const Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: Text(
                                'هذا الاسم مستخدم بالفعل',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                ),
                              ),
                            );
                          }

                          if (state.nameExists == false &&
                              _nameController.text.trim().isNotEmpty) {
                            return const Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: Text(
                                'الاسم متاح',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 12,
                                ),
                              ),
                            );
                          }

                          return const SizedBox.shrink();
                        },
                      ),

                      const SizedBox(height: 20),

                      _buildFieldTitle(context, 'الوصف'),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _descriptionController,
                        minLines: 3,
                        maxLines: 5,
                        maxLength: 500,
                        decoration: const InputDecoration(
                          hintText: 'اكتب وصفاً مختصراً للعلامة التجارية...',
                          alignLabelWithHint: true,
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(bottom: 65),
                            child: Icon(Icons.description_outlined),
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      _buildFieldTitle(context, 'مسار الصورة'),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _imagePathController,
                        decoration: const InputDecoration(
                          hintText: 'مسار الصورة أو رابطها (اختياري)',
                          prefixIcon: Icon(Icons.image_outlined),
                        ),
                      ),

                      const SizedBox(height: 22),

                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: colors.surfaceContainerLow,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: colors.outlineVariant,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 42,
                              height: 42,
                              decoration: BoxDecoration(
                                color: colors.primaryContainer,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                Icons.toggle_on_outlined,
                                color: colors.primary,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'حالة العلامة التجارية',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    _isActive
                                        ? 'العلامة التجارية متاحة للاستخدام'
                                        : 'العلامة التجارية غير نشطة',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          color: colors.onSurfaceVariant,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Switch.adaptive(
                              value: _isActive,
                              onChanged: (value) {
                                setState(() => _isActive = value);
                              },
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 28),

                      BlocBuilder<BrandBloc, BrandState>(
                        builder: (context, state) {
                          final isSaving =
                              state.isCreating || state.isUpdating;

                          final blocked =
                              state.isCheckingName ||
                              state.nameExists == true;

                          return FilledButton.icon(
                            onPressed: isSaving || blocked ? null : _save,
                            icon: isSaving
                                ? const SizedBox(
                                    width: 18,
                                    height: 18,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.white,
                                    ),
                                  )
                                : Icon(
                                    _isEditing
                                        ? Icons.save_outlined
                                        : Icons.add_rounded,
                                  ),
                            label: Text(
                              isSaving
                                  ? 'جارٍ الحفظ...'
                                  : _isEditing
                                      ? 'حفظ التعديلات'
                                      : 'إضافة العلامة التجارية',
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 12),

                      OutlinedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('إلغاء'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIntro(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colors.primaryContainer,
            colors.surfaceContainerLow,
          ],
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Icon(
            Icons.branding_watermark_rounded,
            size: 38,
            color: colors.primary,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _isEditing
                      ? 'تحديث بيانات العلامة'
                      : 'علامة تجارية جديدة',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'أدخل البيانات الأساسية لتنظيم العلامات التجارية داخل المتجر.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFieldTitle(
    BuildContext context,
    String title, {
    bool required = false,
  }) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        if (required) ...[
          const SizedBox(width: 4),
          const Text(
            '*',
            style: TextStyle(color: Colors.red),
          ),
        ],
      ],
    );
  }
}
