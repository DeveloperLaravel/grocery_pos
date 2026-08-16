import 'package:flutter/material.dart';

import 'package:grocery_pos/features/home/presentation/home_navigation.dart';
import 'package:grocery_pos/features/home/presentation/widgets/home_mobile_navigation.dart';
import 'package:grocery_pos/features/home/presentation/widgets/home_navigation_rail.dart';

/// الواجهة الرئيسية المتجاوبة لتطبيق "حسابات".
///
/// الهاتف: NavigationBar في الأسفل.
/// التابلت: NavigationRail مصغر.
/// Windows/Desktop: NavigationRail موسع.
///
/// IndexedStack يحافظ على حالة كل صفحة عند التنقل، بدل إعادة إنشائها.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _selectPage(int index) {
    if (index == _selectedIndex) return;

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        // هاتف / نافذة ضيقة.
        final useBottomNavigation = width < 700;

        // تابلت أو نافذة متوسطة.
        final useCompactRail = width >= 700 && width < 1150;

        if (useBottomNavigation) {
          return Scaffold(
            backgroundColor: scheme.surfaceContainerLowest,
            body: SafeArea(
              bottom: false,
              child: _pages(),
            ),
            bottomNavigationBar: HomeMobileNavigation(
              selectedIndex: _selectedIndex,
              onSelected: _selectPage,
            ),
          );
        }

        return Scaffold(
          backgroundColor: scheme.surfaceContainerLowest,
          body: Row(
            children: [
              HomeNavigationRail(
                selectedIndex: _selectedIndex,
                onSelected: _selectPage,
                extended: !useCompactRail,
              ),
              VerticalDivider(
                width: 1,
                thickness: 1,
                color: scheme.outlineVariant,
              ),
              Expanded(
                child: SafeArea(
                  left: false,
                  child: _pages(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _pages() {
    return IndexedStack(
      index: _selectedIndex,
      children: HomeNavigation.pages,
    );
  }
}
