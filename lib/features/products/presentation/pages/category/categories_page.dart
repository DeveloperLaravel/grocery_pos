
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/parties/category.dart';
import '../../bloc/categories/categories_bloc.dart';
import '../../bloc/categories/categories_event.dart';
import '../../bloc/categories/categories_state.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final TextEditingController _searchController =
      TextEditingController();

  _CategoryFilter _filter = _CategoryFilter.all;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      final bloc = context.read<CategoriesBloc>();

      bloc.add(const CategoriesEvent.load());
      bloc.add(const CategoriesEvent.watch());
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // =====================================================
  // SEARCH
  // =====================================================

  void _onSearchChanged(String value) {
    context.read<CategoriesBloc>().add(
          CategoriesEvent.search(value),
        );
  }

  void _clearSearch() {
    _searchController.clear();

    context.read<CategoriesBloc>().add(
          const CategoriesEvent.clearSearch(),
        );
  }

  // =====================================================
  // FILTER
  // =====================================================

  List<Category> _getFilteredCategories(
    CategoriesState state,
  ) {
    final categories = state.categories;

    switch (_filter) {
      case _CategoryFilter.all:
        return categories;

      case _CategoryFilter.roots:
        return categories
            .where((category) => category.parentId == null)
            .toList();

      case _CategoryFilter.children:
        return categories
            .where((category) => category.parentId != null)
            .toList();
    }
  }

  // =====================================================
  // ADD CATEGORY
  // =====================================================

  Future<void> _addCategory(
    CategoriesState state, {
    int? parentId,
  }) async {
    final result = await showDialog<Category>(
      context: context,
      barrierDismissible: false,
      builder: (_) => _CategoryFormDialog(
        rootCategories: state.allCategories
            .where((category) => category.parentId == null)
            .toList(),
        initialParentId: parentId,
      ),
    );

    if (!mounted || result == null) return;

    context.read<CategoriesBloc>().add(
          CategoriesEvent.create(result),
        );
  }

  // =====================================================
  // EDIT CATEGORY
  // =====================================================

  Future<void> _editCategory(
    CategoriesState state,
    Category category,
  ) async {
    final result = await showDialog<Category>(
      context: context,
      barrierDismissible: false,
      builder: (_) => _CategoryFormDialog(
        category: category,
        rootCategories: state.allCategories
            .where((item) => item.parentId == null)
            .toList(),
      ),
    );

    if (!mounted || result == null) return;

    context.read<CategoriesBloc>().add(
          CategoriesEvent.update(
            id: category.id,
            category: result,
          ),
        );
  }

  // =====================================================
  // DELETE CATEGORY
  // =====================================================

  Future<void> _deleteCategory(Category category) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        final colors = Theme.of(dialogContext).colorScheme;

        return AlertDialog(
          icon: Icon(
            Icons.delete_outline_rounded,
            color: colors.error,
            size: 34,
          ),
          title: const Text('حذف التصنيف'),
          content: Text(
            'هل أنت متأكد من حذف التصنيف "${category.name}"؟\n'
            'لا يمكن التراجع عن هذه العملية.',
            textAlign: TextAlign.center,
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            TextButton(
              onPressed: () =>
                  Navigator.pop(dialogContext, false),
              child: const Text('إلغاء'),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: colors.error,
              ),
              onPressed: () =>
                  Navigator.pop(dialogContext, true),
              child: const Text('حذف التصنيف'),
            ),
          ],
        );
      },
    );

    if (!mounted || confirmed != true) return;

    context.read<CategoriesBloc>().add(
          CategoriesEvent.delete(category.id),
        );
  }

  // =====================================================
  // SNACKBAR
  // =====================================================

  void _showMessage(
    BuildContext context,
    String message, {
    required bool isError,
  }) {
    final colors = Theme.of(context).colorScheme;

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(
                isError
                    ? Icons.error_outline_rounded
                    : Icons.check_circle_outline_rounded,
                color: Colors.white,
              ),
              const SizedBox(width: 10),
              Expanded(child: Text(message)),
            ],
          ),
          backgroundColor:
              isError ? colors.error : const Color(0xFF159B68),
        ),
      );
  }

  // =====================================================
  // BUILD
  // =====================================================

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return BlocConsumer<CategoriesBloc, CategoriesState>(
      listenWhen: (previous, current) {
        return previous.successMessage != current.successMessage ||
            previous.errorMessage != current.errorMessage;
      },
      listener: (context, state) {
        if (state.successMessage != null) {
          _showMessage(
            context,
            state.successMessage!,
            isError: false,
          );
        } else if (state.errorMessage != null) {
          _showMessage(
            context,
            state.errorMessage!,
            isError: true,
          );
        }
      },
      builder: (context, state) {
        final categories = _getFilteredCategories(state);

        final isInitialLoading =
            state.isLoading && state.allCategories.isEmpty;

        return Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          body: SafeArea(
            child: Column(
              children: [
                // =====================================
                // HEADER
                // =====================================

                _buildHeader(context, state),

                // =====================================
                // CONTENT
                // =====================================

                Expanded(
                  child: isInitialLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : state.isFailure &&
                              state.allCategories.isEmpty
                          ? _buildErrorState(context, state)
                          : _buildContent(
                              context,
                              state,
                              categories,
                            ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: state.isOperationInProgress
                ? null
                : () => _addCategory(state),
            icon: const Icon(Icons.add_rounded),
            label: const Text('إضافة تصنيف'),
          ),
        );
      },
    );
  }

  // =====================================================
  // HEADER
  // =====================================================

  Widget _buildHeader(
    BuildContext context,
    CategoriesState state,
  ) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: colors.primaryContainer,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  Icons.category_rounded,
                  color: colors.primary,
                  size: 26,
                ),
              ),
              const SizedBox(width: 13),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'التصنيفات',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'إدارة وتنظيم تصنيفات المنتجات',
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
              IconButton(
                tooltip: 'تحديث البيانات',
                onPressed: state.isOperationInProgress
                    ? null
                    : () {
                        context.read<CategoriesBloc>().add(
                              const CategoriesEvent.load(),
                            );
                      },
                icon: const Icon(Icons.refresh_rounded),
              ),
            ],
          ),

          if (state.isOperationInProgress) ...[
            const SizedBox(height: 14),
            const LinearProgressIndicator(),
          ],

          if (state.isLoading &&
              state.allCategories.isNotEmpty) ...[
            const SizedBox(height: 8),
            const LinearProgressIndicator(),
          ],
        ],
      ),
    );
  }

  // =====================================================
  // CONTENT
  // =====================================================

  Widget _buildContent(
    BuildContext context,
    CategoriesState state,
    List<Category> categories,
  ) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<CategoriesBloc>().add(
              const CategoriesEvent.load(),
            );
      },
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 100),
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          // Statistics
          _buildStatistics(context, state),

          const SizedBox(height: 22),

          // Search
          _buildSearch(context, state),

          const SizedBox(height: 16),

          // Filters
          _buildFilters(context),

          const SizedBox(height: 20),

          // Section title
          Row(
            children: [
              Expanded(
                child: Text(
                  'قائمة التصنيفات',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Text(
                '${categories.length} تصنيف',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),

          const SizedBox(height: 14),

          // Categories
          if (categories.isEmpty)
            _buildEmptyState(
              context,
              searching: state.hasSearchQuery,
            )
          else
            ...categories.map(
              (category) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _CategoryCard(
                  category: category,
                  parentName: _getParentName(
                    state.allCategories,
                    category.parentId,
                  ),
                  isOperationInProgress:
                      state.isOperationInProgress,
                  onEdit: () => _editCategory(
                    state,
                    category,
                  ),
                  onDelete: () => _deleteCategory(category),
                  onAddChild: () => _addCategory(
                    state,
                    parentId: category.id,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  // =====================================================
  // STATISTICS
  // =====================================================

  Widget _buildStatistics(
    BuildContext context,
    CategoriesState state,
  ) {
    final rootCount = state.allCategories
        .where((item) => item.parentId == null)
        .length;

    final childCount = state.allCategories
        .where((item) => item.parentId != null)
        .length;

    return Row(
      children: [
        Expanded(
          child: _StatisticCard(
            title: 'إجمالي التصنيفات',
            value: state.allCategoriesCount.toString(),
            icon: Icons.category_rounded,
            color: const Color(0xFF087F5B),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _StatisticCard(
            title: 'رئيسية',
            value: rootCount.toString(),
            icon: Icons.account_tree_rounded,
            color: const Color(0xFF4285D4),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _StatisticCard(
            title: 'فرعية',
            value: childCount.toString(),
            icon: Icons.subdirectory_arrow_left_rounded,
            color: const Color(0xFFE5A43B),
          ),
        ),
      ],
    );
  }

  // =====================================================
  // SEARCH FIELD
  // =====================================================

  Widget _buildSearch(
    BuildContext context,
    CategoriesState state,
  ) {
    return TextField(
      controller: _searchController,
      onChanged: _onSearchChanged,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: 'ابحث عن تصنيف بالاسم أو الوصف...',
        prefixIcon: const Icon(Icons.search_rounded),
        suffixIcon: state.hasSearchQuery
            ? IconButton(
                onPressed: _clearSearch,
                icon: const Icon(Icons.close_rounded),
              )
            : null,
      ),
    );
  }

  // =====================================================
  // FILTERS
  // =====================================================

  Widget _buildFilters(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildFilterChip(
            context,
            label: 'الكل',
            value: _CategoryFilter.all,
            icon: Icons.grid_view_rounded,
          ),
          const SizedBox(width: 8),
          _buildFilterChip(
            context,
            label: 'الرئيسية',
            value: _CategoryFilter.roots,
            icon: Icons.account_tree_outlined,
          ),
          const SizedBox(width: 8),
          _buildFilterChip(
            context,
            label: 'الفرعية',
            value: _CategoryFilter.children,
            icon: Icons.subdirectory_arrow_left_rounded,
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(
    BuildContext context, {
    required String label,
    required _CategoryFilter value,
    required IconData icon,
  }) {
    final colors = Theme.of(context).colorScheme;
    final selected = _filter == value;

    return FilterChip(
      selected: selected,
      showCheckmark: false,
      avatar: Icon(
        icon,
        size: 17,
        color: selected
            ? colors.onPrimaryContainer
            : colors.onSurfaceVariant,
      ),
      label: Text(label),
      onSelected: (_) {
        setState(() {
          _filter = value;
        });
      },
    );
  }

  // =====================================================
  // EMPTY STATE
  // =====================================================

  Widget _buildEmptyState(
    BuildContext context, {
    required bool searching,
  }) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 55),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: colors.primaryContainer,
              borderRadius: BorderRadius.circular(28),
            ),
            child: Icon(
              searching
                  ? Icons.search_off_rounded
                  : Icons.category_outlined,
              size: 48,
              color: colors.primary,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            searching
                ? 'لا توجد نتائج'
                : 'لا توجد تصنيفات',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            searching
                ? 'جرب البحث باستخدام اسم آخر'
                : 'ابدأ بتنظيم منتجاتك وإضافة أول تصنيف',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
          ),
        ],
      ),
    );
  }

  // =====================================================
  // ERROR STATE
  // =====================================================

  Widget _buildErrorState(
    BuildContext context,
    CategoriesState state,
  ) {
    final colors = Theme.of(context).colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.cloud_off_rounded,
              size: 60,
              color: colors.error,
            ),
            const SizedBox(height: 16),
            const Text(
              'تعذر تحميل التصنيفات',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              state.errorMessage ?? 'حدث خطأ غير متوقع',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: () {
                context.read<CategoriesBloc>().add(
                      const CategoriesEvent.load(),
                    );
              },
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('إعادة المحاولة'),
            ),
          ],
        ),
      ),
    );
  }

  // =====================================================
  // PARENT NAME
  // =====================================================

  String? _getParentName(
    List<Category> categories,
    int? parentId,
  ) {
    if (parentId == null) return null;

    for (final category in categories) {
      if (category.id == parentId) {
        return category.name;
      }
    }

    return null;
  }
}

