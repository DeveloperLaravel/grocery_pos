
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/theme/app_colors.dart';
import '../../../domain/entities/parties/brand.dart';
import '../../bloc/brands/brands_bloc.dart';
import '../../bloc/brands/brands_event.dart';
import '../../bloc/brands/brands_state.dart';

class BrandsPage extends StatefulWidget {
  const BrandsPage({super.key});

  @override
  State<BrandsPage> createState() => _BrandsPageState();
}

class _BrandsPageState extends State<BrandsPage> {
  final TextEditingController _searchController =
      TextEditingController();

  String _searchQuery = '';
  String _filter = 'all';

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      final bloc = context.read<BrandsBloc>();
      bloc.add(const LoadBrands());
      bloc.add(const WatchBrands());
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Brand> _filteredBrands(List<Brand> brands) {
    return brands.where((brand) {
      final matchesSearch =
          brand.name.toLowerCase().contains(
                _searchQuery.toLowerCase(),
              ) ||
          (brand.description ?? '')
              .toLowerCase()
              .contains(_searchQuery.toLowerCase());

      final matchesFilter = switch (_filter) {
        'active' => brand.isActive,
        'inactive' => !brand.isActive,
        _ => true,
      };

      return matchesSearch && matchesFilter;
    }).toList();
  }

