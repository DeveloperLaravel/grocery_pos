import 'package:flutter/material.dart';

import 'package:grocery_pos/features/inventory/presentation/bloc/inventory_state.dart';

class InventorySummary extends StatelessWidget {
  final InventoryState state;

  const InventorySummary({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final s = state.summary;

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final columns = width < 420
            ? 2
            : width < 900
                ? 2
                : 4;
        final gap = 8.0;
        final itemWidth =
            (width - (gap * (columns - 1))) / columns;

        return Wrap(
          spacing: gap,
          runSpacing: gap,
          children: [
            _Stat(
              width: itemWidth,
              label: 'المنتجات',
              value: '${s.productsCount}',
              icon: Icons.inventory_2_outlined,
            ),
            _Stat(
              width: itemWidth,
              label: 'منخفض',
              value: '${s.lowStockCount}',
              icon: Icons.warning_amber_rounded,
            ),
            _Stat(
              width: itemWidth,
              label: 'الوحدات',
              value: s.totalUnits.toStringAsFixed(0),
              icon: Icons.layers_outlined,
            ),
            _Stat(
              width: itemWidth,
              label: 'قيمة التكلفة',
              value: '${s.stockCostValue.toStringAsFixed(2)} د.ل',
              icon: Icons.payments_outlined,
            ),
          ],
        );
      },
    );
  }
}

class _Stat extends StatelessWidget {
  final double width;
  final String label;
  final String value;
  final IconData icon;

  const _Stat({
    required this.width,
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: width,
      child: Card(
        elevation: 0,
        color: scheme.surfaceContainerHigh,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Icon(icon, color: scheme.primary),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        value,
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                        ),
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
}
