
import 'package:flutter/material.dart';

import '../../domain/entities/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final bool compact;
  final bool veryCompact;

  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ProductCard({
    super.key,
    required this.product,
    required this.compact,
    required this.veryCompact,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final lowStock = product.isLowStock;

    final statusColor = lowStock
        ? scheme.error
        : scheme.primary;

    return Card(
      elevation: 0,
      clipBehavior: Clip.antiAlias,

      child: InkWell(
        onTap: onEdit,

        child: Padding(
          padding: EdgeInsets.all(
            veryCompact ? 12 : 15,
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              // =====================================
              // Product Header
              // =====================================

              Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: scheme.primaryContainer,
                      borderRadius: BorderRadius.circular(13),
                    ),
                    alignment: Alignment.center,

                    child: Text(
                      product.name.isNotEmpty
                          ? product.name[0]
                          : '?',

                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: scheme.onPrimaryContainer,
                      ),
                    ),
                  ),

                  const SizedBox(width: 11),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,

                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: scheme.onSurface,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Row(
                          children: [
                            Icon(
                              Icons.qr_code_rounded,
                              size: 13,
                              color: scheme.onSurfaceVariant,
                            ),

                            const SizedBox(width: 4),

                            Expanded(
                              child: Text(
                                product.barcode,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,

                                style: TextStyle(
                                  fontSize: 11,
                                  color: scheme.onSurfaceVariant,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  PopupMenuButton<String>(
                    tooltip: 'خيارات المنتج',

                    onSelected: (value) {
                      if (value == 'edit') {
                        onEdit();
                      } else if (value == 'delete') {
                        onDelete();
                      }
                    },

                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 'edit',
                        child: Row(
                          children: [
                            Icon(Icons.edit_outlined),
                            SizedBox(width: 10),
                            Text('تعديل المنتج'),
                          ],
                        ),
                      ),

                      PopupMenuItem(
                        value: 'delete',
                        child: Row(
                          children: [
                            Icon(
                              Icons.delete_outline_rounded,
                              color: scheme.error,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'حذف المنتج',
                              style: TextStyle(
                                color: scheme.error,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 18),

              // =====================================
              // Product Information
              // =====================================

              Row(
                children: [
                  Expanded(
                    child: _info(
                      context,
                      title: 'سعر البيع',
                      value:
                          '${product.salePrice.toStringAsFixed(2)} د.ل',
                      icon: Icons.sell_outlined,
                    ),
                  ),

                  Expanded(
                    child: _info(
                      context,
                      title: 'سعر التكلفة',
                      value:
                          '${product.costPrice.toStringAsFixed(2)} د.ل',
                      icon: Icons.payments_outlined,
                    ),
                  ),

                  Expanded(
                    child: _info(
                      context,
                      title: 'الكمية',
                      value: product.quantity.toString(),
                      icon: Icons.inventory_outlined,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              // =====================================
              // Stock Status
              // =====================================

              Container(
                width: double.infinity,

                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),

                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(10),
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Icon(
                      lowStock
                          ? Icons.warning_amber_rounded
                          : Icons.check_circle_outline_rounded,
                      size: 17,
                      color: statusColor,
                    ),

                    const SizedBox(width: 7),

                    Text(
                      lowStock
                          ? 'مخزون منخفض'
                          : 'المخزون جيد',

                      style: TextStyle(
                        color: statusColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _info(
    BuildContext context, {
    required String title,
    required String value,
    required IconData icon,
  }) {
    final scheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Row(
          children: [
            Icon(
              icon,
              size: 13,
              color: scheme.onSurfaceVariant,
            ),

            const SizedBox(width: 4),

            Flexible(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,

                style: TextStyle(
                  fontSize: 10,
                  color: scheme.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 5),

        Text(
          value,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,

          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: scheme.onSurface,
          ),
        ),
      ],
    );
  }
}