  void _showMessage(
    BuildContext context,
    String message, {
    required bool isError,
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: isError
              ? AppColors.error
              : AppColors.success,
        ),
      );
  }

  Future<void> _showBrandForm({
    Brand? brand,
  }) async {
    final result = await showDialog<Brand>(
      context: context,
      barrierDismissible: false,
      builder: (_) => BrandFormDialog(brand: brand),
    );

    if (!mounted || result == null) return;

    final bloc = context.read<BrandsBloc>();

    if (brand == null) {
      bloc.add(CreateBrand(result));
    } else {
      bloc.add(
        UpdateBrand(
          id: brand.id,
          brand: result,
        ),
      );
    }
  }

  Future<void> _deleteBrand(Brand brand) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          icon: const Icon(
            Icons.delete_outline_rounded,
            color: AppColors.error,
            size: 38,
          ),
          title: const Text('حذف العلامة التجارية'),
          content: Text(
            'هل أنت متأكد من حذف العلامة التجارية "${brand.name}"؟',
          ),
          actions: [
            TextButton(
              onPressed: () =>
                  Navigator.pop(dialogContext, false),
              child: const Text('إلغاء'),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.error,
              ),
              onPressed: () =>
                  Navigator.pop(dialogContext, true),
              child: const Text('حذف'),
            ),
          ],
        );
      },
    );

    if (confirmed == true && mounted) {
      context.read<BrandsBloc>().add(
            DeleteBrand(brand.id),
          );
    }
  }

  void _toggleBrand(Brand brand, bool value) {
    context.read<BrandsBloc>().add(
          UpdateBrand(
            id: brand.id,
            brand: Brand(
              id: brand.id,
              name: brand.name,
              description: brand.description,
              imagePath: brand.imagePath,
              isActive: value,
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: SafeArea(
          child: BlocConsumer<BrandsBloc, BrandsState>(
            listenWhen: (previous, current) =>
                previous.successMessage != current.successMessage ||
                previous.errorMessage != current.errorMessage,
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
              final brands = _filteredBrands(state.brands);

              return CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(
                      20, 20, 20, 12,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: _buildHeader(context),
                    ),
                  ),

                  // Statistics
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: _buildStatistics(state),
                    ),
                  ),

                  // Search
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(
                      20, 24, 20, 12,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: _buildSearch(),
                    ),
                  ),

                  // Filters
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: _buildFilters(),
                    ),
                  ),

                  // Loading
                  if (state.isLoading && state.brands.isEmpty)
                    const SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )

                  // Error
                  else if (state.errorMessage != null &&
                      state.brands.isEmpty)
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: _buildError(context),
                    )

                  // Empty
                  else if (brands.isEmpty)
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: _buildEmpty(context),
                    )

                  // Brands
                  else
                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(
                        20, 18, 20, 30,
                      ),
                      sliver: SliverLayoutBuilder(
                        builder: (context, constraints) {
                          final width =
                              constraints.crossAxisExtent;

                          final crossAxisCount = width >= 1000
                              ? 4
                              : width >= 650
                                  ? 3
                                  : width >= 450
                                      ? 2
                                      : 1;

                          return SliverGrid(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: crossAxisCount,
                              crossAxisSpacing: 14,
                              mainAxisSpacing: 14,
                              mainAxisExtent: 190,
                            ),
                            delegate:
                                SliverChildBuilderDelegate(
                              (context, index) {
                                final brand = brands[index];

                                return BrandCard(
                                  brand: brand,
                                  isBusy:
                                      state.isOperationInProgress,
                                  onEdit: () =>
                                      _showBrandForm(brand: brand),
                                  onDelete: () =>
                                      _deleteBrand(brand),
                                  onToggle: (value) =>
                                      _toggleBrand(brand, value),
                                );
                              },
                              childCount: brands.length,
                            ),
                          );
                        },
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  // =====================================================
  // HEADER
  // =====================================================

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Container(
          width: 54,
          height: 54,
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withValues(
              alpha: 0.12,
            ),
            borderRadius: BorderRadius.circular(17),
          ),
          child: Icon(
            Icons.branding_watermark_rounded,
            color: theme.colorScheme.primary,
            size: 28,
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'العلامات التجارية',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                'إدارة وتنظيم العلامات التجارية للمنتجات',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        FilledButton.icon(
          onPressed: () => _showBrandForm(),
          icon: const Icon(Icons.add_rounded),
          label: const Text('إضافة'),
        ),
      ],
    );
  }

  // =====================================================
  // STATISTICS
  // =====================================================

  Widget _buildStatistics(BrandsState state) {
    return Row(
      children: [
        Expanded(
          child: _StatCard(
            title: 'إجمالي العلامات',
            value: state.totalBrands.toString(),
            icon: Icons.storefront_rounded,
            color: AppColors.info,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _StatCard(
            title: 'النشطة',
            value: state.activeBrands.toString(),
            icon: Icons.check_circle_outline_rounded,
            color: AppColors.success,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _StatCard(
            title: 'غير النشطة',
            value: state.inactiveBrands.toString(),
            icon: Icons.pause_circle_outline_rounded,
            color: AppColors.warning,
          ),
        ),
      ],
    );
  }

  // =====================================================
  // SEARCH
  // =====================================================

  Widget _buildSearch() {
    final theme = Theme.of(context);

    return TextField(
      controller: _searchController,
      onChanged: (value) {
        setState(() => _searchQuery = value.trim());
      },
      decoration: InputDecoration(
        hintText: 'ابحث عن علامة تجارية...',
        prefixIcon: const Icon(Icons.search_rounded),
        suffixIcon: _searchQuery.isNotEmpty
            ? IconButton(
                onPressed: () {
                  _searchController.clear();
                  setState(() => _searchQuery = '');
                },
                icon: const Icon(Icons.close_rounded),
              )
            : null,
        filled: true,
        fillColor: theme.colorScheme.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: theme.colorScheme.outlineVariant,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: theme.colorScheme.outlineVariant,
          ),
        ),
      ),
    );
  }

  // =====================================================
  // FILTERS
  // =====================================================

  Widget _buildFilters() {
    final filters = [
      ('all', 'الكل'),
      ('active', 'النشطة'),
      ('inactive', 'غير النشطة'),
    ];

    return Wrap(
      spacing: 8,
      children: filters.map((filter) {
        final selected = _filter == filter.$1;

        return ChoiceChip(
          label: Text(filter.$2),
          selected: selected,
          onSelected: (_) {
            setState(() => _filter = filter.$1);
          },
        );
      }).toList(),
    );
  }

  // =====================================================
  // EMPTY STATE
  // =====================================================

  Widget _buildEmpty(BuildContext context) {
    final theme = Theme.of(context);

    final hasFilters =
        _searchQuery.isNotEmpty || _filter != 'all';

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.branding_watermark_outlined,
              size: 65,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: 16),
            Text(
              hasFilters
                  ? 'لا توجد نتائج مطابقة'
                  : 'لا توجد علامات تجارية',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              hasFilters
                  ? 'جرب تغيير كلمات البحث أو الفلتر'
                  : 'ابدأ بإضافة أول علامة تجارية',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            if (!hasFilters) ...[
              const SizedBox(height: 20),
              FilledButton.icon(
                onPressed: () => _showBrandForm(),
                icon: const Icon(Icons.add),
                label: const Text('إضافة علامة تجارية'),
              ),
            ],
          ],
        ),
      ),
    );
  }

  // =====================================================
  // ERROR STATE
  // =====================================================

  Widget _buildError(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.error_outline_rounded,
              color: AppColors.error,
              size: 55,
            ),
            const SizedBox(height: 12),
            const Text('حدث خطأ أثناء تحميل العلامات التجارية'),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: () {
                context.read<BrandsBloc>()
                  ..add(const LoadBrands())
                  ..add(const WatchBrands());
              },
              icon: const Icon(Icons.refresh),
              label: const Text('إعادة المحاولة'),
            ),
          ],
        ),
      ),
    );
  }
}

// =========================================================
// STAT CARD
// =========================================================

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: theme.colorScheme.outlineVariant,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 22),
          const SizedBox(height: 10),
          Text(
            value,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}

// =========================================================
// BRAND CARD
// =========================================================

class BrandCard extends StatelessWidget {
  final Brand brand;
  final bool isBusy;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final ValueChanged<bool> onToggle;

