import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../features/pos/cashier_shifts/domain/entities/sale_receipt.dart';
import 'app_routes.dart';

class AppNavigation {
  const AppNavigation._();

  // Main Navigation

  static void home(BuildContext context) {
    context.goNamed(AppRoutes.home);
  }
static void categories(BuildContext context) {
  context.pushNamed(AppRoutes.categories);
}

  static void pos(BuildContext context) {
    context.goNamed(AppRoutes.pos);
  }

  static void products(BuildContext context) {
    context.goNamed(AppRoutes.products);
  }
static void productBarcodes(
  BuildContext context,
  int productId,
) {
  context.pushNamed(
    AppRoutes.productBarcodes,
    pathParameters: {
      'id': productId.toString(),
    },
  );
}
static void productUnits(
  BuildContext context,
  int productId,
) {
  context.pushNamed(
    AppRoutes.productUnits,
    pathParameters: {
      'id': productId.toString(),
    },
  );
}
static void brands(BuildContext context) {
  context.pushNamed(AppRoutes.brands);
}
  static void inventory(BuildContext context) {
    context.goNamed(AppRoutes.inventory);
  }

  static void sales(BuildContext context) {
    context.goNamed(AppRoutes.sales);
  }

  // Inventory

  static void stockMovements(BuildContext context) {
    context.pushNamed(AppRoutes.stockMovements);
  }

  static void lowStock(BuildContext context) {
    context.pushNamed(AppRoutes.lowStock);
  }

  // Products

  static void addProduct(BuildContext context) {
    context.pushNamed(AppRoutes.addProduct);
  }

  static void productDetails(
    BuildContext context,
    int productId,
  ) {
    context.pushNamed(
      AppRoutes.productDetails,
      pathParameters: {'id': productId.toString()},
    );
  }

  static void editProduct(
    BuildContext context,
    int productId,
  ) {
    context.pushNamed(
      AppRoutes.editProduct,
      pathParameters: {'id': productId.toString()},
    );
  }

  // Receipt

  static void receipt(
    BuildContext context,
    SaleReceipt receipt,
  ) {
    context.pushNamed(
      AppRoutes.saleReceipt,
      extra: receipt,
    );
  }

  // Sales

  static void saleDetails(
    BuildContext context,
    int saleId,
  ) {
    context.pushNamed(
      AppRoutes.saleDetails,
      pathParameters: {'id': saleId.toString()},
    );
  }

  static void salePrint(
    BuildContext context,
    int saleId,
  ) {
    context.pushNamed(
      AppRoutes.salePrint,
      pathParameters: {'id': saleId.toString()},
    );
  }

  // Reports

  static void reports(BuildContext context) {
    context.pushNamed(AppRoutes.reports);
  }

  // Settings

  static void settings(BuildContext context) {
    context.pushNamed(AppRoutes.settings);
  }

  // Back

  static void back(BuildContext context) {
    if (context.canPop()) {
      context.pop();
    } else {
      home(context);
    }
  }
}
