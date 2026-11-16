import 'package:flutter/material.dart';

import '../../domain/entities/inventory_item.dart';
import '../helpers/inventory_formatters.dart';
import 'inventory_status_badge.dart';

class InventoryProductCard extends StatelessWidget {
  const InventoryProductCard({
    super.key,
    required this.product,
    required this.onAdjust,
  });

  final InventoryItem product;
  final VoidCallback onAdjust;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    color: colors.primaryContainer,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Icon(
                    Icons.inventory_2_outlined,
                    color: colors.primary,
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
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'باركود: ${product.barcode.isEmpty ? 'غير متوفر' : product.barcode}',
                        style: TextStyle(
                          color: colors.onSurfaceVariant,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),

                PopupMenuButton<String>(
                  tooltip: 'خيارات المنتج',
                  onSelected: (value) {
                    if (value == 'adjust') onAdjust();
                  },
                  itemBuilder: (context) => const [
                    PopupMenuItem(
                      value: 'adjust',
                      child: Row(
                        children: [
                          Icon(Icons.tune_rounded),
                          SizedBox(width: 10),
                          Text('تعديل المخزون'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 15),
            const Divider(),
            const SizedBox(height: 10),

            Row(
              children: [
                Expanded(
                  child: _Info(
                    label: 'الكمية الحالية',
                    value: InventoryFormatters.quantity(
                      product.quantity,
                    ),
                  ),
                ),
                Expanded(
                  child: _Info(
                    label: 'الحد الأدنى',
                    value: InventoryFormatters.quantity(
                      product.minStock,
                    ),
                  ),
                ),
                InventoryStatusBadge(
                  quantity: product.quantity,
                  minStock: product.minStock,
                ),
              ],
            ),

            const SizedBox(height: 13),

            Row(
              children: [
                Expanded(
                  child: _Info(
                    label: 'سعر التكلفة',
                    value: InventoryFormatters.currency(
                      product.costPrice,
                    ),
                  ),
                ),
                Expanded(
                  child: _Info(
                    label: 'سعر البيع',
                    value: InventoryFormatters.currency(
                      product.salePrice,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: onAdjust,
                icon: const Icon(Icons.tune_rounded, size: 18),
                label: const Text('تسوية الكمية'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Info extends StatelessWidget {
  const _Info({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: colors.onSurfaceVariant,
            fontSize: 11,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}