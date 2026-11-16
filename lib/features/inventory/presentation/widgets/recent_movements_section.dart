import 'package:flutter/material.dart';

import '../../domain/entities/stock_movement_entity.dart';
import 'inventory_empty_state.dart';
import 'stock_movement_tile.dart';

class RecentMovementsSection extends StatelessWidget {
  const RecentMovementsSection({
    super.key,
    required this.movements,
    required this.onViewAll,
  });

  final List<StockMovement> movements;
  final VoidCallback onViewAll;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.history_rounded),
            const SizedBox(width: 9),
            const Expanded(
              child: Text(
                'أحدث الحركات',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: onViewAll,
              child: const Text('عرض الكل'),
            ),
          ],
        ),

        const SizedBox(height: 12),

        if (movements.isEmpty)
          const InventoryEmptyState(
            title: 'لا توجد حركات',
            message: 'ستظهر هنا عمليات الإضافة والصرف والبيع.',
            icon: Icons.history_rounded,
          )
        else
          ...movements.take(5).map(
            (movement) => Padding(
              padding: const EdgeInsets.only(bottom: 9),
              child: StockMovementTile(
                movement: movement,
              ),
            ),
          ),
      ],
    );
  }
}