
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/router/app_navigation.dart';
import '../../domain/entities/product/product.dart';
import '../bloc/products_bloc.dart';
import '../bloc/products_event.dart';
import '../bloc/products_state.dart';


class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      final bloc = context.read<ProductsBloc>();

      bloc.add(const ProductsEvent.load());
      bloc.add(const ProductsEvent.watch());
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _search(String value) {
    context.read<ProductsBloc>().add(
          ProductsEvent.search(value),
        );
  }

  Future<void> _refresh() async {
    final bloc = context.read<ProductsBloc>();

    bloc.add(const ProductsEvent.load());

    await bloc.stream.firstWhere(
      (state) => state.status != ProductsStatus.loading,
    );
  }

  void _clearFilters() {
    _searchController.clear();

    context.read<ProductsBloc>().add(
          const ProductsEvent.clearFilters(),
        );
  }

  Future<void> _confirmDelete(Product product) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          icon: const Icon(
            Icons.delete_outline_rounded,
            color: Colors.red,
            size: 34,
          ),
          title: const Text('حذف المنتج'),
          content: Text(
            'هل أنت متأكد من حذف المنتج "${product.name}"؟',
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext, false),
              child: const Text('إلغاء'),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () => Navigator.pop(dialogContext, true),
              child: const Text('حذف'),
            ),
          ],
        );
      },
    );

    if (confirmed == true && mounted) {
      context.read<ProductsBloc>().add(
            ProductsEvent.delete(product.id),
          );
    }
  }

  void _showProductActions(Product product) {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (sheetContext) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.visibility_outlined),
                  title: const Text('عرض التفاصيل'),
                  onTap: () {
                    Navigator.pop(sheetContext);
                    AppNavigation.productDetails(
                      context,
                      product.id,
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.edit_outlined),
                  title: const Text('تعديل المنتج'),
                  onTap: () {
                    Navigator.pop(sheetContext);
                    AppNavigation.editProduct(
                      context,
                      product.id,
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.delete_outline_rounded,
                    color: Colors.red,
                  ),
                  title: const Text(
                    'حذف المنتج',
                    style: TextStyle(color: Colors.red),
                  ),
                  onTap: () {
                    Navigator.pop(sheetContext);
                    _confirmDelete(product);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BlocConsumer<ProductsBloc, ProductsState>(
      listenWhen: (previous, current) =>
          previous.successMessage != current.successMessage ||
          previous.errorMessage != current.errorMessage,
      listener: (context, state) {
        final message = state.successMessage ?? state.errorMessage;

        if (message == null || message.isEmpty) return;

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text(message),
              behavior: SnackBarBehavior.floating,
              backgroundColor: state.errorMessage != null
                  ? colors.error
                  : colors.primary,
            ),
          );
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: colors.surface,
          body: SafeArea(
            child: RefreshIndicator(
              onRefresh: _refresh,
              child: CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: _buildHeader(context),
                  ),
                  SliverToBoxAdapter(
                    child: _buildStatistics(context, state),
                  ),
                  SliverToBoxAdapter(
                    child: _buildSearch(context, state),
                  ),
                  SliverToBoxAdapter(
                    child: _buildActiveFilters(context, state),
                  ),
                  SliverToBoxAdapter(
                    child: _buildSectionHeader(context, state),
                  ),
                  _buildProductsContent(context, state),
                  const SliverToBoxAdapter(
                    child: SizedBox(height: 100),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () => AppNavigation.addProduct(context),
            icon: const Icon(Icons.add_rounded),
            label: const Text('إضافة منتج'),
          ),
        );
      },
    );
  }

  // HEADER

  Widget _buildHeader(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: colors.primaryContainer,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              Icons.inventory_2_outlined,
              color: colors.primary,
              size: 25,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'المنتجات',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                ),
                const SizedBox(height: 3),
                Text(
                  'إدارة ومتابعة منتجات المتجر',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                ),
              ],
            ),
          ),
          IconButton.filledTonal(
            tooltip: 'إدارة التصنيفات',
            onPressed: () => AppNavigation.categories(context),
            icon: const Icon(Icons.category_outlined),
          ),
          const SizedBox(width: 6),
          IconButton.filledTonal(
            tooltip: 'تحديث',
            onPressed: () {
              context.read<ProductsBloc>().add(
                    const ProductsEvent.load(),
                  );
            },
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
    );
  }

  // STATISTICS

  Widget _buildStatistics(
    BuildContext context,
    ProductsState state,
  ) {
    final products = state.products;

    final activeCount = products.where((p) => p.isActive).length;

    final lowStockCount = products
        .where((p) => p.quantity <= p.minStock)
        .length;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: Row(
        children: [
          Expanded(
            child: _StatisticCard(
              title: 'المنتجات',
              value: products.length.toString(),
              icon: Icons.inventory_2_outlined,
              color: Colors.blue,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: _StatisticCard(
              title: 'نشطة',
              value: activeCount.toString(),
              icon: Icons.check_circle_outline_rounded,
              color: Colors.green,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: _StatisticCard(
              title: 'مخزون منخفض',
              value: lowStockCount.toString(),
              icon: Icons.warning_amber_rounded,
              color: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }

  // SEARCH

  Widget _buildSearch(
    BuildContext context,
    ProductsState state,
  ) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          TextField(
            controller: _searchController,
            textInputAction: TextInputAction.search,
            onChanged: _search,
            decoration: InputDecoration(
              hintText: 'ابحث عن اسم المنتج...',
              prefixIcon: const Icon(Icons.search_rounded),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        _searchController.clear();
                        _search('');
                      },
                      icon: const Icon(Icons.close_rounded),
                    )
                  : null,
              filled: true,
              fillColor: colors.surfaceContainerHighest.withValues(
                alpha: 0.45,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: colors.outlineVariant.withValues(alpha: 0.5),
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 15,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => AppNavigation.categories(context),
                  icon: const Icon(Icons.category_outlined),
                  label: const Text('التصنيفات'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _clearFilters,
                  icon: const Icon(Icons.filter_alt_off_outlined),
                  label: const Text('مسح الفلاتر'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // FILTERS

  Widget _buildActiveFilters(
    BuildContext context,
    ProductsState state,
  ) {
    final hasCategory = state.selectedCategoryId != null;
    final hasBrand = state.selectedBrandId != null;
    final hasSearch = state.searchQuery.isNotEmpty;

    if (!hasCategory && !hasBrand && !hasSearch) {
      return const SizedBox(height: 8);
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          if (hasSearch)
            InputChip(
              label: Text('البحث: ${state.searchQuery}'),
              onDeleted: () {
                _searchController.clear();
                _search('');
              },
            ),
          if (hasCategory)
            InputChip(
              label: Text('التصنيف رقم ${state.selectedCategoryId}'),
              onDeleted: _clearFilters,
            ),
          if (hasBrand)
            InputChip(
              label: Text('العلامة التجارية رقم ${state.selectedBrandId}'),
              onDeleted: _clearFilters,
            ),
        ],
      ),
    );
  }

  // SECTION HEADER

  Widget _buildSectionHeader(
    BuildContext context,
    ProductsState state,
  ) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'قائمة المنتجات',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
            ),
          ),
          Text(
            '${state.productsCount} منتج',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
          ),
          if (state.isWatching) ...[
            const SizedBox(width: 8),
            Icon(
              Icons.sync_rounded,
              size: 16,
              color: colors.primary,
            ),
          ],
        ],
      ),
    );
  }

  // PRODUCTS CONTENT

  Widget _buildProductsContent(
    BuildContext context,
    ProductsState state,
  ) {
    if (state.isLoading && state.products.isEmpty) {
      return const SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (state.status == ProductsStatus.failure &&
        state.products.isEmpty) {
      return SliverFillRemaining(
        hasScrollBody: false,
        child: _ErrorView(
          message: state.errorMessage ?? 'حدث خطأ أثناء تحميل المنتجات',
          onRetry: () {
            context.read<ProductsBloc>().add(
                  const ProductsEvent.load(),
                );
          },
        ),
      );
    }

    if (state.products.isEmpty) {
      return SliverFillRemaining(
        hasScrollBody: false,
        child: _EmptyProductsView(
          hasSearch: state.searchQuery.isNotEmpty,
          onClear: _clearFilters,
          onAdd: () => AppNavigation.addProduct(context),
        ),
      );
    }

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverLayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.crossAxisExtent;

          final count = width >= 1100
              ? 4
              : width >= 700
                  ? 3
                  : width >= 450
                      ? 2
                      : 1;

          if (count == 1) {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final product = state.products[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _ProductListCard(
                      product: product,
                      onTap: () => AppNavigation.productDetails(
                        context,
                        product.id,
                      ),
                      onMore: () => _showProductActions(product),
                    ),
                  );
                },
                childCount: state.products.length,
              ),
            );
          }

          return SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final product = state.products[index];

                return _ProductGridCard(
                  product: product,
                  onTap: () => AppNavigation.productDetails(
                    context,
                    product.id,
                  ),
                  onMore: () => _showProductActions(product),
                );
              },
              childCount: state.products.length,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: count,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              mainAxisExtent: 270,
            ),
          );
        },
      ),
    );
  }
}

