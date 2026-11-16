import 'package:flutter/material.dart';

class NavigationHeader extends StatelessWidget {
  const NavigationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(
        16,
        24,
        16,
        28,
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: colors.onSurface,
              borderRadius: BorderRadius.circular(14),
            ),
            child:   ClipRRect(
  borderRadius: BorderRadius.circular(1),
  child: Image.asset(
    'assets/images/10.png',
    width: 27,
    height: 27,
    fit: BoxFit.contain,
    errorBuilder: (context, error, stackTrace) {
      return Icon(
        Icons.storefront_rounded,
        color: colors.primary,
        size: 27,
      );
    },
  ),
),
),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'شركة كوّاد البراق',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 3),
                Text(
                  ' نظام إدارة المتجر كامل',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
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