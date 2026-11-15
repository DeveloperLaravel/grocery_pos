import 'package:flutter/material.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({
    super.key,
    required this.itemCount,
    this.onClose,
    this.onClear,
    this.isMobile = false,
  });

  final int itemCount;
  final VoidCallback? onClose;
  final VoidCallback? onClear;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final compact = MediaQuery.sizeOf(context).height < 650;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 12 : 16,
        vertical: compact ? 9 : 14,
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: colors.primaryContainer,
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(
              Icons.shopping_bag_outlined,
              color: colors.primary,
            ),
          ),
          const SizedBox(width: 11),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'سلة المبيعات',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 3),
                Text(
                  '$itemCount أصناف في السلة',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                ),
              ],
            ),
          ),
          if (itemCount > 0 && onClear != null)
            IconButton(
              onPressed: onClear,
              tooltip: 'إفراغ السلة',
              icon: Icon(
                Icons.delete_sweep_outlined,
                color: colors.error,
              ),
            ),
          if (isMobile && onClose != null)
            IconButton(
              onPressed: onClose,
              tooltip: 'إغلاق',
              icon: const Icon(Icons.close_rounded),
            ),
        ],
      ),
    );
  }
}
