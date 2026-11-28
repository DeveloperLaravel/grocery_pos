
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/di/injection.dart';
import '../../domain/entities/inventory_item.dart';

import '../bloc/inventory_bloc.dart';
import '../bloc/inventory_event.dart';
import '../bloc/inventory_state.dart';

import '../widgets/inventory_header.dart';
import '../widgets/inventory_summary_grid.dart';
import '../widgets/inventory_toolbar.dart';
import '../widgets/inventory_products_section.dart';
import '../widgets/low_stock_section.dart';
import '../widgets/recent_movements_section.dart';
import '../widgets/stock_adjustment_dialog.dart';
import '../widgets/inventory_empty_state.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({
    super.key,
    this.initialLowStockOnly = false,
  });

  final bool initialLowStockOnly;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<InventoryBloc>()
        ..add(const InventoryEvent.started()),
      child: _InventoryView(
        initialLowStockOnly: initialLowStockOnly,
      ),
    );
  }
}

class _InventoryView extends StatefulWidget {
  const _InventoryView({
    required this.initialLowStockOnly,
  });

  final bool initialLowStockOnly;

  @override
  State<_InventoryView> createState() => _InventoryViewState();
}

class _InventoryViewState extends State<_InventoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<InventoryBloc, InventoryState>(
          listenWhen: (previous, current) =>
              previous.successMessage != current.successMessage ||
              previous.errorMessage != current.errorMessage,
          listener: (context, state) {
            final message =
                state.successMessage ?? state.errorMessage;

            if (message == null || message.isEmpty) return;

            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(message),
                  behavior: SnackBarBehavior.floating,
                  margin: const EdgeInsets.all(12),
                ),
              );
          },
          builder: (context, state) {
            final bloc = context.read<InventoryBloc>();

            final products = _filterProducts(
              state.inventory,
              state.query,
              state.lowStockOnly || widget.initialLowStockOnly,
            );

            return LayoutBuilder(
              builder: (context, constraints) {
                final width = constraints.maxWidth;

                final horizontalPadding = switch (width) {
                  < 600 => 12.0,
                  < 1000 => 20.0,
                  _ => 28.0,
                };

                final verticalPadding = width < 600 ? 14.0 : 22.0;

                return RefreshIndicator(
                  onRefresh: () async {
                    bloc.add(
                      const InventoryEvent.refreshRequested(),
                    );
                  },
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                      vertical: verticalPadding,
                    ),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 1500,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InventoryHeader(
                              isLoading: state.isLoading,
                              onRefresh: () {
                                bloc.add(
                                  const InventoryEvent.refreshRequested(),
                                );
                              },
                              onMovements: () {
                                context.pushNamed('stockMovements');
                              },
                              onTransfers: () {
                                context.pushNamed('stockTransfers');
                              },
                              onAdjust: () {
                                _showAdjustmentDialog(
                                  context,
                                  state.inventory,
                                );
                              },
                            ),

                            SizedBox(height: width < 600 ? 18 : 26),

                            InventorySummaryGrid(
                              summary: state.summary,
                            ),

                            SizedBox(height: width < 600 ? 22 : 30),

                            InventoryToolbar(
                              query: state.query,
                              lowStockOnly: state.lowStockOnly,
                              onSearchChanged: (value) {
                                bloc.add(
                                  InventoryEvent.searchChanged(value),
                                );
                              },
                              onLowStockChanged: () {
                                bloc.add(
                                  const InventoryEvent.lowStockToggled(),
                                );
                              },
                              onClear: () {
                                bloc.add(
                                  const InventoryEvent.searchChanged(''),
                                );
                              },
                            ),

                            SizedBox(height: width < 600 ? 20 : 26),

                            if (state.isLoading &&
                                state.inventory.isEmpty)
                              const _InventoryLoading()
                            else if (state.errorMessage != null &&
                                state.inventory.isEmpty)
                              _buildError(state.errorMessage!)
                            else
                              InventoryProductsSection(
                                products: products,
                                onAdjust: (product) {
                                  _showAdjustmentDialog(
                                    context,
                                    [product],
                                    selectedProduct: product,
                                  );
                                },
                              ),

                            SizedBox(height: width < 600 ? 24 : 32),

                            LowStockSection(
                              products: state.lowStockProducts,
                              onAdjust: (product) {
                                _showAdjustmentDialog(
                                  context,
                                  [product],
                                  selectedProduct: product,
                                );
                              },
                            ),

                            SizedBox(height: width < 600 ? 24 : 32),

                            RecentMovementsSection(
                              movements: state.movements,
                              onViewAll: () {
                                context.pushNamed('stockMovements');
                              },
                            ),

                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  List<InventoryItem> _filterProducts(
    List<InventoryItem> products,
    String query,
    bool lowStockOnly,
  ) {
    final search = query.trim().toLowerCase();

    return products.where((product) {
      final matchesSearch = search.isEmpty ||
          product.name.toLowerCase().contains(search) ||
          product.barcode.toLowerCase().contains(search);

      final matchesStock =
          !lowStockOnly || product.isLowStock;

      return matchesSearch && matchesStock;
    }).toList();
  }

  void _showAdjustmentDialog(
    BuildContext context,
    List<InventoryItem> products, {
    InventoryItem? selectedProduct,
  }) {
    if (products.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('لا توجد منتجات لتعديل مخزونها'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    final product = selectedProduct ?? products.first;
    final inventoryBloc = context.read<InventoryBloc>();

    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return BlocProvider.value(
          value: inventoryBloc,
          child: BlocBuilder<InventoryBloc, InventoryState>(
            builder: (context, state) {
              return StockAdjustmentDialog(
                product: product,
                isLoading: state.isAdjusting,
                onSubmit: ({
                  required quantity,
                  required type,
                  reference,
                  note,
                }) {
                  context.read<InventoryBloc>().add(
                        InventoryEvent.stockAdjustmentSubmitted(
                          productId: product.id,
                          quantity: quantity,
                          type: type,
                          reference: reference,
                          note: note,
                        ),
                      );
                },
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildError(String message) {
    return InventoryEmptyState(
      title: 'تعذر تحميل المخزون',
      message: message,
      icon: Icons.error_outline_rounded,
    );
  }
}

class _InventoryLoading extends StatelessWidget {
  const _InventoryLoading();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 65),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
