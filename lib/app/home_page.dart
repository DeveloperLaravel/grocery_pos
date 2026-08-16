import 'package:flutter/material.dart';
import 'package:grocery_pos/features/products/presentation/products_page.dart';
import 'package:grocery_pos/features/inventory/presentation/inventory_page.dart';
import 'package:grocery_pos/features/reports/presentation/reports_page.dart';
import 'package:grocery_pos/features/sales/presentation/sales_page.dart';

import '../features/pos/pos_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  final pages = const [PosPage(), ProductsPage(), InventoryPage(), SalesPage(), ReportsPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: pages[index]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (value) => setState(() => index = value),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.point_of_sale), label: 'البيع'),
          NavigationDestination(icon: Icon(Icons.inventory_2_outlined), label: 'المنتجات'),
          NavigationDestination(icon: Icon(Icons.warehouse_outlined), label: 'المخزون'),
          NavigationDestination(icon: Icon(Icons.receipt_long_outlined), label: 'الفواتير'),
          NavigationDestination(icon: Icon(Icons.analytics_outlined), label: 'التقارير'),
        ],
      ),
    );
  }
}
