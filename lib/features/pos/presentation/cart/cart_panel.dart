import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/pos_bloc.dart';
import '../bloc/pos_event.dart';
import '../bloc/pos_state.dart';

import 'cart_header.dart';
import 'cart_item_card.dart';
import 'cart_summary.dart';
import 'cart_checkout_button.dart';
import 'checkout_dialog.dart';

class CartPanel extends StatelessWidget {
  const CartPanel({
    super.key,
    this.isMobile = false,
    this.onClose,
    this.onCheckout,
  });

  final bool isMobile;
  final VoidCallback? onClose;
  final VoidCallback? onCheckout;

  Future<void> _confirmClear(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('إفراغ السلة'),
          content: const Text(
            'هل تريد حذف جميع المنتجات من سلة المبيعات؟',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext, false),
              child: const Text('إلغاء'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(dialogContext, true),
              child: const Text('إفراغ السلة'),
            ),
          ],
        );
      },
    );

    if (confirmed == true && context.mounted) {
      context.read<PosBloc>().add(
            const PosEvent.cartCleared(),
          );
    }
  }

  void _checkout(BuildContext context) {
    if (onCheckout != null) {
      onCheckout!();
      return;
    }

    CheckoutDialog.show(context);
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BlocBuilder<PosBloc, PosState>(
      builder: (context, state) {
        final screenHeight = MediaQuery.sizeOf(context).height;
        final compact = screenHeight < 650;

        return Material(
          color: colors.surface,
          child: SafeArea(
            top: !isMobile,
            bottom: true,
            child: Column(
              children: [
                CartHeader(
                  itemCount: state.cartProductsCount,
                  isMobile: isMobile,
                  onClose: onClose,
                  onClear:
                      state.hasCartItems ? () => _confirmClear(context) : null,
                ),
                Divider(
                  height: 1,
                  color: colors.outlineVariant,
                ),
                Expanded(
                  child: state.isCartEmpty
                      ? const _EmptyCart()
                      : ListView.separated(
                          keyboardDismissBehavior:
                              ScrollViewKeyboardDismissBehavior.onDrag,
                          padding: EdgeInsets.symmetric(
                            horizontal: compact ? 10 : 14,
                            vertical: compact ? 8 : 12,
                          ),
                          itemCount: state.cart.length,
                          separatorBuilder: (_, __) {
                            return SizedBox(
                              height: compact ? 7 : 10,
                            );
                          },
                          itemBuilder: (context, index) {
                            final item = state.cart[index];
                            final productId = item.product.id;

                            return CartItemCard(
                              item: item,
                              onIncrease: () {
                                if (productId == null) return;

                                context.read<PosBloc>().add(
                                      PosEvent.cartQuantityChanged(
                                        productId: productId,
                                        delta: 1,
                                      ),
                                    );
                              },
                              onDecrease: () {
                                if (productId == null) return;

                                context.read<PosBloc>().add(
                                      PosEvent.cartQuantityChanged(
                                        productId: productId,
                                        delta: -1,
                                      ),
                                    );
                              },
                              onRemove: () {
                                if (productId == null) return;

                                context.read<PosBloc>().add(
                                      PosEvent.cartProductRemoved(
                                        productId: productId,
                                      ),
                                    );
                              },
                            );
                          },
                        ),
                ),
                Divider(
                  height: 1,
                  color: colors.outlineVariant,
                ),
                CartSummary(
                  subtotal: state.subtotal,
                  discount: state.discount,
                  total: state.total,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    compact ? 10 : 14,
                    compact ? 5 : 8,
                    compact ? 10 : 14,
                    compact ? 8 : 12,
                  ),
                  child: CartCheckoutButton(
                    isBusy: state.checkingOut || state.saving,
                    enabled: state.canCheckout,
                    onPressed: () => _checkout(context),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _EmptyCart extends StatelessWidget {
  const _EmptyCart();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 82,
              height: 82,
              decoration: BoxDecoration(
                color: colors.surfaceContainerHighest,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.shopping_cart_outlined,
                size: 38,
                color: colors.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 18),
            Text(
              'السلة فارغة',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 7),
            Text(
              'اختر المنتجات من القائمة لإضافتها إلى الفاتورة',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
