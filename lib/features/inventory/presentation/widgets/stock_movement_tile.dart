import 'package:flutter/material.dart';

import '../../domain/entities/stock_movement_entity.dart';
import '../helpers/inventory_formatters.dart';

class StockMovementTile extends StatelessWidget {
  const StockMovementTile({
    super.key,
    required this.movement,
  });

  final StockMovementEntity movement;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final incoming = movement.isIncoming;

    final color = incoming
        ? colors.primary
        : colors.error;

    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: colors.outlineVariant.withValues(alpha: 0.6),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 43,
            height: 43,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              InventoryFormatters.movementIcon(movement.type),
              color: color,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  InventoryFormatters.movementLabel(movement.type),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  movement.note?.isNotEmpty == true
                      ? movement.note!
                      : 'رقم المنتج: ${movement.productId}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: colors.onSurfaceVariant,
                    fontSize: 11,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  InventoryFormatters.dateTime(
                    movement.createdAt,
                  ),
                  style: TextStyle(
                    color: colors.onSurfaceVariant,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${incoming ? '+' : '-'}${InventoryFormatters.quantity(movement.quantity)}',
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                incoming ? 'وارد' : 'صادر',
                style: TextStyle(
                  color: colors.onSurfaceVariant,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}