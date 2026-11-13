import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';

import '../../domain/entities/product_entity.dart';

import '../barcode_page.dart';
import '../bloc/pos_bloc.dart';
import '../bloc/pos_event.dart';
import '../bloc/pos_state.dart';

import '../receipt_page.dart';
import '../widget/cart_panel.dart';
import '../widget/checkout_dialog.dart';


class PosPage extends StatelessWidget {
  const PosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PosBloc>()
        ..add(const PosEvent.loadRequested()),
      child: const _PosView(),
    );
  }
}

class _PosView extends StatefulWidget {
  const _PosView();

  @override
  State<_PosView> createState() => _PosViewState();
}

class _PosViewState extends State<_PosView> {
  final _searchController = TextEditingController();
  final _searchFocus = FocusNode();

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocus.dispose();
    super.dispose();
  }

  PosBloc get _bloc => context.read<PosBloc>();

  Future<void> _scanBarcode() async {
    final barcode = await Navigator.of(context).push<String>(
      MaterialPageRoute(
        builder: (_) => const BarcodePage(),
      ),
    );

    if (!mounted || barcode == null || barcode.isEmpty) return;

    _bloc.add(
      PosEvent.barcodeScanned(barcode: barcode),
    );
  }

  Future<void> _checkout(PosState state) async {
    final result = await showDialog<CheckoutResult>(
      context: context,
      barrierDismissible: false,
      builder: (_) => CheckoutDialog(
        total: state.total,
      ),
    );

    if (!mounted || result == null) return;

    _bloc.add(
      PosEvent.checkoutRequested(
        paid: result.paid,
        paymentMethod: result.method,
      ),
    );
  }

  Future<void> _changeDiscount(PosState state) async {
    final controller = TextEditingController(
      text: state.discount.toStringAsFixed(2),
    );

    final discount = await showDialog<double>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('تحديد الخصم'),
          content: TextField(
            controller: controller,
            autofocus: true,
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
            ),
            decoration: const InputDecoration(
              labelText: 'قيمة الخصم',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('إلغاء'),
            ),
            FilledButton(
              onPressed: () {
                final value = double.tryParse(controller.text.trim());

                if (value == null || value < 0) return;

                Navigator.pop(dialogContext, value);
              },
              child: const Text('حفظ'),
            ),
          ],
        );
      },
    );

    controller.dispose();

    if (!mounted || discount == null) return;

    _bloc.add(
      PosEvent.discountChanged(discount: discount),
    );
  }

  void _showMessage(
    BuildContext context,
    String message, {
    bool isError = false,
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: isError ? Colors.red : null,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PosBloc, PosState>(
      listenWhen: (previous, current) {
        return previous.error != current.error ||
            previous.success != current.success ||
            previous.lastReceipt != current.lastReceipt;
      },
      listener: (context, state) {
        if (state.error != null) {
          _showMessage(
            context,
            state.error!,
            isError: true,
          );
        }

        if (state.success != null) {
          _showMessage(context, state.success!);
        }

        final receipt = state.lastReceipt;

        if (receipt != null) {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (_) => ReceiptPage(receipt: receipt),
                ),
              )
              .then((_) {
                if (!mounted) return;

                _bloc.add(
                  const PosEvent.receiptDismissed(),
                );
              });
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('نقطة البيع'),
            actions: [
              IconButton(
                tooltip: 'تحديث المنتجات',
                onPressed: state.loading
                    ? null
                    : () => _bloc.add(
                          const PosEvent.loadRequested(),
                        ),
                icon: const Icon(Icons.refresh),
              ),
            ],
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth >= 900;

              if (isWide) {
                return Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: _buildProductsSection(state),
                    ),
                    SizedBox(
                      width: 390,
                      child: CartPanel(
                        items: state.cart,
                        subtotal: state.subtotal,
                        discount: state.discount,
                        total: state.total,
                        busy: state.checkingOut || state.saving,
                        onChangeQty: (id, delta) {
                          _bloc.add(
                            PosEvent.cartQuantityChanged(
                              productId: id,
                              delta: delta,
                            ),
                          );
                        },
                        onRemove: (id) {
                          _bloc.add(
                            PosEvent.cartProductRemoved(
                              productId: id,
                            ),
                          );
                        },
                        onDiscount: () => _changeDiscount(state),
                        onClear: () {
                          _bloc.add(
                            const PosEvent.cartCleared(),
                          );
                        },
                        onCheckout: () => _checkout(state),
                      ),
                    ),
                  ],
                );
              }

              return Column(
                children: [
                  Expanded(
                    flex: 6,
                    child: _buildProductsSection(state),
                  ),
                  SizedBox(
                    height: 360,
                    child: CartPanel(
                      items: state.cart,
                      subtotal: state.subtotal,
                      discount: state.discount,
                      total: state.total,
                      busy: state.checkingOut || state.saving,
                      onChangeQty: (id, delta) {
                        _bloc.add(
                          PosEvent.cartQuantityChanged(
                            productId: id,
                            delta: delta,
                          ),
                        );
                      },
                      onRemove: (id) {
                        _bloc.add(
                          PosEvent.cartProductRemoved(
                            productId: id,
                          ),
                        );
                      },
                      onDiscount: () => _changeDiscount(state),
                      onClear: () {
                        _bloc.add(
                          const PosEvent.cartCleared(),
                        );
                      },
                      onCheckout: () => _checkout(state),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildProductsSection(PosState state) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _searchController,
                  focusNode: _searchFocus,
                  textInputAction: TextInputAction.search,
                  onChanged: (query) {
                    _bloc.add(
                      PosEvent.searchChanged(query: query),
                    );
                  },
                  decoration: InputDecoration(
                    hintText: 'ابحث بالاسم أو الباركود...',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                      tooltip: 'مسح البحث',
                      onPressed: () {
                        _searchController.clear();
                        _bloc.add(
                          const PosEvent.searchChanged(query: ''),
                        );
                      },
                      icon: const Icon(Icons.close),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              IconButton.filled(
                tooltip: 'مسح الباركود',
                onPressed: _scanBarcode,
                icon: const Icon(Icons.qr_code_scanner),
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              _StatChip(
                label: 'المنتجات',
                value: '${state.products.length}',
                icon: Icons.inventory_2_outlined,
              ),
              const SizedBox(width: 8),
              _StatChip(
                label: 'أصناف السلة',
                value: '${state.cartProductsCount}',
                icon: Icons.shopping_cart_outlined,
              ),
              const SizedBox(width: 8),
              _StatChip(
                label: 'منخفض المخزون',
                value: '${state.lowStockCount}',
                icon: Icons.warning_amber_outlined,
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),

        Expanded(
          child: state.loading && state.products.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : state.products.isEmpty
                  ? const Center(
                      child: Text('لا توجد منتجات'),
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.all(12),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 210,
                        mainAxisExtent: 190,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        final product = state.products[index];

                        return _ProductCard(
                          product: product,
                          onTap: () {
                            _bloc.add(
                              PosEvent.cartProductAdded(
                                product: product,
                              ),
                            );
                          },
                        );
                      },
                    ),
        ),
      ],
    );
  }
}

class _ProductCard extends StatelessWidget {
  final ProductEntity product;
  final VoidCallback onTap;

  const _ProductCard({
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isOut = product.quantity <= 0;
    final isLow = product.isLowStock;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: isOut ? null : onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.inventory_2_outlined),
                  const Spacer(),
                  if (isOut)
                    const Chip(
                      label: Text('نفد'),
                      visualDensity: VisualDensity.compact,
                    )
                  else if (isLow)
                    const Chip(
                      label: Text('مخزون منخفض'),
                      visualDensity: VisualDensity.compact,
                    ),
                ],
              ),
              const Spacer(),
              Text(
                product.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'المخزون: ${product.quantity}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      product.salePrice.toStringAsFixed(2),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const Icon(Icons.add_circle_outline),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _StatChip({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 10,
          ),
          child: Column(
            children: [
              Icon(icon, size: 18),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}