  const BrandCard({
    super.key,
    required this.brand,
    required this.isBusy,
    required this.onEdit,
    required this.onDelete,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final active = brand.isActive;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: theme.colorScheme.outlineVariant,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _BrandImage(imagePath: brand.imagePath),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  brand.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              PopupMenuButton<String>(
                enabled: !isBusy,
                icon: const Icon(Icons.more_vert_rounded),
                onSelected: (value) {
                  if (value == 'edit') onEdit();
                  if (value == 'delete') onDelete();
                },
                itemBuilder: (_) => const [
                  PopupMenuItem(
                    value: 'edit',
                    child: Row(
                      children: [
                        Icon(Icons.edit_outlined),
                        SizedBox(width: 10),
                        Text('تعديل'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'delete',
                    child: Row(
                      children: [
                        Icon(
                          Icons.delete_outline,
                          color: AppColors.error,
                        ),
                        SizedBox(width: 10),
                        Text('حذف'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Align(
              alignment: Alignment.topRight,
              child: Text(
                (brand.description == null ||
                        brand.description!.trim().isEmpty)
                    ? 'لا يوجد وصف لهذه العلامة التجارية'
                    : brand.description!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
          const Divider(height: 14),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 9,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: (active
                          ? AppColors.success
                          : AppColors.warning)
                      .withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  active ? 'نشطة' : 'غير نشطة',
                  style: TextStyle(
                    color: active
                        ? AppColors.success
                        : AppColors.warning,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                'تفعيل',
                style: theme.textTheme.bodySmall,
              ),
              Switch.adaptive(
                value: active,
                onChanged: isBusy ? null : onToggle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// =========================================================
// BRAND IMAGE
// =========================================================

class _BrandImage extends StatelessWidget {
  final String? imagePath;

  const _BrandImage({this.imagePath});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: 48,
      height: 48,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withValues(
          alpha: 0.10,
        ),
        borderRadius: BorderRadius.circular(13),
      ),
      child: imagePath != null && imagePath!.trim().isNotEmpty
          ? Image.network(
              imagePath!,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => _placeholder(),
            )
          : _placeholder(),
    );
  }

  Widget _placeholder() {
    return const Icon(
      Icons.storefront_rounded,
      color: AppColors.primary,
      size: 25,
    );
  }
}

// =========================================================
// BRAND FORM DIALOG
// =========================================================

class BrandFormDialog extends StatefulWidget {
  final Brand? brand;

  const BrandFormDialog({
    super.key,
    this.brand,
  });

  @override
  State<BrandFormDialog> createState() =>
      _BrandFormDialogState();
}

class _BrandFormDialogState extends State<BrandFormDialog> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _imageController;

  late bool _isActive;

  bool get isEditing => widget.brand != null;

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

    _imageController = TextEditingController(
      text: brand?.imagePath ?? '',
    );

    _isActive = brand?.isActive ?? true;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _imageController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final brand = widget.brand;

    Navigator.pop(
      context,
      Brand(
        id: brand?.id ?? 0,
        name: _nameController.text.trim(),
        description: _descriptionController.text.trim().isEmpty
            ? null
            : _descriptionController.text.trim(),
        imagePath: _imageController.text.trim().isEmpty
            ? null
            : _imageController.text.trim(),
        isActive: _isActive,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        title: Row(
          children: [
            Icon(
              isEditing
                  ? Icons.edit_rounded
                  : Icons.add_business_rounded,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                isEditing
                    ? 'تعديل العلامة التجارية'
                    : 'إضافة علامة تجارية',
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
                  TextFormField(
                    controller: _nameController,
                    autofocus: true,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: 'اسم العلامة التجارية',
                      hintText: 'مثال: Samsung',
                      prefixIcon: Icon(Icons.storefront_outlined),
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.trim().isEmpty) {
                        return 'يرجى إدخال اسم العلامة التجارية';
                      }

                      if (value.trim().length < 2) {
                        return 'يجب ألا يقل الاسم عن حرفين';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: _descriptionController,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      labelText: 'الوصف',
                      hintText: 'وصف مختصر للعلامة التجارية',
                      prefixIcon: Icon(Icons.description_outlined),
                      alignLabelWithHint: true,
                    ),
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: _imageController,
                    decoration: const InputDecoration(
                      labelText: 'مسار الصورة أو رابطها',
                      hintText: 'https://example.com/logo.png',
                      prefixIcon: Icon(Icons.image_outlined),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('علامة تجارية نشطة'),
                    subtitle: const Text(
                      'تحديد إمكانية استخدام هذه العلامة',
                    ),
                    value: _isActive,
                    onChanged: (value) {
                      setState(() => _isActive = value);
                    },
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
              isEditing ? Icons.save_rounded : Icons.add_rounded,
            ),
            label: Text(
              isEditing ? 'حفظ التعديلات' : 'إضافة العلامة',
            ),
          ),
        ],
      ),
    );
  }
}
