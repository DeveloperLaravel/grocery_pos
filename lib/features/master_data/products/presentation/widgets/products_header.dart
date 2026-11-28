
import 'package:flutter/material.dart';

class ProductsHeader extends StatelessWidget {
  final bool compact;
  final bool veryCompact;
  final VoidCallback onAdd;
  final VoidCallback onRefresh;

  const ProductsHeader({
    super.key,
    required this.compact,
    required this.veryCompact,
    required this.onAdd,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Container(
          width: veryCompact ? 44 : 52,
          height: veryCompact ? 44 : 52,
          decoration: BoxDecoration(
            color: scheme.primaryContainer,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(
            Icons.inventory_2_rounded,
            color: scheme.onPrimaryContainer,
            size: 26,
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'إدارة المنتجات',
                style: TextStyle(
                  fontSize: veryCompact ? 18 : 24,
                  fontWeight: FontWeight.w800,
                  color: scheme.onSurface,
                ),
              ),

              if (!veryCompact)
                Text(
                  'إدارة المنتجات والأسعار والمخزون',
                  style: TextStyle(
                    fontSize: 12,
                    color: scheme.onSurfaceVariant,
                  ),
                ),
            ],
          ),
        ),

        // IconButton.filledTonal(
        //   tooltip: 'تحديث المنتجات',
        //   onPressed: onRefresh,
        //   icon: const Icon(Icons.refresh_rounded),
        // ),

        const SizedBox(width: 8),

        if (compact)
          IconButton.filled(
            tooltip: 'إضافة منتج',
            onPressed: onAdd,
            icon: const Icon(Icons.add_rounded),
          )
        else
          FilledButton.icon(
            onPressed: onAdd,
            icon: const Icon(Icons.add_rounded),
            label: const Text('إضافة منتج'),
          ),
      ],
    );
  }
}
