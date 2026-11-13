

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/injection.dart';
import '../../domain/entities/product.dart';
import '../cubit/products_cubit.dart';
import '../cubit/products_state.dart';
import '../widgets/product_form_dialog.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ProductsCubit>()..initialize(),
      child: const _ProductsView(),
    );
  }
}

class _ProductsView extends StatefulWidget {
  const _ProductsView();

  @override
  State<_ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<_ProductsView> {
  final TextEditingController _searchController =
      TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // Show messages
  void _showMessage(
    String message, {
    bool error = false,
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: error
              ? Colors.red.shade700
              : Colors.green.shade700,
          content: Row(
            children: [
              Icon(
                error
                    ? Icons.error_outline
                    : Icons.check_circle_outline,
                color: Colors.white,
              ),
              const SizedBox(width: 10),
              Expanded(child: Text(message)),
            ],
          ),
        ),
      );
  }

  // Delete product
  Future<void> _deleteProduct(Product product) async {
    if (product.id == null) return;

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
            'هل تريد حذف "${product.name}"؟\n'
            'لا يمكن التراجع عن هذه العملية.',
          ),
          actions: [
            TextButton(
              onPressed: () =>
                  Navigator.pop(dialogContext, false),
              child: const Text('إلغاء'),
            ),
            FilledButton.icon(
              style: FilledButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () =>
                  Navigator.pop(dialogContext, true),
              icon: const Icon(Icons.delete_outline),
              label: const Text('حذف'),
            ),
          ],
        );
      },
    );

    if (confirmed != true || !mounted) return;

    final success = await context
        .read<ProductsCubit>()
        .deleteProduct(product.id!);

    if (!mounted) return;

    final state = context.read<ProductsCubit>().state;

    if (success) {
      _showMessage('تم حذف المنتج بنجاح');
    } else {
      _showMessage(
        state.errorMessage ?? 'تعذر حذف المنتج',
        error: true,
      );
    }
  }

  // Open add/edit form
  Future<void> _openForm([Product? product]) async {
    final cubit = context.read<ProductsCubit>();

    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => BlocProvider.value(
        value: cubit,
        child: ProductFormDialog(product: product),
      ),
    );

    if (!mounted) return;

    final message = cubit.state.successMessage;
    final error = cubit.state.errorMessage;

    if (message != null) {
      _showMessage(message);
      cubit.clearMessages();
    } else if (error != null) {
      _showMessage(error, error: true);
      cubit.clearMessages();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: theme.colorScheme.surfaceContainerLowest,
        floatingActionButton: LayoutBuilder(
          builder: (context, constraints) {
            return const SizedBox.shrink();
          },
        ),
        body: SafeArea(
          child: BlocConsumer<ProductsCubit, ProductsState>(
            listenWhen: (previous, current) =>
                previous.errorMessage != current.errorMessage,
            listener: (context, state) {
              if (state.errorMessage != null) {
                _showMessage(
                  state.errorMessage!,
                  error: true,
                );
                context.read<ProductsCubit>().clearMessages();
              }
            },
            builder: (context, state) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  final width = constraints.maxWidth;
                  final compact = width < 700;
                  final veryCompact = width < 380;
                  final cubit = context.read<ProductsCubit>();

                  return Padding(
                    padding: EdgeInsets.all(
                      veryCompact ? 10 : compact ? 14 : 22,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildHeader(
                          compact: compact,
                          veryCompact: veryCompact,
                        ),

                        const SizedBox(height: 18),

                        _buildStatistics(
                          state,
                          compact: compact,
                          veryCompact: veryCompact,
                        ),

                        const SizedBox(height: 18),

                        _buildSearch(cubit),

                        const SizedBox(height: 16),

                        Expanded(
                          child: _buildProductsContent(
                            state,
                            cubit,
                            compact: compact,
                            veryCompact: veryCompact,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  // Header
  Widget _buildHeader({
    required bool compact,
    required bool veryCompact,
  }) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: theme.colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(
            Icons.inventory_2_rounded,
            color: theme.colorScheme.onPrimaryContainer,
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'إدارة المنتجات',
                style: TextStyle(
                  fontSize: veryCompact ? 19 : 25,
                  fontWeight: FontWeight.w800,
                ),
              ),
              if (!veryCompact)
                Text(
                  'إدارة المنتجات والأسعار والمخزون',
                  style: TextStyle(
                    color: theme.colorScheme.onSurfaceVariant,
                    fontSize: 13,
                  ),
                ),
            ],
          ),
        ),

        IconButton.filledTonal(
          tooltip: 'تحديث المنتجات',
          onPressed: () {
            context.read<ProductsCubit>().loadProducts();
          },
          icon: const Icon(Icons.refresh_rounded),
        ),

       if (compact)
  IconButton.filled(
    tooltip: 'إضافة منتج',
    onPressed: () => _openForm(),
    icon: const Icon(Icons.add_rounded),
  )
else
  FilledButton.icon(
    onPressed: () => _openForm(),
    icon: const Icon(Icons.add_rounded),
    label: const Text('إضافة منتج'),
  ),
      ],
    );
  }

  // Statistics
  Widget _buildStatistics(
    ProductsState state, {
    required bool compact,
    required bool veryCompact,
  }) {
    final cubit = context.read<ProductsCubit>();

    final cards = [
      _StatData(
        title: 'إجمالي المنتجات',
        value: '${cubit.totalProducts}',
        icon: Icons.inventory_2_outlined,
        color: Colors.blue,
      ),
      _StatData(
        title: 'مخزون منخفض',
        value: '${cubit.lowStockCount}',
        icon: Icons.warning_amber_rounded,
        color: Colors.orange,
      ),
      _StatData(
        title: 'متوفر بالمخزون',
        value: '${cubit.availableProducts}',
        icon: Icons.check_circle_outline,
        color: Colors.green,
      ),
    ];

    if (veryCompact) {
      return Column(
        children: [
          Row(
            children: [
              Expanded(child: _statCard(cards[0])),
              const SizedBox(width: 8),
              Expanded(child: _statCard(cards[1])),
            ],
          ),
          const SizedBox(height: 8),
          _statCard(cards[2]),
        ],
      );
    }

    return Row(
      children: [
        for (int i = 0; i < cards.length; i++) ...[
          Expanded(child: _statCard(cards[i])),
          if (i != cards.length - 1)
            const SizedBox(width: 12),
        ],
      ],
    );
  }

  Widget _statCard(_StatData data) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      color: theme.colorScheme.surfaceContainer,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: data.color.withValues(alpha: .12),
              child: Icon(
                data.icon,
                color: data.color,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.value,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    data.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: theme.colorScheme.onSurfaceVariant,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Search
  Widget _buildSearch(ProductsCubit cubit) {
    return TextField(
      controller: _searchController,
      onChanged: cubit.searchProducts,
      decoration: InputDecoration(
        hintText: 'ابحث باسم المنتج أو الباركود...',
        prefixIcon: const Icon(Icons.search_rounded),
        suffixIcon: IconButton(
          tooltip: 'مسح البحث',
          onPressed: () {
            _searchController.clear();
            cubit.searchProducts('');
          },
          icon: const Icon(Icons.close_rounded),
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // Products content
  Widget _buildProductsContent(
    ProductsState state,
    ProductsCubit cubit, {
    required bool compact,
    required bool veryCompact,
  }) {
    if (state.isLoading && state.products.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    final products = cubit.filteredProducts;

    if (products.isEmpty) {
      return _buildEmptyState(state.searchQuery.isNotEmpty);
    }

    return compact
        ? ListView.separated(
            keyboardDismissBehavior:
                ScrollViewKeyboardDismissBehavior.onDrag,
            itemCount: products.length,
            separatorBuilder: (_, __) =>
                const SizedBox(height: 10),
            itemBuilder: (context, index) {
              return _productCard(
                products[index],
                compact: true,
                veryCompact: veryCompact,
              );
            },
          )
        : GridView.builder(
            keyboardDismissBehavior:
                ScrollViewKeyboardDismissBehavior.onDrag,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 430,
              mainAxisExtent: 190,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return _productCard(
                products[index],
                compact: false,
                veryCompact: false,
              );
            },
          );
  }

  // Empty state
  Widget _buildEmptyState(bool searching) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            searching
                ? Icons.search_off_rounded
                : Icons.inventory_2_outlined,
            size: 65,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 14),
          Text(
            searching
                ? 'لم يتم العثور على منتج'
                : 'لا توجد منتجات حتى الآن',
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            searching
                ? 'جرّب البحث باسم أو باركود آخر'
                : 'ابدأ بإضافة أول منتج إلى مخزونك',
            style: const TextStyle(color: Colors.grey),
          ),
          if (!searching) ...[
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: () => _openForm(),
              icon: const Icon(Icons.add),
              label: const Text('إضافة منتج'),
            ),
          ],
        ],
      ),
    );
  }

  // Product card
  Widget _productCard(
    Product product, {
    required bool compact,
    required bool veryCompact,
  }) {
    final theme = Theme.of(context);
    final low = product.isLowStock;

    return Card(
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => _openForm(product),
        child: Padding(
          padding: EdgeInsets.all(veryCompact ? 11 : 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor:
                        theme.colorScheme.primaryContainer,
                    child: Text(
                      product.name.isNotEmpty
                          ? product.name[0]
                          : '?',
                      style: TextStyle(
                        color: theme.colorScheme.onPrimaryContainer,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          product.barcode,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: theme.colorScheme.onSurfaceVariant,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == 'edit') {
                        _openForm(product);
                      } else if (value == 'delete') {
                        _deleteProduct(product);
                      }
                    },
                    itemBuilder: (_) => const [
                      PopupMenuItem(
                        value: 'edit',
                        child: ListTile(
                          leading: Icon(Icons.edit_outlined),
                          title: Text('تعديل'),
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                      PopupMenuItem(
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
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const Spacer(),

              Row(
                children: [
                  Expanded(
                    child: _productInfo(
                      'سعر البيع',
                      '${product.salePrice.toStringAsFixed(2)} د.ل',
                    ),
                  ),
                  Expanded(
                    child: _productInfo(
                      'سعر التكلفة',
                      '${product.costPrice.toStringAsFixed(2)} د.ل',
                    ),
                  ),
                  Expanded(
                    child: _productInfo(
                      'الكمية',
                      product.quantity.toString(),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: low
                      ? Colors.red.withValues(alpha: .10)
                      : Colors.green.withValues(alpha: .10),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      low
                          ? Icons.warning_amber_rounded
                          : Icons.check_circle_outline,
                      size: 17,
                      color: low ? Colors.red : Colors.green,
                    ),
                    const SizedBox(width: 7),
                    Text(
                      low
                          ? 'مخزون منخفض'
                          : 'المخزون جيد',
                      style: TextStyle(
                        color: low ? Colors.red : Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _productInfo(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 11,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}

class _StatData {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _StatData({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });
}
