import 'package:flutter/material.dart';

import 'package:grocery_pos/features/home/domain/entities/home_destination.dart';
import 'package:grocery_pos/features/pos/presentation/pages/pos_page.dart';
import 'package:grocery_pos/features/products/presentation/pages/products_page.dart';
import 'package:grocery_pos/features/sales/presentation/sales_page.dart';

import '../../inventory/presentation/pages/inventory_page.dart';
import '../../reports/presentation/pages/reports_page.dart';

/// تعريف الوجهات في مكان واحد بدل تكرارها داخل HomePage.
abstract final class HomeNavigation {
  static const destinations = <HomeDestination>[
    HomeDestination(
      label: 'البيع',
      icon: Icons.point_of_sale_outlined,
      selectedIcon: Icons.point_of_sale_rounded,
    ),
    HomeDestination(
      label: 'المنتجات',
      icon: Icons.inventory_2_outlined,
      selectedIcon: Icons.inventory_2_rounded,
    ),
    HomeDestination(
      label: 'المخزون',
      icon: Icons.warehouse_outlined,
      selectedIcon: Icons.warehouse_rounded,
    ),
    HomeDestination(
      label: 'الفواتير',
      icon: Icons.receipt_long_outlined,
      selectedIcon: Icons.receipt_long_rounded,
    ),
    HomeDestination(
      label: 'التقارير',
      icon: Icons.analytics_outlined,
      selectedIcon: Icons.analytics_rounded,
    ),
  ];

  static const pages = <Widget>[
    PosPage(),
    ProductsPage(),
    InventoryPage(),
    SalesPage(),
    ReportsPage(),
  ];
}
