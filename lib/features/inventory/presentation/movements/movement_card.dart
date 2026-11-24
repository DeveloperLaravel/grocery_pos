
import 'package:flutter/material.dart';

import '../../domain/entities/stock_movement_entity.dart';

class MovementCard extends StatelessWidget {
  const MovementCard({
    super.key,
    required this.movement,
    this.productName,
  });

  final StockMovementEntity movement;
  final String? productName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final incoming = movement.isIncoming;

    final color = incoming
        ? const Color(0xFF219653)
        : const Color(0xFFE58A27);

    final title = _movementTitle(movement.type);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: theme.dividerColor.withValues(alpha: 0.12),
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final compact = constraints.maxWidth < 360;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 43,
                    height: 43,
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.10),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Icon(
                      incoming
                          ? Icons.south_west_rounded
                          : Icons.north_east_rounded,
                      color: color,
                    ),
                  ),
                  const SizedBox(width: 11),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          productName ?? 'المنتج رقم ${movement.productId}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  _QuantityBadge(
                    quantity: movement.quantity,
                    color: color,
                    incoming: incoming,
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Divider(
                height: 1,
                color: theme.dividerColor.withValues(alpha: 0.15),
              ),
              const SizedBox(height: 12),
              if (compact)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _MovementInfo(
                      icon: Icons.calendar_today_outlined,
                      text: _formatDate(movement.createdAt),
                    ),
                    if (movement.reference?.isNotEmpty == true) ...[
                      const SizedBox(height: 9),
                      _MovementInfo(
                        icon: Icons.tag_rounded,
                        text: movement.reference!,
                      ),
                    ],
                  ],
                )
              else
                Row(
                  children: [
                    Expanded(
                      child: _MovementInfo(
                        icon: Icons.calendar_today_outlined,
                        text: _formatDate(movement.createdAt),
                      ),
                    ),
                    if (movement.reference?.isNotEmpty == true)
                      Expanded(
                        child: _MovementInfo(
                          icon: Icons.tag_rounded,
                          text: movement.reference!,
                        ),
                      ),
                  ],
                ),
              if (movement.note?.isNotEmpty == true) ...[
                const SizedBox(height: 10),
                _MovementInfo(
                  icon: Icons.notes_rounded,
                  text: movement.note!,
                ),
              ],
            ],
          );
        },
      ),
    );
  }

  String _movementTitle(String type) {
    switch (type) {
      case 'in':
        return 'إضافة مخزون';
      case 'out':
        return 'صرف مخزون';
      case 'sale':
        return 'عملية بيع';
      case 'return':
        return 'مرتجع';
      default:
        return 'حركة مخزون';
    }
  }

  String _formatDate(DateTime value) {
    final date = value.toLocal();

    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year.toString();

    final hour = date.hour.toString().padLeft(2, '0');
    final minute = date.minute.toString().padLeft(2, '0');

    return '$year-$month-$day  $hour:$minute';
  }
}

class _QuantityBadge extends StatelessWidget {
  const _QuantityBadge({
    required this.quantity,
    required this.color,
    required this.incoming,
  });

  final double quantity;
  final Color color;
  final bool incoming;

  @override
  Widget build(BuildContext context) {
    final formatted = quantity == quantity.roundToDouble()
        ? quantity.toInt().toString()
        : quantity.toStringAsFixed(2);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        '${incoming ? '+' : '-'}$formatted',
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
    );
  }
}

class _MovementInfo extends StatelessWidget {
  const _MovementInfo({
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 15,
          color: theme.colorScheme.onSurfaceVariant,
        ),
        const SizedBox(width: 7),
        Expanded(
          child: Text(
            text,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }
}
