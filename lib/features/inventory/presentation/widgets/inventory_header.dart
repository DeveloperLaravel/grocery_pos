import 'package:flutter/material.dart';


class InventoryHeader extends StatelessWidget {
  const InventoryHeader({
    super.key,
    required this.onRefresh,
    required this.onMovements,
    required this.onAdjust,
    this.isLoading = false,
  });

  final VoidCallback onRefresh;
  final VoidCallback onMovements;
  final VoidCallback onAdjust;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isMobile = MediaQuery.sizeOf(context).width < 600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: colors.primary.withValues(alpha: 0.10),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                Icons.inventory_2_rounded,
                color: colors.primary,
                size: 27,
              ),
            ),
            const SizedBox(width: 13),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'إدارة المخزون',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    'متابعة المنتجات والكميات وحركات المخزون',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(
                          color: colors.onSurfaceVariant,
                        ),
                  ),
                ],
              ),
            ),

            IconButton.filledTonal(
              tooltip: 'تحديث البيانات',
              onPressed: isLoading ? null : onRefresh,
              icon: isLoading
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    )
                  : const Icon(Icons.refresh_rounded),
            ),
          ],
        ),

        const SizedBox(height: 20),

        if (isMobile)
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FilledButton.icon(
                onPressed: onAdjust,
                icon: const Icon(Icons.tune_rounded),
                label: const Text('تسوية المخزون'),
              ),
              const SizedBox(height: 9),
              OutlinedButton.icon(
                onPressed: onMovements,
                icon: const Icon(Icons.history_rounded),
                label: const Text('حركات المخزون'),
              ),
            ],
          )
        else
          Row(
            children: [
              FilledButton.icon(
                onPressed: onAdjust,
                icon: const Icon(Icons.tune_rounded),
                label: const Text('تسوية المخزون'),
              ),
              const SizedBox(width: 10),
              OutlinedButton.icon(
                onPressed: onMovements,
                icon: const Icon(Icons.history_rounded),
                label: const Text('حركات المخزون'),
              ),
            ],
          ),
      ],
    );
  }
}