import 'package:flutter/material.dart';

class PosMobileLayout extends StatelessWidget {
  const PosMobileLayout({
    super.key,
    required this.header,
    required this.search,
    required this.statistics,
    required this.products,
    required this.mobileCartBar,
  });

  final Widget header;
  final Widget search;
  final Widget statistics;
  final Widget products;
  final Widget mobileCartBar;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colors.surface,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
              child: header,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: search,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 6),
              child: statistics,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 4, 10, 8),
                child: products,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: mobileCartBar,
      ),
    );
  }
}
