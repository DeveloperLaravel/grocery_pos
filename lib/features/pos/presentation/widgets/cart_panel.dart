import 'package:flutter/material.dart';
import 'package:grocery_pos/features/pos/domain/cart_item.dart';

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

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(children: [
              const Expanded(child: Text('السلة', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
              IconButton(tooltip: 'تفريغ السلة', onPressed: items.isEmpty || busy ? null : onClear, icon: const Icon(Icons.delete_sweep_outlined)),
            ]),
            const Divider(),
            Expanded(
              child: items.isEmpty
                  ? const Center(child: Text('امسح باركود أو اختر منتجاً'))
                  : ListView.separated(
                      itemCount: items.length,
                      separatorBuilder: (_, __) => const Divider(height: 1),
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                  Text(item.product.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w600)),
                                  Text('${item.product.salePrice.toStringAsFixed(2)} × ${_fmt(item.quantity)} = ${item.total.toStringAsFixed(2)} د.ل'),
                                ]),
                              ),
                              IconButton(onPressed: busy ? null : () => onChangeQty(item.product.id, -1), icon: const Icon(Icons.remove_circle_outline)),
                              SizedBox(width: 32, child: Text(_fmt(item.quantity), textAlign: TextAlign.center)),
                              IconButton(onPressed: busy ? null : () => onChangeQty(item.product.id, 1), icon: const Icon(Icons.add_circle_outline)),
                              IconButton(onPressed: busy ? null : () => onRemove(item.product.id), icon: const Icon(Icons.close)),
                            ],
                          ),
                        );
                      },
                    ),
            ),
            const Divider(),
            _moneyRow('المجموع الفرعي', subtotal),
            InkWell(onTap: busy ? null : onDiscount, child: _moneyRow('الخصم', discount)),
            const SizedBox(height: 4),
            _moneyRow('الإجمالي', total, bold: true),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: FilledButton.icon(
                onPressed: items.isEmpty || busy ? null : onCheckout,
                icon: busy ? const SizedBox.square(dimension: 20, child: CircularProgressIndicator(strokeWidth: 2)) : const Icon(Icons.payments_outlined),
                label: Text(busy ? 'جارٍ حفظ البيع...' : 'دفع وحفظ الفاتورة'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _moneyRow(String title, double value, {bool bold = false}) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(title, style: TextStyle(fontWeight: bold ? FontWeight.bold : FontWeight.normal, fontSize: bold ? 19 : 14)),
          Text('${value.toStringAsFixed(2)} د.ل', style: TextStyle(fontWeight: bold ? FontWeight.bold : FontWeight.normal, fontSize: bold ? 22 : 14)),
        ]),
      );

  String _fmt(double value) => value == value.truncateToDouble() ? value.toInt().toString() : value.toStringAsFixed(2);
}