// =========================================================
// FILTER ENUM
// =========================================================

enum _CategoryFilter {
  all,
  roots,
  children,
}

// =========================================================
// STATISTIC CARD
// =========================================================

class _StatisticCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _StatisticCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colors.outlineVariant.withValues(alpha: 0.6),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 22),
          const SizedBox(height: 12),
          Text(
            value,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 3),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: colors.onSurfaceVariant,
                  fontSize: 10,
                ),
          ),
        ],
      ),
    );
  }
}

// =========================================================
// CATEGORY CARD
// =========================================================

class _CategoryCard extends StatelessWidget {
  final Category category;
  final String? parentName;
  final bool isOperationInProgress;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onAddChild;

  const _CategoryCard({
    required this.category,
    required this.parentName,
    required this.isOperationInProgress,
    required this.onEdit,
    required this.onDelete,
    required this.onAddChild,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isChild = category.parentId != null;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: isChild
                    ? colors.secondaryContainer
                    : colors.primaryContainer,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(
                isChild
                    ? Icons.subdirectory_arrow_left_rounded
                    : Icons.category_rounded,
                color: isChild
                    ? colors.secondary
                    : colors.primary,
                size: 25,
              ),
            ),
            const SizedBox(width: 13),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  if (category.description != null &&
                      category.description!.trim().isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      category.description!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(
                            color: colors.onSurfaceVariant,
                          ),
                    ),
                  ],

