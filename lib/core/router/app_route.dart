import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// Navigation
import '../../features/master_data/brands/presentation/pages/brands_page.dart';
import '../../features/categories/domain/entities/category.dart';
import '../../features/categories/presentation/pages/categories_page.dart';
import '../../features/categories/presentation/pages/category_form_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/pos/domain/entities/sale_receipt.dart';
import '../../features/products/presentation/bloc/products_bloc.dart';
import '../../features/products/presentation/bloc/products_event.dart';
import '../../features/products/presentation/pages/add_product_page.dart';
import '../../features/products/presentation/pages/edit_product_page.dart';
import '../../features/products/presentation/pages/product_barcode_scanner_page.dart';
import '../../features/products/presentation/pages/product_details_page.dart';
import '../../features/sales_inventory/sales/presentation/pages/receipt_page.dart';
import '../database/di/injection.dart';
import '../widgets/main_shell_page.dart';
import 'app_routes.dart';
// Home

// POS
import '../../features/pos/presentation/pages/pos_page.dart';

// Products
import '../../features/products/presentation/pages/products_page.dart';

// Inventory
import '../../features/inventory/presentation/pages/inventory_page.dart';
import '../../features/inventory/presentation/pages/stock_movements_page.dart';

// Sales
import '../../features/sales_inventory/sales/presentation/pages/sales_page.dart';

// Reports
import '../../features/reports/presentation/pages/reports_page.dart';

// Settings
import '../../features/settings/pages/settings_page.dart';

class AppRouter {
  AppRouter._();
  static final GoRouter router = GoRouter(
    initialLocation: '/home',
    debugLogDiagnostics: true,

    routes: [
      // =========================================
      // Main Shell
      // =========================================

      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainShellPage(
            navigationShell: navigationShell,
          );
        },
        branches: [
          // =====================================
          // 0 - Home
          // =====================================

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                name: AppRoutes.home,
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),

          // =========================================
// Brands
// =========================================

StatefulShellBranch(
  routes: [
    GoRoute(
      path: '/brands',
      name: AppRoutes.brands,
      builder: (context, state) => const BrandsPage(),
    ),
  ],
),
    StatefulShellBranch(
            routes: [
           GoRoute(
  path: '/categories',
  name: AppRoutes.categories,
  builder: (context, state) => const CategoriesPage(),
  routes: [
    GoRoute(
      path: 'add',
      name: AppRoutes.categoryAdd,
      builder: (context, state) => const CategoryFormPage(),
    ),
    GoRoute(
      path: ':id/edit',
      name: AppRoutes.categoryEdit,
      builder: (context, state) {
        final category = state.extra as Category;

        return CategoryFormPage(category: category);
      },
    ),
  ],
),
            ],
          ),

          // =====================================
          // 1 - POS
          // =====================================

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/pos',
                name: AppRoutes.pos,
                builder: (context, state) => const PosPage(),
              ),
              GoRoute(
                path: '/receipt',
                name: AppRoutes.saleReceipt,
                builder: (context, state) {
                  final receipt = state.extra;

                  if (receipt is! SaleReceipt) {
                    return const Scaffold(
                      body: Center(
                        child: Text('بيانات الفاتورة غير متوفرة'),
                      ),
                    );
                  }

                  return ReceiptPage(receipt: receipt);
                },
              ),
            ],
          ),

          // =====================================
          // 2 - Products
          // =====================================

 
StatefulShellBranch(
  routes: [
    GoRoute(
      path: '/products',
      name: AppRoutes.products,
      builder: (context, state) {
        return BlocProvider(
          create: (_) => getIt<ProductsBloc>()
            ..add(const ProductsEvent.started()),
          child: const ProductsPage(),
        );
      },
      routes: [
        GoRoute(
          path: 'add',
          name: AppRoutes.addProduct,
          builder: (context, state) {
            return BlocProvider(
              create: (_) => getIt<ProductsBloc>(),
              child: const AddProductPage(),
            );
          },
        ),

        GoRoute(
          path: 'barcode',
          name: 'productBarcodeScanner',
          builder: (context, state) {
            return const ProductBarcodeScannerPage();
          },
        ),

        GoRoute(
          path: ':id',
          name: AppRoutes.productDetails,
          builder: (context, state) {
            final id = int.parse(
              state.pathParameters['id']!,
            );

            return BlocProvider(
              create: (_) => getIt<ProductsBloc>(),
              child: ProductDetailsPage(
                productId: id,
              ),
            );
          },
          routes: [
            GoRoute(
              path: 'edit',
              name: AppRoutes.editProduct,
              builder: (context, state) {
                final id = int.parse(
                  state.pathParameters['id']!,
                );

                return BlocProvider(
                  create: (_) => getIt<ProductsBloc>(),
                  child: EditProductPage(
                    productId: id,
                  ),
                );
              },
            ),
          ],
        ),
      ],
    ),
  ],
),


          // =====================================
          // 3 - Inventory
          // =====================================

          // =====================================
// 3 - Inventory
// =====================================

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/inventory',
                name: AppRoutes.inventory,
                builder: (context, state) {
                  return const InventoryPage();
                },
                routes: [
                  GoRoute(
                    path: 'movements',
                    name: AppRoutes.stockMovements,
                    builder: (context, state) {
                      return const StockMovementsPage();
                    },
                  ),
                  GoRoute(
                    path: 'low-stock',
                    name: AppRoutes.lowStock,
                    builder: (context, state) {
                      return const InventoryPage(
                        initialLowStockOnly: true,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),

          // =====================================
          // 4 - Sales
          // =====================================

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/sales',
                name: AppRoutes.sales,
                builder: (context, state) => const SalesPage(),
                routes: [
                  GoRoute(
                    path: ':id',
                    name: AppRoutes.saleDetails,
                    builder: (context, state) {
                      final saleId = int.parse(
                        state.pathParameters['id']!,
                      );

                      return SaleDetailsPage(
                        saleId: saleId,
                      );
                    },
                    routes: [
                      GoRoute(
                        path: 'print',
                        name: AppRoutes.salePrint,
                        builder: (context, state) {
                          final saleId = int.parse(
                            state.pathParameters['id']!,
                          );

                          return ReceiptPrintPreviewPage(
                            saleId: saleId,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),

      // =========================================
      // Pages Outside Main Shell
      // =========================================

      GoRoute(
        path: '/reports',
        name: AppRoutes.reports,
        builder: (context, state) => const ReportsPage(),
      ),

      GoRoute(
        path: '/settings',
        name: AppRoutes.settings,
        builder: (context, state) => const SettingsPage(),
      ),
    ],

    // =========================================
    // Error Page
    // =========================================

    errorBuilder: (context, state) {
      return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.error_outline_rounded,
                  size: 60,
                  color: Colors.red,
                ),
                const SizedBox(height: 16),
                Text(
                  'الصفحة غير موجودة',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  state.error?.toString() ?? '',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    context.goNamed(AppRoutes.home);
                  },
                  icon: const Icon(Icons.home_rounded),
                  label: const Text('العودة للرئيسية'),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
