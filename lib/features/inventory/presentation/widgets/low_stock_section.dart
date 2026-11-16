import 'package:flutter/material.dart';

import '../../domain/entities/inventory_item.dart';
import 'inventory_empty_state.dart';
import 'inventory_product_card.dart';

class LowStockSection extends StatelessWidget {
  const LowStockSection({
    super.key,
    required this.products,
    required this.onAdjust,
  });

  final List<InventoryItem> products;
  final ValueChanged<InventoryItem> onAdjust;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.warning_amber_rounded,
              color: colors.error,
            ),
            const SizedBox(width: 9),
            const Expanded(
              child: Text(
                'تنبيهات المخزون',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              '${products.length}',
              style: TextStyle(
                color: colors.error,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),

        if (products.isEmpty)
          const InventoryEmptyState(
            title: 'المخزون بحالة جيدة',
            message: 'لا توجد منتجات منخفضة المخزون حاليًا.',
            icon: Icons.check_circle_outline_rounded,
          )
        else
          ...products.map(
            (product) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InventoryProductCard(
                product: product,
                onAdjust: () => onAdjust(product),
              ),
            ),
          ),
      ],
    );
  }
}