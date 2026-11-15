import 'package:flutter/material.dart';

import '../router/app_navigation.dart';
import 'navigation_header.dart';
import 'navigation_item.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  const NavigationDrawerWidget({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  static const List<NavigationItem> items = [
    NavigationItem(
      label: 'الرئيسية',
      icon: Icons.home_outlined,
      selectedIcon: Icons.home_rounded,
    ),
    NavigationItem(
      label: 'نقطة البيع',
      icon: Icons.point_of_sale_outlined,
      selectedIcon: Icons.point_of_sale_rounded,
    ),
    NavigationItem(
      label: 'المنتجات',
      icon: Icons.inventory_2_outlined,
      selectedIcon: Icons.inventory_2_rounded,
    ),
    NavigationItem(
      label: 'المخزون',
      icon: Icons.warehouse_outlined,
      selectedIcon: Icons.warehouse_rounded,
    ),
    NavigationItem(
      label: 'المبيعات',
      icon: Icons.receipt_long_outlined,
      selectedIcon: Icons.receipt_long_rounded,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      width: 260,
      decoration: BoxDecoration(
        color: colors.surface,
        border: BorderDirectional(
          end: BorderSide(
            color: colors.outlineVariant.withValues(alpha: 0.5),
          ),
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const NavigationHeader(),

            Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 18,
                bottom: 12,
              ),
              child: Text(
                'القائمة الرئيسية',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: colors.onSurfaceVariant,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),

            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: items.length,
                separatorBuilder: (_, __) => const SizedBox(height: 5),
                itemBuilder: (context, index) {
                  return NavigationItemWidget(
                    item: items[index],
                    selected: selectedIndex == index,
                    onTap: () => onDestinationSelected(index),
                  );
                },
              ),
            ),

            Divider(
              color: colors.outlineVariant,
              height: 1,
            ),

            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  _DrawerAction(
                    icon: Icons.analytics_outlined,
                    label: 'التقارير',
                    onTap: () => AppNavigation.reports(context),
                  ),
                  _DrawerAction(
                    icon: Icons.settings_outlined,
                    label: 'الإعدادات',
                    onTap: () => AppNavigation.settings(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _DrawerAction({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: Icon(icon),
      title: Text(label),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      onTap: onTap,
    );
  }
}