                  const SizedBox(height: 7),

                  Wrap(
                    spacing: 6,
                    runSpacing: 5,
                    children: [
                      _CategoryTag(
                        label: isChild ? 'تصنيف فرعي' : 'رئيسي',
                        color: isChild
                            ? colors.secondary
                            : colors.primary,
                      ),
                      if (parentName != null)
                        _CategoryTag(
                          label: 'الأب: $parentName',
                          color: colors.tertiary,
                        ),
                      _CategoryTag(
                        label: category.isActive
                            ? 'نشط'
                            : 'غير نشط',
                        color: category.isActive
                            ? const Color(0xFF159B68)
                            : colors.error,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(width: 5),

            PopupMenuButton<String>(
              enabled: !isOperationInProgress,
              tooltip: 'إجراءات التصنيف',
              onSelected: (value) {
                switch (value) {
                  case 'edit':
                    onEdit();
                    break;
                  case 'delete':
                    onDelete();
                    break;
                  case 'child':
                    if (!isChild) onAddChild();
                    break;
                }
              },
              itemBuilder: (_) => [
                const PopupMenuItem(
                  value: 'edit',
                  child: ListTile(
                    leading: Icon(Icons.edit_outlined),
                    title: Text('تعديل'),
                    dense: true,
                  ),
                ),
                if (!isChild)
                  const PopupMenuItem(
                    value: 'child',
                    child: ListTile(
                      leading: Icon(Icons.add_circle_outline),
                      title: Text('إضافة تصنيف فرعي'),
                      dense: true,
                    ),
                  ),
                const PopupMenuItem(
                  value: 'delete',
                  child: ListTile(
                    leading: Icon(
                      Icons.delete_outline,
                      color: Colors.red,
                    ),
                    title: Text(
                      'حذف',
                      style: TextStyle(color: Colors.red),
                    ),
                    dense: true,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// =========================================================
// CATEGORY TAG
// =========================================================

class _CategoryTag extends StatelessWidget {
  final String label;
  final Color color;

  const _CategoryTag({
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 3,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

// =========================================================
// CATEGORY FORM DIALOG
// =========================================================

class _CategoryFormDialog extends StatefulWidget {
  final Category? category;
  final List<Category> rootCategories;
  final int? initialParentId;

  const _CategoryFormDialog({
    this.category,
    required this.rootCategories,
    this.initialParentId,
  });

  @override
  State<_CategoryFormDialog> createState() =>
      _CategoryFormDialogState();
}

class _CategoryFormDialogState
    extends State<_CategoryFormDialog> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _sortOrderController;

  int? _parentId;
  late bool _isActive;

  bool get _isEditing => widget.category != null;

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

    _parentId = category?.parentId ?? widget.initialParentId;
    _isActive = category?.isActive ?? true;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _sortOrderController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final existing = widget.category;

    final category = Category(
      id: existing?.id ?? 0,
      name: _nameController.text.trim(),
      description: _descriptionController.text.trim().isEmpty
          ? null
          : _descriptionController.text.trim(),
      parentId: _parentId,
      imagePath: existing?.imagePath,
      isActive: _isActive,
      sortOrder: int.tryParse(_sortOrderController.text) ?? 0,
    );

    Navigator.of(context).pop(category);
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final availableParents = widget.rootCategories
        .where(
          (item) => item.id != widget.category?.id,
        )
        .toList();

    final validParent = _parentId == null ||
        availableParents.any((item) => item.id == _parentId);

    return AlertDialog(
      title: Row(
        children: [
          Icon(
            _isEditing
                ? Icons.edit_rounded
                : Icons.add_circle_outline_rounded,
            color: colors.primary,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              _isEditing
                  ? 'تعديل التصنيف'
                  : 'إضافة تصنيف جديد',
            ),
          ),
        ],
      ),
      content: SizedBox(
        width: 430,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Name
                TextFormField(
                  controller: _nameController,
                  autofocus: true,
                  textDirection: TextDirection.rtl,
                  decoration: const InputDecoration(
                    labelText: 'اسم التصنيف',
                    hintText: 'مثال: المواد الغذائية',
                    prefixIcon: Icon(Icons.category_outlined),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'يرجى إدخال اسم التصنيف';
                    }

                    if (value.trim().length < 2) {
                      return 'اسم التصنيف قصير جداً';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 15),

                // Description
                TextFormField(
                  controller: _descriptionController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'الوصف',
                    hintText: 'وصف اختياري للتصنيف',
                    prefixIcon: Icon(Icons.description_outlined),
                    alignLabelWithHint: true,
                  ),
                ),

                const SizedBox(height: 15),

                // Parent
                DropdownButtonFormField<int?>(
                  value: validParent ? _parentId : null,
                  isExpanded: true,
                  decoration: const InputDecoration(
                    labelText: 'التصنيف الأب',
                    prefixIcon: Icon(Icons.account_tree_outlined),
                  ),
                  items: [
                    const DropdownMenuItem<int?>(
                      value: null,
                      child: Text('تصنيف رئيسي (بدون أب)'),
                    ),
                    ...availableParents.map(
                      (parent) => DropdownMenuItem<int?>(
                        value: parent.id,
                        child: Text(
                          parent.name,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _parentId = value;
                    });
                  },
                ),

                const SizedBox(height: 15),

                // Sort order
                TextFormField(
                  controller: _sortOrderController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'ترتيب العرض',
                    prefixIcon: Icon(Icons.sort_rounded),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'يرجى إدخال ترتيب العرض';
                    }

                    if (int.tryParse(value) == null ||
                        int.parse(value) < 0) {
                      return 'أدخل رقماً صحيحاً موجباً';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 12),

                // Active status
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  value: _isActive,
                  onChanged: (value) {
                    setState(() {
                      _isActive = value;
                    });
                  },
                  title: const Text(
                    'التصنيف نشط',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    _isActive
                        ? 'التصنيف متاح للاستخدام'
                        : 'التصنيف غير نشط',
                    style: TextStyle(
                      color: colors.onSurfaceVariant,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('إلغاء'),
        ),
        FilledButton.icon(
          onPressed: _submit,
          icon: Icon(
            _isEditing
                ? Icons.save_rounded
                : Icons.add_rounded,
          ),
          label: Text(
            _isEditing ? 'حفظ التعديلات' : 'إضافة التصنيف',
          ),
        ),
      ],
    );
  }
}
