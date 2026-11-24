
import 'package:injectable/injectable.dart';

import 'app_database.dart';

// =====================================================
// Products DAOs
// =====================================================

import 'daos/master_data/parties/brands_dao.dart';
import 'daos/master_data/parties/categories_dao.dart';
import 'daos/master_data/parties/customers_dao.dart';
import 'daos/sales_inventory/pos/cash_movements_dao.dart';
import 'daos/sales_inventory/pos/cash_registers_dao.dart';
import 'daos/sales_inventory/pos/cashier_shifts_dao.dart';
import 'daos/sales_inventory/pos/pos_held_sales_dao.dart';
import 'daos/sales_inventory/pos/pos_settings_dao.dart';
import 'daos/sales_inventory/pos/pos_terminals_dao.dart';
import 'daos/master_data/products/products_dao.dart';
import 'daos/master_data/products/product_units_dao.dart';
import 'daos/master_data/products/product_barcodes_dao.dart';
import 'daos/master_data/products/product_images_dao.dart';

// =====================================================
// Categories
// =====================================================


// =====================================================
// Sales DAOs
// =====================================================

import 'daos/sales_inventory/purchases/purchase_receipts_dao.dart';
import 'daos/sales_inventory/sales/sales_dao.dart';
import 'daos/sales_inventory/sales/checkout_dao.dart';

// =====================================================
// Purchases DAOs
// =====================================================

import 'daos/sales_inventory/purchases/purchase_orders_dao.dart';
import 'daos/sales_inventory/purchases/purchase_payments_dao.dart';

// =====================================================
// Inventory DAOs
// =====================================================

import 'daos/stock_dao.dart';

// =====================================================
// Customers & Suppliers DAOs
// =====================================================


// =====================================================
// Dashboard & Reports DAOs
// =====================================================

import 'daos/home_dao.dart';
import 'daos/reports_dao.dart';

// =====================================================
// System DAOs
// =====================================================

import 'daos/database_maintenance_dao.dart';

@module
abstract class DatabaseModule {
  // =====================================================
  // Database
  // =====================================================

  @lazySingleton
  AppDatabase provideAppDatabase() {
    return AppDatabase();
  }

  // =====================================================
  // Products
  // =====================================================

  @lazySingleton
  ProductsDao provideProductsDao(AppDatabase db) {
    return db.productsDao;
  }

  @lazySingleton
  BrandsDao provideBrandsDao(AppDatabase db) {
    return db.brandsDao;
  }

  @lazySingleton
  ProductUnitsDao provideProductUnitsDao(AppDatabase db) {
    return db.productUnitsDao;
  }

  @lazySingleton
  ProductBarcodesDao provideProductBarcodesDao(AppDatabase db) {
    return db.productBarcodesDao;
  }

  @lazySingleton
  ProductImagesDao provideProductImagesDao(AppDatabase db) {
    return db.productImagesDao;
  }

  // =====================================================
  // Categories
  // =====================================================

  @lazySingleton
  CategoriesDao provideCategoriesDao(AppDatabase db) {
    return db.categoriesDao;
  }

  // =====================================================
  // Sales
  // =====================================================

  @lazySingleton
  SalesDao provideSalesDao(AppDatabase db) {
    return db.salesDao;
  }

  @lazySingleton
  CheckoutDao provideCheckoutDao(AppDatabase db) {
    return db.checkoutDao;
  }
    @lazySingleton
  PosTerminalsDao get posTerminalsDao;

  @lazySingleton
  CashRegistersDao get cashRegistersDao;

  @lazySingleton
  CashierShiftsDao get cashierShiftsDao;

  @lazySingleton
  CashMovementsDao get cashMovementsDao;

  @lazySingleton
  PosSettingsDao get posSettingsDao;

  @lazySingleton
  PosHeldSalesDao get posHeldSalesDao;

  // =====================================================
  // Purchases
  // =====================================================

 
  @lazySingleton
  PurchaseOrdersDao providePurchaseOrdersDao(AppDatabase db) {
    return db.purchaseOrdersDao;
  }

  @lazySingleton
  PurchaseReceiptsDao providePurchaseReceiptsDao(AppDatabase db) {
    return db.purchaseReceiptsDao;
  }

  @lazySingleton
  PurchasePaymentsDao providePurchasePaymentsDao(AppDatabase db) {
    return db.purchasePaymentsDao;
  }



  // =====================================================
  // Inventory
  // =====================================================


  // =====================================================
  // Customers
  // =====================================================

  @lazySingleton
  CustomersDao provideCustomersDao(AppDatabase db) {
    return db.customersDao;
  }

  // =====================================================
  // Dashboard
  // =====================================================

  @lazySingleton
  HomeDao provideHomeDao(AppDatabase db) {
    return db.homeDao;
  }

  // =====================================================
  // Reports
  // =====================================================

  @lazySingleton
  ReportsDao provideReportsDao(AppDatabase db) {
    return db.reportsDao;
  }

  // =====================================================
  // Database Maintenance
  // =====================================================

  @lazySingleton
  DatabaseMaintenanceDao provideDatabaseMaintenanceDao(
    AppDatabase db,
  ) {
    return db.databaseMaintenanceDao;
  }

  
}
