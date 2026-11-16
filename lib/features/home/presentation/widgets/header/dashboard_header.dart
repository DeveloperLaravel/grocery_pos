
import 'package:flutter/material.dart';

import 'theme_toggle_button.dart';
import 'header_icon_button.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: colors.primary.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(15),
          ),
          child:  ClipRRect(
  borderRadius: BorderRadius.circular(10),
  child: Image.asset(
    'assets/images/2.png',
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
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w900,
                  color: colors.onSurface,
                ),
              ),

              Text(
                'إدارة متجرك بكل سهولة',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),

        const ThemeToggleButton(),

        const SizedBox(width: 8),

        HeaderIconButton(
          icon: Icons.notifications_none_rounded,
          tooltip: 'الإشعارات',
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('لا توجد إشعارات جديدة'),
              ),
            );
          },
        ),
      ],
    );
  }
}
