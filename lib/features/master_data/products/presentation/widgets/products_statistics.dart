
import 'package:flutter/material.dart';

import 'product_stat_card.dart';

class ProductsStatistics extends StatelessWidget {
  final int total;
  final int lowStock;
  final int available;

  final bool compact;
  final bool veryCompact;

  const ProductsStatistics({
    super.key,
    required this.total,
    required this.lowStock,
    required this.available,
    required this.compact,
    required this.veryCompact,
  });

  @override
  Widget build(BuildContext context) {
    final cards = [
      ProductStatCard(
        title: 'إجمالي المنتجات',
        value: total.toString(),
        icon: Icons.inventory_2_outlined,
        color: Theme.of(context).colorScheme.primary,
      ),

      ProductStatCard(
        title: 'مخزون منخفض',
        value: lowStock.toString(),
        icon: Icons.warning_amber_rounded,
        color: Theme.of(context).colorScheme.tertiary,
      ),

      ProductStatCard(
        title: 'متوفر بالمخزون',
        value: available.toString(),
        icon: Icons.check_circle_outline_rounded,
        color: Theme.of(context).colorScheme.secondary,
      ),
    ];

    if (veryCompact) {
      return Column(
        children: [
          Row(
            children: [
              Expanded(child: cards[0]),
              const SizedBox(width: 8),
              Expanded(child: cards[1]),
            ],
          ),

          const SizedBox(height: 8),

          cards[2],
        ],
      );
    }

    return Row(
      children: [
        for (int i = 0; i < cards.length; i++) ...[
          Expanded(child: cards[i]),

          if (i != cards.length - 1)
            const SizedBox(width: 12),
        ],
      ],
    );
  }
}
