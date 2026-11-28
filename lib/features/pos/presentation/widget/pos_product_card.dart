import 'package:flutter/material.dart';

import '../../cashier_shifts/domain/entities/product_entity.dart';

class PosProductCard extends StatelessWidget {
  const PosProductCard({
    super.key,
    required this.product,
    required this.onAdd,
  });

  final ProductEntity product;
  final VoidCallback? onAdd;

  String _money(double value) => '${value.toStringAsFixed(2)} د.ل';

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final available = product.quantity > 0;

    return Material(
      color: colors.surface,
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        onTap: onAdd,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: colors.outlineVariant.withValues(alpha: 0.65),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Center(
                  child: Container(
                    width: 58,
                    height: 58,
                    decoration: BoxDecoration(
                      color: colors.primaryContainer,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(
                      Icons.inventory_2_outlined,
                      size: 29,
                      color: colors.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                product.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 5),
              Text(
                _money(product.salePrice),
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: colors.primary,
                      fontWeight: FontWeight.w900,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                available ? 'المخزون: ${product.quantity}' : 'غير متوفر',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: available ? colors.onSurfaceVariant : colors.error,
                    ),
              ),
              const SizedBox(height: 9),
              SizedBox(
                height: 36,
                child: FilledButton.icon(
                  onPressed: available ? onAdd : null,
                  icon: const Icon(Icons.add_rounded, size: 18),
                  label: const Text('إضافة'),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    textStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
