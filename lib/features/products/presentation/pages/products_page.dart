
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/router/app_navigation.dart';
import '../../domain/entities/product.dart';
import '../bloc/products_bloc.dart';
import '../bloc/products_event.dart';
import '../bloc/products_state.dart';
import '../widgets/product_ui_helpers.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final _searchController = TextEditingController();
  bool _gridView = true;
  String _filter = 'all';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Product> _filteredProducts(ProductsState state) {
    final products = state.products;

    switch (_filter) {
      case 'active':
        return products.where((p) => p.isActive).toList();
      case 'inactive':
        return products.where((p) => !p.isActive).toList();
      case 'low':
        return products.where((p) => p.isLowStock).toList();
      default:
        return products;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsBloc, ProductsState>(
      listenWhen: (previous, current) =>
          previous.errorMessage != current.errorMessage ||
          previous.successMessage != current.successMessage,
      listener: (context, state) {
        final message = state.errorMessage ?? state.successMessage;

        if (message != null && message.isNotEmpty) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: state.hasError
                    ? Theme.of(context).colorScheme.error
                    : Theme.of(context).colorScheme.primary,
              ),
            );

          context.read<ProductsBloc>().add(
                const ProductsEvent.clearMessages(),
              );
        }
      },
      builder: (context, state) {
        final products = _filteredProducts(state);

        final total = state.allProducts.length;
        final active = state.allProducts.where((p) => p.isActive).length;
        final lowStock = state.allProducts.where((p) => p.isLowStock).length;

        return Scaffold(
          appBar: AppBar(
            title: const Text('المنتجات'),
            actions: [
              IconButton(
                tooltip: 'تحديث',
                onPressed: () {
                  context.read<ProductsBloc>().add(
                        const ProductsEvent.loadAll(),
                      );
                },
                icon: const Icon(Icons.refresh_rounded),
              ),
              const SizedBox(width: 8),
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () => AppNavigation.addProduct(context),
            icon: const Icon(Icons.add_rounded),
            label: const Text('إضافة منتج'),
          ),
          body: SafeArea(
            child: RefreshIndicator(
              onRefresh: () async {
                context.read<ProductsBloc>().add(
                      const ProductsEvent.loadAll(),
                    );
                await Future<void>.delayed(
                  const Duration(milliseconds: 500),
                );
              },
              child: CustomScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
                    sliver: SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'إدارة المخزون',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'تابع منتجاتك وأسعارك وكميات المخزون بسهولة',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                ),
                          ),
                          const SizedBox(height: 18),
                          LayoutBuilder(
                            builder: (context, constraints) {
                              final width = (constraints.maxWidth - 12) / 2;

                              return Wrap(
                                spacing: 12,
                                runSpacing: 12,
                                children: [
                                  SizedBox(
                                    width: width,
                                    child: ProductUi.statCard(
                                      context: context,
                                      title: 'إجمالي المنتجات',
                                      value: '$total',
                                      icon: Icons.inventory_2_outlined,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary,
                                    ),
                                  ),
                                  SizedBox(
                                    width: width,
                                    child: ProductUi.statCard(
                                      context: context,
                                      title: 'المنتجات النشطة',
                                      value: '$active',
                                      icon: Icons.check_circle_outline,
                                      color: Colors.green,
                                    ),
                                  ),
                                  SizedBox(
                                    width: width,
                                    child: ProductUi.statCard(
                                      context: context,
                                      title: 'مخزون منخفض',
                                      value: '$lowStock',
                                      icon: Icons.warning_amber_rounded,
                                      color: Colors.orange,
                                    ),
                                  ),
                                  SizedBox(
                                    width: width,
                                    child: ProductUi.statCard(
                                      context: context,
                                      title: 'غير نشطة',
                                      value: '${total - active}',
                                      icon: Icons.pause_circle_outline,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                          const SizedBox(height: 20),
                          TextField(
                            controller: _searchController,
                            onChanged: (value) {
                              context.read<ProductsBloc>().add(
                                    ProductsEvent.search(value),
                                  );
                            },
                            decoration: ProductUi.input(
                              label: 'البحث عن منتج',
                              hint: 'الاسم أو الباركود...',
                              icon: Icons.search_rounded,
                              suffix: _searchController.text.isEmpty
                                  ? null
                                  : IconButton(
                                      onPressed: () {
                                        _searchController.clear();
                                        context.read<ProductsBloc>().add(
                                              const ProductsEvent.search(''),
                                            );
                                        setState(() {});
                                      },
                                      icon: const Icon(Icons.close_rounded),
                                    ),
                            ),
                          ),
                          const SizedBox(height: 14),
                          Row(
                            children: [
                              Expanded(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      _filterChip('الكل', 'all'),
                                      _filterChip('نشطة', 'active'),
                                      _filterChip('غير نشطة', 'inactive'),
                                      _filterChip('مخزون منخفض', 'low'),
                                    ],
                                  ),
                                ),
                              ),
                              IconButton(
                                tooltip: 'عرض شبكي',
                                onPressed: () =>
                                    setState(() => _gridView = true),
                                isSelected: _gridView,
                                icon: const Icon(Icons.grid_view_rounded),
                              ),
                              IconButton(
                                tooltip: 'عرض قائمة',
                                onPressed: () =>
                                    setState(() => _gridView = false),
                                isSelected: !_gridView,
                                icon: const Icon(Icons.view_list_rounded),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          ProductUi.sectionTitle(
                            context,
                            'قائمة المنتجات',
                            subtitle: '${products.length} منتج',
                          ),
                          const SizedBox(height: 12),
                        ],
                      ),
                    ),
                  ),
                  if (state.isLoading && state.allProducts.isEmpty)
                    const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    )
                  else if (products.isEmpty)
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: ProductUi.emptyState(
                        context: context,
                        icon: Icons.inventory_2_outlined,
                        title: state.searchQuery.isNotEmpty
                            ? 'لا توجد نتائج'
                            : 'لا توجد منتجات بعد',
                        subtitle: state.searchQuery.isNotEmpty
                            ? 'جرّب البحث بكلمات مختلفة'
                            : 'ابدأ بإضافة أول منتج إلى مخزونك',
                        action: state.searchQuery.isEmpty
                            ? FilledButton.icon(
                                onPressed: () =>
                                    AppNavigation.addProduct(context),
                                icon: const Icon(Icons.add),
                                label: const Text('إضافة منتج'),
                              )
                            : null,
                      ),
                    )
                  else if (_gridView)
                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
                      sliver: SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => _ProductGridCard(
                            product: products[index],
                            onTap: () => AppNavigation.productDetails(
                              context,
                              products[index].id,
                            ),
                            onEdit: () => AppNavigation.editProduct(
                              context,
                              products[index].id,
                            ),
                            onDelete: () =>
                                _deleteProduct(context, products[index]),
                          ),
                          childCount: products.length,
                        ),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 260,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          mainAxisExtent: 245,
                        ),
                      ),
                    )
                  else
                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
                      sliver: SliverList.separated(
                        itemCount: products.length,
                        separatorBuilder: (_, __) =>
                            const SizedBox(height: 10),
                        itemBuilder: (context, index) {
                          final product = products[index];

                          return _ProductListTile(
                            product: product,
                            onTap: () => AppNavigation.productDetails(
                              context,
                              product.id,
                            ),
                            onEdit: () => AppNavigation.editProduct(
                              context,
                              product.id,
                            ),
                            onDelete: () =>
                                _deleteProduct(context, product),
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _filterChip(String label, String value) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 7),
      child: ChoiceChip(
        label: Text(label),
        selected: _filter == value,
        onSelected: (_) => setState(() => _filter = value),
      ),
    );
  }

  Future<void> _deleteProduct(
    BuildContext context,
    Product product,
  ) async {
    final confirmed = await ProductUi.confirmDelete(
      context,
      title: 'حذف المنتج',
      message: 'هل تريد حذف "${product.name}"؟',
    );

    if (!confirmed || !context.mounted) return;

    context.read<ProductsBloc>().add(
          ProductsEvent.delete(product.id),
        );
  }
}

