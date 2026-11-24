
import 'package:flutter/material.dart';

import '../../domain/entities/stock_movement_entity.dart';

class MovementsSummary extends StatelessWidget {
  const MovementsSummary({
    super.key,
    required this.movements,
  });

  final List<StockMovementEntity> movements;

  @override
  Widget build(BuildContext context) {
    final incoming = movements.where((e) => e.isIncoming).length;
    final outgoing = movements.where((e) => e.isOutgoing).length;

    final incomingQuantity = movements
        .where((e) => e.isIncoming)
        .fold<double>(0, (sum, e) => sum + e.quantity);

    final outgoingQuantity = movements
        .where((e) => e.isOutgoing)
        .fold<double>(0, (sum, e) => sum + e.quantity);

    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = constraints.maxWidth >= 900
            ? 4
            : constraints.maxWidth >= 520
                ? 2
                : 1;

        const spacing = 12.0;
        final itemWidth =
            (constraints.maxWidth - (columns - 1) * spacing) /
                columns;

        final items = [
          _SummaryData(
            title: 'إجمالي الحركات',
            value: movements.length.toString(),
            subtitle: 'حركة مسجلة',
            icon: Icons.swap_vert_rounded,
            color: const Color(0xFF087F5B),
          ),
          _SummaryData(
            title: 'حركات الوارد',
            value: incoming.toString(),
            subtitle: 'كمية: ${_formatQuantity(incomingQuantity)}',
            icon: Icons.south_west_rounded,
            color: const Color(0xFF219653),
          ),
          _SummaryData(
            title: 'حركات الصادر',
            value: outgoing.toString(),
            subtitle: 'كمية: ${_formatQuantity(outgoingQuantity)}',
            icon: Icons.north_east_rounded,
            color: const Color(0xFFE58A27),
          ),
          _SummaryData(
            title: 'صافي الكمية',
            value: _formatQuantity(
              incomingQuantity - outgoingQuantity,
            ),
            subtitle: 'الوارد ناقص الصادر',
            icon: Icons.inventory_2_outlined,
            color: const Color(0xFF4776C7),
          ),
        ];

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: items.map((item) {
            return SizedBox(
              width: itemWidth,
              child: _SummaryCard(data: item),
            );
          }).toList(),
        );
      },
    );
  }

  String _formatQuantity(double value) {
    return value == value.roundToDouble()
        ? value.toInt().toString()
        : value.toStringAsFixed(2);
  }
}

class _SummaryData {
  const _SummaryData({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  final String title;
  final String value;
  final String subtitle;
  final IconData icon;
  final Color color;
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({
    required this.data,
  });

  final _SummaryData data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: theme.dividerColor.withValues(alpha: 0.12),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.025),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: data.color.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              data.icon,
              color: data.color,
              size: 23,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  data.value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  data.subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
