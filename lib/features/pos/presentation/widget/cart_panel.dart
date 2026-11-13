
import 'package:flutter/material.dart';

import '../../domain/entities/cart_item.dart';

class CartPanel extends StatelessWidget {
  final List<CartItem> items;
  final double subtotal;
  final double discount;
  final double total;
  final bool busy;

  final void Function(int productId, double delta) onChangeQty;
  final void Function(int productId) onRemove;
  final VoidCallback onDiscount;
  final VoidCallback onClear;
  final VoidCallback onCheckout;

  const CartPanel({
    super.key,
    required this.items,
    required this.subtotal,
    required this.discount,
    required this.total,
    required this.busy,
    required this.onChangeQty,
    required this.onRemove,
    required this.onDiscount,
    required this.onClear,
    required this.onCheckout,
  });

  String _money(double value) => '${value.toStringAsFixed(2)} د.ل';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Icon(Icons.shopping_cart_outlined),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text(
                    'سلة المبيعات',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text('${items.length} أصناف'),
                const SizedBox(width: 8),
                IconButton(
                  tooltip: 'تفريغ السلة',
                  onPressed: busy || items.isEmpty ? null : onClear,
                  icon: const Icon(Icons.delete_sweep_outlined),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: items.isEmpty
                ? _emptyCart(theme)
                : ListView.separated(
                    padding: const EdgeInsets.all(12),
                    itemCount: items.length,
                    separatorBuilder: (_, __) =>
                        const Divider(height: 16),
                    itemBuilder: (context, index) {
                      final item = items[index];
                      final productId = item.product.id;

                      if (productId == null) {
                        return const SizedBox.shrink();
                      }

                      return _CartItemTile(
                        item: item,
                        enabled: !busy,
                        onDecrease: () => onChangeQty(
                          productId,
                          -1,
                        ),
                        onIncrease: () => onChangeQty(
                          productId,
                          1,
                        ),
                        onRemove: () => onRemove(productId),
                        onSetQuantity: (quantity) {
                          onChangeQty(
                            productId,
                            quantity - item.quantity,
                          );
                        },
                      );
                    },
                  ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _summaryRow('الإجمالي الفرعي', subtotal),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Expanded(child: Text('الخصم')),
                    Text(
                      _money(discount),
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      visualDensity: VisualDensity.compact,
                      tooltip: 'تعديل الخصم',
                      onPressed: busy ? null : onDiscount,
                      icon: const Icon(Icons.edit_outlined, size: 18),
                    ),
                  ],
                ),
                const Divider(height: 20),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'الإجمالي النهائي',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      _money(total),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: FilledButton.icon(
                    onPressed: busy || items.isEmpty || total <= 0
                        ? null
                        : onCheckout,
                    icon: busy
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          )
                        : const Icon(Icons.point_of_sale),
                    label: Text(
                      busy ? 'جارٍ تنفيذ العملية...' : 'إتمام البيع',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _emptyCart(ThemeData theme) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 58,
            color: theme.colorScheme.outline,
          ),
          const SizedBox(height: 12),
          const Text(
            'السلة فارغة',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            'امسح باركود المنتج لإضافته إلى الفاتورة',
            style: TextStyle(color: theme.colorScheme.outline),
          ),
        ],
      ),
    );
  }

  Widget _summaryRow(String title, double value) {
    return Row(
      children: [
        Expanded(child: Text(title)),
        Text(
          _money(value),
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

class _CartItemTile extends StatelessWidget {
  final CartItem item;
  final bool enabled;
  final VoidCallback onDecrease;
  final VoidCallback onIncrease;
  final VoidCallback onRemove;
  final ValueChanged<double> onSetQuantity;

  const _CartItemTile({
    required this.item,
    required this.enabled,
    required this.onDecrease,
    required this.onIncrease,
    required this.onRemove,
    required this.onSetQuantity,
  });

  @override
  Widget build(BuildContext context) {
    final product = item.product;

    return Row(
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: Theme.of(context)
                .colorScheme
                .primaryContainer,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            Icons.inventory_2_outlined,
            color: Theme.of(context).colorScheme.primary,
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
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '${product.salePrice.toStringAsFixed(2)} د.ل',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
              Text(
                'الإجمالي: ${item.total.toStringAsFixed(2)} د.ل',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: enabled ? onDecrease : null,
          icon: const Icon(Icons.remove_circle_outline),
        ),
        InkWell(
          onTap: enabled ? () => _editQuantity(context) : null,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              item.quantity.toStringAsFixed(
                item.quantity % 1 == 0 ? 0 : 2,
              ),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        IconButton(
          onPressed: enabled ? onIncrease : null,
          icon: const Icon(Icons.add_circle_outline),
        ),
        IconButton(
          onPressed: enabled ? onRemove : null,
          color: Theme.of(context).colorScheme.error,
          icon: const Icon(Icons.close),
        ),
      ],
    );
  }

  Future<void> _editQuantity(BuildContext context) async {
    final controller = TextEditingController(
      text: item.quantity.toString(),
    );

    final value = await showDialog<double>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('تعديل الكمية'),
        content: TextField(
          controller: controller,
          autofocus: true,
          keyboardType: const TextInputType.numberWithOptions(
            decimal: true,
          ),
          decoration: const InputDecoration(
            labelText: 'الكمية',
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
              final quantity = double.tryParse(
                controller.text.trim(),
              );

              if (quantity == null || quantity <= 0) return;

              Navigator.pop(dialogContext, quantity);
            },
            child: const Text('حفظ'),
          ),
        ],
      ),
    );

    controller.dispose();

    if (value != null) {
      onSetQuantity(value);
    }
  }
}
