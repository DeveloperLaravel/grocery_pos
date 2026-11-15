import 'package:flutter/material.dart';

class PosTabletLayout extends StatelessWidget {
  const PosTabletLayout({
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

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final cartWidth = (width * 0.36).clamp(300.0, 370.0);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14),
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
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  children: [
                    header,
                    const SizedBox(height: 12),
                    search,
                    const SizedBox(height: 12),
                    statistics,
                    const SizedBox(height: 12),
                    Expanded(child: products),
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
