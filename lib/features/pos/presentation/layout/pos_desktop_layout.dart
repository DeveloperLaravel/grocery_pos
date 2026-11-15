import 'package:flutter/material.dart';

class PosDesktopLayout extends StatelessWidget {
  const PosDesktopLayout({
    super.key,
    required this.header,
    required this.search,
    required this.statistics,
    required this.products,
    required this.cart,
  });

  final Widget header;
  final Widget search;
  final Widget statistics;
  final Widget products;
  final Widget cart;

  double _cartWidth(double width) {
    if (width < 1400) return 350;
    if (width < 1700) return 390;
    return 420;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final cartWidth = _cartWidth(width);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(width < 1400 ? 16 : 22),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: cartWidth,
                child: Card(
                  margin: EdgeInsets.zero,
                  clipBehavior: Clip.antiAlias,
                  child: cart,
                ),
              ),
              const SizedBox(width: 18),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    header,
                    const SizedBox(height: 16),
                    search,
                    const SizedBox(height: 16),
                    statistics,
                    const SizedBox(height: 16),
                    Expanded(
                      child: products,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
