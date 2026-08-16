import 'package:flutter/material.dart';

import 'package:grocery_pos/features/home/presentation/home_navigation.dart';

class HomeNavigationRail extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onSelected;
  final bool extended;

  const HomeNavigationRail({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
    required this.extended,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Material(
      color: scheme.surface,
      child: SafeArea(
        right: false,
        child: NavigationRail(
          selectedIndex: selectedIndex,
          onDestinationSelected: onSelected,
          extended: extended,
          minWidth: 96,
          minExtendedWidth: 210,
          groupAlignment: -0.82,
          leading: Padding(
            padding: const EdgeInsets.only(
              top: 12,
              bottom: 12,
            ),
            child: extended
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const _Logo(),
                      const SizedBox(width: 10),
                      
                    ],
                  )
                : const _Logo(),
          ),
          destinations: [
            for (
              var i = 0;
              i < HomeNavigation.destinations.length;
              i++
            )
              NavigationRailDestination(
                icon: Icon(
                  HomeNavigation.destinations[i].icon,
                ),
                selectedIcon: Icon(
                  HomeNavigation.destinations[i].selectedIcon,
                ),
                label: Text(
                  HomeNavigation.destinations[i].label,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 152,
      height: 152,
      padding: const EdgeInsets.all(4),
      child: Image.asset(
        'assets/images/2.png',
        fit: BoxFit.contain,
        filterQuality: FilterQuality.high,
      ),
    );
  }
}