class _ProductGridCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _ProductGridCard({
    required this.product,
    required this.onTap,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: _ProductImage(path: product.imagePath),
                    ),
                    PositionedDirectional(
                      top: 6,
                      end: 6,
                      child: ProductUi.statusChip(
                        context,
                        label: product.isActive ? 'نشط' : 'غير نشط',
                        color: product.isActive
                            ? Colors.green
                            : scheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                product.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '${ProductUi.money(product.salePrice)} د.ل',
                      style: TextStyle(
                        color: scheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'المخزون: ${product.quantity}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              if (product.isLowStock)
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: ProductUi.statusChip(
                    context,
                    label: 'مخزون منخفض',
                    color: scheme.error,
                  ),
                ),
              const Divider(height: 16),
              Row(
                children: [
                  IconButton(
                    visualDensity: VisualDensity.compact,
                    tooltip: 'تعديل',
                    onPressed: onEdit,
                    icon: const Icon(Icons.edit_outlined, size: 19),
                  ),
                  const Spacer(),
                  IconButton(
                    visualDensity: VisualDensity.compact,
                    tooltip: 'حذف',
                    onPressed: onDelete,
                    color: scheme.error,
                    icon: const Icon(Icons.delete_outline, size: 19),
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

class _ProductListTile extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _ProductListTile({
    required this.product,
    required this.onTap,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Card(
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.all(10),
        leading: SizedBox(
          width: 58,
          height: 58,
          child: _ProductImage(path: product.imagePath),
        ),
        title: Text(
          product.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${ProductUi.money(product.salePrice)} د.ل  •  الكمية: ${product.quantity}',
              ),
              if (product.isLowStock)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: ProductUi.statusChip(
                    context,
                    label: 'مخزون منخفض',
                    color: scheme.error,
                  ),
                ),
            ],
          ),
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'edit') onEdit();
            if (value == 'delete') onDelete();
          },
          itemBuilder: (_) => const [
            PopupMenuItem(
              value: 'edit',
              child: ListTile(
                leading: Icon(Icons.edit_outlined),
                title: Text('تعديل'),
              ),
            ),
            PopupMenuItem(
              value: 'delete',
              child: ListTile(
                leading: Icon(Icons.delete_outline, color: Colors.red),
                title: Text('حذف'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductImage extends StatelessWidget {
  final String? path;

  const _ProductImage({this.path});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    if (path != null && path!.trim().isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image(
          image: _resolveImage(path!),
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => _placeholder(scheme),
        ),
      );
    }

    return _placeholder(scheme);
  }

  ImageProvider _resolveImage(String value) {
    if (value.startsWith('http://') || value.startsWith('https://')) {
      return NetworkImage(value);
    }
    return AssetImage(value);
  }

  Widget _placeholder(ColorScheme scheme) {
    return Container(
      decoration: BoxDecoration(
        color: scheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(
        Icons.inventory_2_outlined,
        size: 35,
        color: scheme.onSurfaceVariant,
      ),
    );
  }
}
