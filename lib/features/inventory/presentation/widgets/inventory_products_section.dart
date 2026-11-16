import 'package:flutter/material.dart';

import '../../domain/entities/inventory_item.dart';
import 'inventory_empty_state.dart';
import 'inventory_product_card.dart';
import 'inventory_products_table.dart';

class InventoryProductsSection extends StatelessWidget {
  const InventoryProductsSection({
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
            const Icon(Icons.category_outlined),
            const SizedBox(width: 9),
            const Expanded(
              child: Text(
                'المنتجات',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
            Text(
              '${products.length} منتج',
              style: TextStyle(
                color: colors.onSurfaceVariant,
                fontSize: 12,
              ),
            ),
          ],
        ),

        const SizedBox(height: 14),

        if (products.isEmpty)
          const InventoryEmptyState(
            title: 'لا توجد منتجات',
            message: 'لم نعثر على منتجات تطابق البحث أو الفلاتر.',
            icon: Icons.inventory_2_outlined,
          )
        else
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth >= 850) {
                return InventoryProductsTable(
                  products: products,
                  onAdjust: onAdjust,
                );
              }

              return Column(
                children: products.map((product) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: InventoryProductCard(
                      product: product,
                      onAdjust: () => onAdjust(product),
                    ),
                  );
                }).toList(),
              );
            },
          ),
      ],
    );
  }
}