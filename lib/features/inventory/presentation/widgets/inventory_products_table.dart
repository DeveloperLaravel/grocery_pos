import 'package:flutter/material.dart';

import '../../domain/entities/inventory_item.dart';
import '../helpers/inventory_formatters.dart';
import 'inventory_status_badge.dart';

class InventoryProductsTable extends StatelessWidget {
  const InventoryProductsTable({
    super.key,
    required this.products,
    required this.onAdjust,
  });

  final List<InventoryItem> products;
  final ValueChanged<InventoryItem> onAdjust;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          headingRowColor: WidgetStatePropertyAll(
            colors.surfaceContainerHighest,
          ),
          columnSpacing: 25,
          horizontalMargin: 20,
          columns: const [
            DataColumn(label: Text('المنتج')),
            DataColumn(label: Text('الباركود')),
            DataColumn(label: Text('الكمية')),
            DataColumn(label: Text('الحد الأدنى')),
            DataColumn(label: Text('الحالة')),
            DataColumn(label: Text('التكلفة')),
            DataColumn(label: Text('سعر البيع')),
            DataColumn(label: Text('الإجراء')),
          ],
          rows: products.map((product) {
            return DataRow(
              cells: [
                DataCell(
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 170),
                    child: Text(
                      product.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                DataCell(Text(
                  product.barcode.isEmpty ? '—' : product.barcode,
                )),
                DataCell(Text(
                  InventoryFormatters.quantity(product.quantity),
                )),
                DataCell(Text(
                  InventoryFormatters.quantity(product.minStock),
                )),
                DataCell(
                  InventoryStatusBadge(
                    quantity: product.quantity,
                    minStock: product.minStock,
                  ),
                ),
                DataCell(Text(
                  InventoryFormatters.currency(product.costPrice),
                )),
                DataCell(Text(
                  InventoryFormatters.currency(product.salePrice),
                )),
                DataCell(
                  IconButton(
                    tooltip: 'تسوية المخزون',
                    onPressed: () => onAdjust(product),
                    icon: Icon(
                      Icons.tune_rounded,
                      color: colors.primary,
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}