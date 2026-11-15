import 'package:flutter/material.dart';

import 'pos_mobile_layout.dart';
import 'pos_tablet_layout.dart';
import 'pos_desktop_layout.dart';

class PosResponsiveLayout extends StatelessWidget {
  const PosResponsiveLayout({
    super.key,
    required this.header,
    required this.search,
    required this.statistics,
    required this.products,
    required this.cart,
    required this.mobileCartBar,
  });

  final Widget header;
  final Widget search;
  final Widget statistics;
  final Widget products;
  final Widget cart;
  final Widget mobileCartBar;

  static const double mobileBreakpoint = 700;
  static const double tabletBreakpoint = 1100;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        if (width < mobileBreakpoint) {
          return PosMobileLayout(
            header: header,
            search: search,
            statistics: statistics,
            products: products,
            mobileCartBar: mobileCartBar,
          );
        }

        if (width < tabletBreakpoint) {
          return PosTabletLayout(
            header: header,
            search: search,
            statistics: statistics,
            products: products,
            cart: cart,
          );
        }

        return PosDesktopLayout(
          header: header,
          search: search,
          statistics: statistics,
          products: products,
          cart: cart,
        );
      },
    );
  }
}
