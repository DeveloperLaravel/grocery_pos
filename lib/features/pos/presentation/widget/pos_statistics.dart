import 'package:flutter/material.dart';

class PosStatistics extends StatelessWidget {
  const PosStatistics({
    super.key,
    required this.productsCount,
    required this.lowStockCount,
    required this.outOfStockCount,
  });

  final int productsCount;
  final int lowStockCount;
  final int outOfStockCount;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final compact = constraints.maxWidth < 500;
        final gap = compact ? 6.0 : 10.0;

        final cards = [
          _StatData(
            title: 'المنتجات',
            value: productsCount.toString(),
            icon: Icons.inventory_2_outlined,
            color: Colors.blue,
          ),
          _StatData(
            title: 'مخزون منخفض',
            value: lowStockCount.toString(),
            icon: Icons.warning_amber_rounded,
            color: Colors.orange,
          ),
          _StatData(
            title: 'نفد المخزون',
            value: outOfStockCount.toString(),
            icon: Icons.remove_shopping_cart_outlined,
            color: Colors.red,
          ),
        ];

        return Row(
          children: [
            for (var i = 0; i < cards.length; i++) ...[
              Expanded(
                child: _StatCard(
                  data: cards[i],
                  compact: compact,
                ),
              ),
              if (i != cards.length - 1) SizedBox(width: gap),
            ],
          ],
        );
      },
    );
  }
}

class _StatData {
  const _StatData({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  final String title;
  final String value;
  final IconData icon;
  final Color color;
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.data,
    required this.compact,
  });

  final _StatData data;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 8 : 12,
        vertical: compact ? 9 : 12,
      ),
      decoration: BoxDecoration(
        color: colors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(13),
        border: Border.all(
          color: colors.outlineVariant.withValues(alpha: 0.45),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: compact ? 30 : 38,
            height: compact ? 30 : 38,
            decoration: BoxDecoration(
              color: data.color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              data.icon,
              color: data.color,
              size: compact ? 17 : 21,
            ),
          ),
          SizedBox(width: compact ? 6 : 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                ),
                const SizedBox(height: 2),
                Text(
                  data.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
