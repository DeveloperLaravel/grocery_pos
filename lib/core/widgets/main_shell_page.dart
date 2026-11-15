import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'navigation_bottom_bar.dart';
import 'navigation_drawer_widget.dart';
import 'navigation_rail_widget.dart';

class MainShellPage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainShellPage({
    super.key,
    required this.navigationShell,
  });

  void _onDestinationSelected(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        // Mobile
        if (width < 600) {
          return _buildMobileLayout(context);
        }

        // Tablet
        if (width < 1024) {
          return _buildTabletLayout();
        }

        // Desktop
        return _buildDesktopLayout(context);
      },
    );
  }

  // =========================================
  // Mobile Layout
  // =========================================

  Widget _buildMobileLayout(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBottomBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: _onDestinationSelected,
      ),
    );
  }

  // =========================================
  // Tablet Layout
  // =========================================

  Widget _buildTabletLayout() {
    return Scaffold(
      body: Row(
        children: [
          NavigationRailWidget(
            selectedIndex: navigationShell.currentIndex,
            onDestinationSelected: _onDestinationSelected,
          ),
          Expanded(
            child: navigationShell,
          ),
        ],
      ),
    );
  }

  // =========================================
  // Desktop Layout
  // =========================================

  Widget _buildDesktopLayout(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationDrawerWidget(
            selectedIndex: navigationShell.currentIndex,
            onDestinationSelected: _onDestinationSelected,
          ),
          Expanded(
            child: navigationShell,
          ),
        ],
      ),
    );
  }
}