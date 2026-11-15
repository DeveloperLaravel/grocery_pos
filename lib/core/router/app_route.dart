import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Navigation
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/pos/domain/entities/sale_receipt.dart';
import '../../features/sales/presentation/pages/receipt_page.dart';
import '../widgets/main_shell_page.dart';
import 'app_routes.dart';
import '../../features/sales/presentation/pages/receipt_print_preview_page.dart';
// Home

// POS
import '../../features/pos/presentation/pages/pos_page.dart';

// Products
import '../../features/products/presentation/pages/products_page.dart';

// Inventory
import '../../features/inventory/presentation/pages/inventory_page.dart';
import '../../features/inventory/presentation/pages/stock_movements_page.dart';

// Sales
import '../../features/sales/presentation/pages/sales_page.dart';
import '../../features/sales/presentation/pages/sale_details_page.dart';
import '../../features/sales/presentation/pages/receipt_print_preview_page.dart';

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
              builder: (context, state) => const ProductsPage(),
              routes: [
                GoRoute(
                  path: 'add',
                  name: AppRoutes.addProduct,
                  builder: (context, state) {
                    // استبدلها بصفحة AddProductPage عند إنشائها.
                    return const ProductsPage();
                  },
                ),

                // أضف تفاصيل المنتج وتعديله هنا
                // بعد إنشاء ProductDetailsPage و EditProductPage.
              ],
            ),
          ],
        ),

        // =====================================
        // 3 - Inventory
        // =====================================

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/inventory',
              name: AppRoutes.inventory,
              builder: (context, state) => const InventoryPage(),
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
                    // استبدلها بصفحة المنتجات منخفضة المخزون.
                    return const InventoryPage();
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