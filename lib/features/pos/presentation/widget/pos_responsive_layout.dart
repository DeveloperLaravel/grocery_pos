import 'package:flutter/material.dart';

import '../../domain/entities/cart_item.dart';

class CartPanel extends StatelessWidget {
  const CartPanel({
    super.key,
    required this.items,
    required this.subtotal,
    required this.discount,
    required this.total,
    required this.isBusy,
    required this.onChangeQty,
    required this.onRemove,
    required this.onDiscount,
    required this.onClear,
    required this.onCheckout,
  });

  final List<CartItem> items;
  final double subtotal;
  final double discount;
  final double total;
  final bool isBusy;

  final void Function(int productId, double delta) onChangeQty;
  final void Function(int productId) onRemove;
  final VoidCallback onDiscount;
  final VoidCallback onClear;
  final VoidCallback onCheckout;

  String _money(double value) => '${value.toStringAsFixed(2)} د.ل';

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: scheme.outlineVariant),
      ),
      child: Column(
        children: [
          _buildHeader(context),
          Divider(height: 1, color: scheme.outlineVariant),
          Expanded(
            child: items.isEmpty
                ? _buildEmpty(context)
                : ListView.separated(
                    padding: const EdgeInsets.all(12),
                    itemCount: items.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 9),
                    itemBuilder: (context, index) {
                      return _buildItem(context, items[index]);
                    },
                  ),
          ),
          _buildSummary(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 15, 12, 15),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: scheme.primaryContainer,
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(
              Icons.shopping_cart_checkout_rounded,
              color: scheme.onPrimaryContainer,
            ),
          ),
          const SizedBox(width: 11),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'سلة المبيعات',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  '${items.length} أصناف',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: scheme.onSurfaceVariant,
                      ),
                ),
              ],
            ),
          ),
          if (items.isNotEmpty)
            IconButton(
              tooltip: 'تفريغ السلة',
              onPressed: isBusy ? null : onClear,
              icon: Icon(
                Icons.delete_sweep_outlined,
                color: scheme.error,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildEmpty(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 78,
              height: 78,
              decoration: BoxDecoration(
                color: scheme.surfaceContainerHigh,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.shopping_cart_outlined,
                size: 35,
                color: scheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              'السلة فارغة',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 6),
            Text(
              'اختر منتجاً أو امسح الباركود لإضافته هنا',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: scheme.onSurfaceVariant,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, CartItem item) {
    final scheme = Theme.of(context).colorScheme;
    final productId = item.product.id;

    return Container(
      padding: const EdgeInsets.all(11),
      decoration: BoxDecoration(
        color: scheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: scheme.outlineVariant),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 39,
                height: 39,
                decoration: BoxDecoration(
                  color: scheme.primaryContainer,
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Icon(
                  Icons.inventory_2_outlined,
                  color: scheme.onPrimaryContainer,
                  size: 20,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.product.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      _money(item.product.salePrice),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: scheme.onSurfaceVariant,
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 5),
              Text(
                _money(item.total),
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: scheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              if (productId != null)
                IconButton(
                  visualDensity: VisualDensity.compact,
                  tooltip: 'حذف الصنف',
                  onPressed: isBusy ? null : () => onRemove(productId),
                  icon: Icon(
                    Icons.delete_outline_rounded,
                    color: scheme.error,
                    size: 20,
                  ),
                ),
              const Spacer(),
              _quantityButton(
                context,
                icon: Icons.remove_rounded,
                onPressed: isBusy || productId == null
                    ? null
                    : () => onChangeQty(productId, -1),
              ),
              SizedBox(
                width: 42,
                child: Text(
                  item.quantity.toStringAsFixed(
                    item.quantity == item.quantity.roundToDouble() ? 0 : 2,
                  ),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              _quantityButton(
                context,
                icon: Icons.add_rounded,
                onPressed: isBusy || productId == null
                    ? null
                    : () => onChangeQty(productId, 1),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _quantityButton(
    BuildContext context, {
    required IconData icon,
    required VoidCallback? onPressed,
  }) {
    final scheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: 31,
      height: 31,
      child: IconButton.filledTonal(
        padding: EdgeInsets.zero,
        visualDensity: VisualDensity.compact,
        onPressed: onPressed,
        icon: Icon(icon, size: 17),
        style: IconButton.styleFrom(
          backgroundColor: scheme.secondaryContainer,
          foregroundColor: scheme.onSecondaryContainer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9),
          ),
        ),
      ),
    );
  }

  Widget _buildSummary(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: scheme.surfaceContainerLow,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(18),
        ),
        border: Border(
          top: BorderSide(color: scheme.outlineVariant),
        ),
      ),
      child: Column(
        children: [
          _summaryRow(context, 'الإجمالي الفرعي', subtotal),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Text(
                  'الخصم',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              TextButton.icon(
                onPressed: isBusy ? null : onDiscount,
                icon: const Icon(Icons.edit_outlined, size: 15),
                label: Text(
                  discount > 0 ? _money(discount) : 'إضافة خصم',
                ),
              ),
            ],
          ),
          const SizedBox(height: 9),
          Divider(color: scheme.outlineVariant),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Text(
                  'الإجمالي النهائي',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Text(
                _money(total),
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: scheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            height: 49,
            child: FilledButton.icon(
              onPressed: isBusy || items.isEmpty ? null : onCheckout,
              icon: isBusy
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    )
                  : const Icon(Icons.payments_outlined),
              label: Text(
                isBusy ? 'جارٍ تنفيذ العملية...' : 'إتمام عملية البيع',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _summaryRow(
    BuildContext context,
    String label,
    double value,
  ) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
        ),
        Text(
          _money(value),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }
}