// =============================================================
// STATISTIC CARD
// =============================================================

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
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colors.outlineVariant.withValues(alpha: 0.5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 21),
          const SizedBox(height: 10),
          Text(
            value,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
          ),
          const SizedBox(height: 3),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
          ),
        ],
      ),
    );
  }
}

// =============================================================
// PRODUCT GRID CARD
// =============================================================

class _ProductGridCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;
  final VoidCallback onMore;

  const _ProductGridCard({
    required this.product,
    required this.onTap,
    required this.onMore,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isLowStock = product.quantity <= product.minStock;

    return Material(
      color: colors.surfaceContainerLow,
      borderRadius: BorderRadius.circular(18),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      color: colors.surfaceContainerHighest.withValues(
                        alpha: 0.45,
                      ),
                      child: Icon(
                        Icons.inventory_2_outlined,
                        size: 54,
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: _StatusBadge(
                      label: product.isActive ? 'نشط' : 'غير نشط',
                      color: product.isActive ? Colors.green : Colors.grey,
                    ),
                  ),
                  Positioned(
                    top: 4,
                    left: 4,
                    child: IconButton(
                      onPressed: onMore,
                      icon: const Icon(Icons.more_vert_rounded),
                    ),
                  ),
                  if (isLowStock)
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: _StatusBadge(
                        label: 'مخزون منخفض',
                        color: Colors.orange,
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    _productTypeLabel(product.productType),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: colors.onSurfaceVariant,
                        ),
                  ),
                  const SizedBox(height: 9),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '${product.salePrice.toStringAsFixed(2)} د.ل',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: colors.primary,
                                fontWeight: FontWeight.w900,
                              ),
                        ),
                      ),
                      Text(
                        '${product.quantity} ${product.baseUnit}',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: isLowStock
                                  ? Colors.orange
                                  : colors.onSurfaceVariant,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =============================================================
// PRODUCT LIST CARD
// =============================================================

class _ProductListCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;
  final VoidCallback onMore;

  const _ProductListCard({
    required this.product,
    required this.onTap,
    required this.onMore,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isLowStock = product.quantity <= product.minStock;

    return Material(
      color: colors.surfaceContainerLow,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                width: 68,
                height: 68,
                decoration: BoxDecoration(
                  color: colors.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: const Icon(
                  Icons.inventory_2_outlined,
                  size: 30,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      _productTypeLabel(product.productType),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: colors.onSurfaceVariant,
                          ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '${product.salePrice.toStringAsFixed(2)} د.ل',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: colors.primary,
                            fontWeight: FontWeight.w900,
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'المخزون',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  Text(
                    '${product.quantity} ${product.baseUnit}',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w800,
                          color: isLowStock ? Colors.orange : null,
                        ),
                  ),
                  IconButton(
                    onPressed: onMore,
                    icon: const Icon(Icons.more_vert_rounded),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// =============================================================
// STATUS BADGE
// =============================================================

class _StatusBadge extends StatelessWidget {
  final String label;
  final Color color;

  const _StatusBadge({
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 9,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 10,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

// =============================================================
// EMPTY VIEW
// =============================================================

class _EmptyProductsView extends StatelessWidget {
  final bool hasSearch;
  final VoidCallback onClear;
  final VoidCallback onAdd;

  const _EmptyProductsView({
    required this.hasSearch,
    required this.onClear,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: colors.primaryContainer,
                shape: BoxShape.circle,
              ),
              child: Icon(
                hasSearch
                    ? Icons.search_off_rounded
                    : Icons.inventory_2_outlined,
                size: 45,
                color: colors.primary,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              hasSearch ? 'لا توجد نتائج' : 'لا توجد منتجات حتى الآن',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              hasSearch
                  ? 'جرّب تغيير عبارة البحث أو إزالة الفلاتر'
                  : 'ابدأ بإضافة أول منتج إلى مخزون متجرك',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
            ),
            const SizedBox(height: 20),
            if (hasSearch)
              OutlinedButton.icon(
                onPressed: onClear,
                icon: const Icon(Icons.filter_alt_off_outlined),
                label: const Text('إزالة البحث والفلاتر'),
              )
            else
              FilledButton.icon(
                onPressed: onAdd,
                icon: const Icon(Icons.add_rounded),
                label: const Text('إضافة أول منتج'),
              ),
          ],
        ),
      ),
    );
  }
}

// =============================================================
// ERROR VIEW
// =============================================================

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorView({
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline_rounded,
              size: 54,
              color: colors.error,
            ),
            const SizedBox(height: 16),
            Text(
              'تعذر تحميل المنتجات',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 18),
            FilledButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('إعادة المحاولة'),
            ),
          ],
        ),
      ),
    );
  }
}

// =============================================================
// PRODUCT TYPE LABEL
// =============================================================

String _productTypeLabel(String type) {
  switch (type.toLowerCase()) {
    case 'simple':
      return 'منتج عادي';
    case 'variable':
      return 'منتج متعدد الوحدات';
    case 'service':
      return 'خدمة';
    case 'composite':
      return 'منتج مركب';
    default:
      return type;
  }
}
