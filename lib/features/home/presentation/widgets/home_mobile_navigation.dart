import 'package:flutter/material.dart';

import 'package:grocery_pos/features/home/presentation/home_navigation.dart';

class HomeMobileNavigation extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const HomeMobileNavigation({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: onSelected,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      destinations: [
        for (var i = 0; i < HomeNavigation.destinations.length; i++)
          NavigationDestination(
            icon: Icon(HomeNavigation.destinations[i].icon),
            selectedIcon:
                Icon(HomeNavigation.destinations[i].selectedIcon),
            label: HomeNavigation.destinations[i].label,
          ),
      ],
    );
  }
}
