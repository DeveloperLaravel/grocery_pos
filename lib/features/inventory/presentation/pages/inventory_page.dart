
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';

import '../../domain/entities/inventory_item.dart';
import '../bloc/inventory_bloc.dart';
import '../bloc/inventory_event.dart';
import '../bloc/inventory_state.dart';

import 'stock_movements_page.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<InventoryBloc>()
        ..add(const InventoryEvent.started()),
      child: const _InventoryView(),
    );
  }
}

class _InventoryView extends StatelessWidget {
  const _InventoryView();

  // static const Color primary = Color(0xFF1565C0);
  static const Color background = Color(0xFFF5F7FA);

  Future<void> _refresh(BuildContext context) async {
    final bloc = context.read<InventoryBloc>();

    bloc.add(const InventoryEvent.refreshRequested());

    await bloc.stream.firstWhere(
      (state) => !state.isLoading,
    );
  }

  Future<void> _openMovements(
    BuildContext context, {
    int? productId,
    String? productName,
  }) async {
    final bloc = context.read<InventoryBloc>();

    await Navigator.of(context).push<void>(
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: bloc,
          child: StockMovementsPage(
            productId: productId,
            productName: productName,
          ),
        ),
      ),
    );

    if (!bloc.isClosed) {
      bloc.add(
        const InventoryEvent.movementsFilterChanged(
          productId: null,
          limit: 50,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text(
          'إدارة المخزون',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        actions: [
          IconButton(
            tooltip: 'جميع الحركات',
            onPressed: () => _openMovements(context),
            icon: const Icon(Icons.history_rounded),
          ),
          IconButton(
            tooltip: 'تحديث',
            onPressed: () {
              context.read<InventoryBloc>().add(
                    const InventoryEvent.refreshRequested(),
                  );
            },
            icon: const Icon(Icons.refresh_rounded),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: BlocConsumer<InventoryBloc, InventoryState>(
        listenWhen: (previous, current) =>
            previous.errorMessage != current.errorMessage ||
            previous.successMessage != current.successMessage,
        listener: (context, state) {
          final message =
              state.errorMessage ?? state.successMessage;

          if (message == null || message.isEmpty) return;

          final isError = state.errorMessage != null;

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                backgroundColor: isError
                    ? Colors.red.shade700
                    : Colors.green.shade700,
                content: Text(message),
              ),
            );
        },
        builder: (context, state) {
          final products = _filterProducts(state);

          if (state.isLoading && state.inventory.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state.errorMessage != null &&
              state.inventory.isEmpty) {
            return _PageError(
              message: state.errorMessage!,
              onRetry: () {
                context.read<InventoryBloc>().add(
                      const InventoryEvent.refreshRequested(),
                    );
              },
            );
          }

          return RefreshIndicator(
            onRefresh: () => _refresh(context),
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.all(16),
                  sliver: SliverToBoxAdapter(
                    child: _SummarySection(
                      summary: state.summary,
                    ),
                  ),
                ),

                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: _SearchSection(state: state),
                  ),
                ),

                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(
                    16,
                    20,
                    16,
                    10,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: _ProductsHeader(
                      count: products.length,
                      lowStockOnly: state.lowStockOnly,
                    ),
                  ),
                ),

                if (products.isEmpty)
                  const SliverFillRemaining(
                    hasScrollBody: false,
                    child: _EmptyInventory(),
                  )
                else
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(
                      16,
                      0,
                      16,
                      24,
                    ),
                    sliver: SliverList.separated(
                      itemCount: products.length,
                      separatorBuilder: (_, __) =>
                          const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        final product = products[index];

                        return _ProductCard(
                          product: product,
                          onTap: () {
                            _openMovements(
                              context,
                              productId: product.id,
                              productName: product.name,
                            );
                          },
                        );
                      },
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  List<InventoryItem> _filterProducts(
    InventoryState state,
  ) {
    var result = state.inventory;

    if (state.lowStockOnly) {
      result = result
          .where((item) => item.isLowStock)
          .toList();
    }

    final query = state.query.trim().toLowerCase();

    if (query.isNotEmpty) {
      result = result.where((item) {
        return item.name.toLowerCase().contains(query) ||
            item.barcode.toLowerCase().contains(query);
      }).toList();
    }

    return result;
  }
}

// ============================================================
// Summary
// ============================================================

class _SummarySection extends StatelessWidget {
  final dynamic summary;

  const _SummarySection({
    required this.summary,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'نظرة عامة',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1.65,
          children: [
            _SummaryCard(
              title: 'إجمالي المنتجات',
              value: '${summary.productsCount}',
              icon: Icons.inventory_2_outlined,
              color: const Color(0xFF1565C0),
            ),
            _SummaryCard(
              title: 'مخزون منخفض',
              value: '${summary.lowStockCount}',
              icon: Icons.warning_amber_rounded,
              color: const Color(0xFFE69519),
            ),
            _SummaryCard(
              title: 'إجمالي الوحدات',
              value: _formatNumber(summary.totalUnits),
              icon: Icons.stacked_bar_chart_rounded,
              color: const Color(0xFF00897B),
            ),
            _SummaryCard(
              title: 'الربح المتوقع',
              value: summary.potentialProfit.toStringAsFixed(2),
              icon: Icons.trending_up_rounded,
              color: const Color(0xFF2E7D32),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              _ValueRow(
                title: 'قيمة المخزون بالتكلفة',
                value: summary.stockCostValue,
              ),
              const Divider(height: 22),
              _ValueRow(
                title: 'قيمة المخزون بسعر البيع',
                value: summary.stockSaleValue,
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _formatNumber(double value) {
    return value == value.roundToDouble()
        ? value.toInt().toString()
        : value.toStringAsFixed(2);
  }
}

class _SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _SummaryCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ValueRow extends StatelessWidget {
  final String title;
  final double value;

  const _ValueRow({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(color: Colors.grey.shade700),
          ),
        ),
        Text(
          value.toStringAsFixed(2),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

// ============================================================
// Search
// ============================================================

class _SearchSection extends StatelessWidget {
  final InventoryState state;

  const _SearchSection({required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: (value) {
            context.read<InventoryBloc>().add(
                  InventoryEvent.searchChanged(value),
                );
          },
          decoration: InputDecoration(
            hintText: 'ابحث باسم المنتج أو الباركود',
            prefixIcon: const Icon(Icons.search_rounded),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            FilterChip(
              selected: state.lowStockOnly,
              onSelected: (_) {
                context.read<InventoryBloc>().add(
                      const InventoryEvent.lowStockToggled(),
                    );
              },
              avatar: const Icon(
                Icons.warning_amber_rounded,
                size: 18,
              ),
              label: const Text('المخزون المنخفض فقط'),
              showCheckmark: false,
            ),
            const Spacer(),
            if (state.isLoading)
              const SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              ),
          ],
        ),
      ],
    );
  }
}

// ============================================================
// Header
// ============================================================

class _ProductsHeader extends StatelessWidget {
  final int count;
  final bool lowStockOnly;

  const _ProductsHeader({
    required this.count,
    required this.lowStockOnly,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'المنتجات',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          '($count)',
          style: TextStyle(color: Colors.grey.shade600),
        ),
        const Spacer(),
        if (lowStockOnly)
          const Text(
            'مخزون منخفض',
            style: TextStyle(
              color: Colors.orange,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
      ],
    );
  }
}

// ============================================================
// Product card
// ============================================================

class _ProductCard extends StatelessWidget {
  final InventoryItem product;
  final VoidCallback onTap;

  const _ProductCard({
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isOut = product.isOutOfStock;
    final isLow = product.isLowStock;

    final color = isOut
        ? Colors.red
        : isLow
            ? Colors.orange
            : Colors.green;

    final status = isOut
        ? 'نفد المخزون'
        : isLow
            ? 'مخزون منخفض'
            : 'متوفر';

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEAF1FA),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.inventory_2_outlined,
                      color: Color(0xFF1565C0),
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
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        if (product.barcode.isNotEmpty)
                          Text(
                            product.barcode,
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 12,
                            ),
                          ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 9,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.10),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      status,
                      style: TextStyle(
                        color: color,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  _ProductInfo(
                    label: 'الكمية',
                    value: _formatQuantity(product.quantity),
                  ),
                  _ProductInfo(
                    label: 'الحد الأدنى',
                    value: _formatQuantity(product.minStock),
                  ),
                  _ProductInfo(
                    label: 'سعر البيع',
                    value: product.salePrice.toStringAsFixed(2),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Divider(height: 1),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'قيمة المخزون: ${product.stockValue.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.history_rounded,
                    size: 16,
                    color: Color(0xFF1565C0),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    'الحركات',
                    style: TextStyle(
                      color: Color(0xFF1565C0),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatQuantity(double value) {
    return value == value.roundToDouble()
        ? value.toInt().toString()
        : value.toStringAsFixed(2);
  }
}

class _ProductInfo extends StatelessWidget {
  final String label;
  final String value;

  const _ProductInfo({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 11,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// Empty and error
// ============================================================

class _EmptyInventory extends StatelessWidget {
  const _EmptyInventory();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.inventory_2_outlined,
              size: 64,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 16),
            const Text(
              'لا توجد منتجات',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'لم يتم العثور على منتجات تطابق البحث أو الفلتر',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }
}

class _PageError extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _PageError({
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline_rounded,
              size: 50,
              color: Colors.red,
            ),
            const SizedBox(height: 12),
            Text(
              message,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 14),
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: const Text('إعادة المحاولة'),
            ),
          ],
        ),
      ),
    );
  }
}
