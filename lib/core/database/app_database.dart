
import 'package:drift/drift.dart';

// =========================================
// Database Connection
// =========================================

import 'daos/master_data/parties/customers_dao.dart';
import 'daos/master_data/parties/suppliers_dao.dart';
import 'daos/sales_inventory/purchases/purchase_items_dao.dart';
import 'daos/sales_inventory/purchases/purchase_orders_dao.dart';
import 'daos/sales_inventory/purchases/purchase_orders_table.dart';
import 'daos/sales_inventory/purchases/purchase_payments_dao.dart';
import 'daos/sales_inventory/purchases/purchase_receipt_items_dao.dart';
import 'daos/sales_inventory/purchases/purchase_receipt_items_table.dart' hide PurchaseReceiptItemsDao;
import 'daos/sales_inventory/purchases/purchase_receipts_dao.dart';
import 'daos/sales_inventory/purchases/purchase_transactions_dao.dart';
import 'daos/sales_inventory/purchases/supplier_products_dao.dart';
import 'daos/sales_inventory/purchases/supplier_products_table.dart';
import 'database_connection.dart';

// =========================================
// Product DAO
// =========================================

import 'daos/master_data/products/products_dao.dart';

// =========================================
// Other DAOs
// =========================================

import 'daos/home_dao.dart';
import 'daos/reports_dao.dart';
import 'daos/sales_dao.dart';
import 'daos/stock_dao.dart';
import 'daos/database_maintenance_dao.dart';

// =========================================
// Master Data Tables
// =========================================

import 'tables/master_data/parties/brands_table.dart';
import 'tables/master_data/parties/categories_table.dart';

import 'tables/master_data/parties/customers_table.dart';
import 'tables/master_data/parties/suppliers_table.dart';
import 'tables/master_data/products/products_table.dart';
import 'tables/master_data/products/product_units_table.dart';
import 'tables/master_data/products/product_barcodes_table.dart';
import 'tables/master_data/products/product_images_table.dart';

// =========================================
// Sales & Inventory Tables
// =========================================

import 'tables/reference_test_table.dart';
import 'tables/sales_inventory/purchases/purchase_items_table.dart';
import 'tables/sales_inventory/purchases/purchase_payments_table.dart';
import 'tables/sales_inventory/purchases/purchase_receipt_items_table.dart';
import 'tables/sales_inventory/purchases/purchase_receipts_table.dart';
import 'tables/sales_table.dart';
import 'tables/sale_items_table.dart';
import 'tables/stock_movements_table.dart';
import 'tables/returns_table.dart';
import 'tables/return_items_table.dart';

part 'app_database.g.dart';


@DriftDatabase(
  tables: [
    Categories,
    Brands,
    Products,
    ProductUnits,
    ProductBarcodes,
    ProductImages,
    Customers,
    Suppliers,

    PurchaseOrders,
    PurchaseItems,
    PurchaseReceipts,
    PurchaseReceiptItems,
    PurchasePayments,
    SupplierProducts,


    
    Sales,
    SaleItems,
    StockMovements,
    Returns,
    ReturnItems,
    ReferenceTestParents,
ReferenceTestChildren,
  ],
  daos: [
    ProductsDao,
    CustomersDao,
    SuppliersDao,

    PurchaseOrdersDao,
    PurchaseItemsDao,
    PurchaseReceiptsDao,
    PurchaseReceiptItemsDao,
    PurchasePaymentsDao,
    SupplierProductsDao,
    PurchaseTransactionsDao,




    SalesDao,
    StockDao,
    ReportsDao,
    HomeDao,
    DatabaseMaintenanceDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(openConnection());

  @override
  int get schemaVersion => 3;

  Future<void> _createProductIndexes() async {
    // One base unit per product.
    await customStatement('''
      CREATE UNIQUE INDEX IF NOT EXISTS idx_product_units_one_base
      ON product_units (product_id)
      WHERE is_base_unit = 1
    ''');

    // One default unit per product.
    await customStatement('''
      CREATE UNIQUE INDEX IF NOT EXISTS idx_product_units_one_default
      ON product_units (product_id)
      WHERE is_default = 1
    ''');

    // One default barcode per product.
    await customStatement('''
      CREATE UNIQUE INDEX IF NOT EXISTS idx_product_barcodes_one_default
      ON product_barcodes (product_id)
      WHERE is_default = 1
    ''');

    // One primary image per product.
    await customStatement('''
      CREATE UNIQUE INDEX IF NOT EXISTS idx_product_images_one_primary
      ON product_images (product_id)
      WHERE is_primary = 1
    ''');
  }

  Future<void> _checkNoDuplicateProductFlags() async {
    final checks = <String, String>{
      'product_units (base unit)': '''
        SELECT product_id
        FROM product_units
        WHERE is_base_unit = 1
        GROUP BY product_id
        HAVING COUNT(*) > 1
      ''',
      'product_units (default unit)': '''
        SELECT product_id
        FROM product_units
        WHERE is_default = 1
        GROUP BY product_id
        HAVING COUNT(*) > 1
      ''',
      'product_barcodes (default barcode)': '''
        SELECT product_id
        FROM product_barcodes
        WHERE is_default = 1
        GROUP BY product_id
        HAVING COUNT(*) > 1
      ''',
      'product_images (primary image)': '''
        SELECT product_id
        FROM product_images
        WHERE is_primary = 1
        GROUP BY product_id
        HAVING COUNT(*) > 1
      ''',
    };

    for (final entry in checks.entries) {
      final rows = await customSelect(entry.value).get();

      if (rows.isNotEmpty) {
        final productIds = rows
            .map((row) => row.read<int>('product_id'))
            .join(', ');

        throw StateError(
          'Cannot create unique index for ${entry.key}. '
          'Duplicate product IDs: $productIds. '
          'Resolve these records before upgrading.',
        );
      }
    }
  }

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (migrator) async {
          await migrator.createAll();
          await _createProductIndexes();
        },
        onUpgrade: (migrator, from, to) async {
          if (from < 3) {
            await _checkNoDuplicateProductFlags();
            await _createProductIndexes();
          }
        },
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );
}
