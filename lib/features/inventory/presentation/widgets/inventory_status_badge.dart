import 'package:flutter/material.dart';

import '../helpers/inventory_formatters.dart';

class InventoryStatusBadge extends StatelessWidget {
  const InventoryStatusBadge({
    super.key,
    required this.quantity,
    required this.minStock,
  });

  final double quantity;
  final double minStock;

  @override
  Widget build(BuildContext context) {
    final color = InventoryFormatters.stockColor(
      quantity: quantity,
      minStock: minStock,
    );

    final label = InventoryFormatters.stockLabel(
      quantity: quantity,
      minStock: minStock,
    );

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.11),
        borderRadius: BorderRadius.circular(9),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 7,
            height: 7,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}