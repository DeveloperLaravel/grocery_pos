import 'package:flutter/material.dart';

import 'navigation_drawer_widget.dart';

class NavigationRailWidget extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  const NavigationRailWidget({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      width: 88,
      decoration: BoxDecoration(
        color: colors.surface,
        border: BorderDirectional(
          end: BorderSide(
            color: colors.outlineVariant.withValues(alpha: 0.5),
          ),
        ),
      ),
      child: SafeArea(
        child: NavigationRail(
          selectedIndex: selectedIndex,
          onDestinationSelected: onDestinationSelected,
          labelType: NavigationRailLabelType.all,
          backgroundColor: colors.surface,
          indicatorColor: colors.primary.withValues(alpha: 0.12),
          selectedIconTheme: IconThemeData(
            color: colors.primary,
            size: 24,
          ),
          unselectedIconTheme: IconThemeData(
            color: colors.onSurfaceVariant,
            size: 22,
          ),
          selectedLabelTextStyle: TextStyle(
            color: colors.primary,
            fontSize: 11,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelTextStyle: TextStyle(
            color: colors.onSurfaceVariant,
            fontSize: 11,
          ),
          leading: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Icon(
              Icons.storefront_rounded,
              size: 30,
              color: colors.primary,
            ),
          ),
          destinations: NavigationDrawerWidget.items.map((item) {
            return NavigationRailDestination(
              icon: Icon(item.icon),
              selectedIcon: Icon(item.selectedIcon),
              label: Text(item.label),
            );
          }).toList(),
        ),
      ),
    );
  }
}