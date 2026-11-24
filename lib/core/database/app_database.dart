import 'package:drift/drift.dart';
import 'package:grocery_pos/core/database/tables/inventory/product_stocks_table.dart';

import 'daos/master_data/parties/brands_dao.dart';
import 'daos/master_data/parties/customers_dao.dart';
import 'daos/master_data/parties/suppliers_dao.dart';
import 'daos/sales_inventory/inventory/returns_dao.dart';
import 'daos/sales_inventory/inventory/stock_adjustments_dao.dart';
import 'daos/sales_inventory/inventory/stock_counts_dao.dart';
import 'daos/sales_inventory/inventory/stock_movements_dao.dart';
import 'daos/sales_inventory/inventory/stock_transfers_dao.dart';
import 'daos/sales_inventory/pos/cash_movements_dao.dart';
import 'daos/sales_inventory/pos/cash_registers_dao.dart';
import 'daos/sales_inventory/pos/cashier_shifts_dao.dart';
import 'daos/sales_inventory/pos/pos_held_sales_dao.dart';
import 'daos/sales_inventory/pos/pos_settings_dao.dart';
import 'daos/sales_inventory/pos/pos_terminals_dao.dart';
import 'daos/master_data/products/product_barcodes_dao.dart';
import 'daos/master_data/products/product_images_dao.dart';
import 'daos/master_data/products/product_units_dao.dart';
import 'daos/master_data/products/products_dao.dart';
import 'daos/sales_inventory/purchases/purchase_receipts_dao.dart';
import 'daos/sales_inventory/sales/checkout_dao.dart';
import 'database_connection.dart';

// =====================================================
// Tables
// =====================================================

import 'tables/audit/audit_logs_table.dart';
import 'tables/finance/accounting/accounts_table.dart';
import 'tables/sales_inventory/inventory/stock_operations/transfers/stock_transfers_table.dart';
import 'tables/sales_inventory/pos/cash_movements_table.dart';
import 'tables/sales_inventory/pos/cash_registers_table.dart';
import 'tables/finance/accounting/journal_entries_table.dart';
import 'tables/master_data/parties/customers_table.dart';
import 'tables/sales_inventory/pos/cashier_shifts_table.dart';
import 'tables/sales_inventory/pos/pos_settings_table.dart';
import 'tables/price_lists_table.dart';
import 'tables/product_taxes_table.dart';
import 'tables/sale_taxes_table.dart';
import 'tables/master_data/parties/categories_table.dart';
import 'tables/master_data/parties/brands_table.dart';
import 'tables/coupon_usages_table.dart';
import 'tables/coupons_table.dart';
import 'tables/parties/customers/customer_payment_allocations_table.dart';
import 'tables/parties/customers/customer_payments_table.dart';
import 'tables/parties/customers/customer_transactions_table.dart';
import 'tables/device_registrations_table.dart';
import 'tables/discount_rules_table.dart';
import 'tables/expense_categories_table.dart';
import 'tables/expenses/expenses_table.dart';
import 'tables/finance/accounting/journal_entry_lines_table.dart';
import 'tables/number_sequences_table.dart';
import 'tables/cash/payment_methods_table.dart';
import 'tables/sales_inventory/pos/pos_held_sale_items_table.dart';
import 'tables/sales_inventory/pos/pos_held_sales_table.dart';
import 'tables/sales_inventory/pos/pos_terminals_table.dart';
import 'tables/price_list_items_table.dart';
import 'tables/sales_inventory/inventory/stock_operations/adjustments/stock_adjustment_items_table.dart';
import '../stock_adjustments_table.dart';
import 'tables/sales_inventory/inventory/stock_operations/contacts/stock_count_items_table.dart';
import 'tables/sales_inventory/inventory/stock_operations/contacts/stock_counts_table.dart';
import 'tables/sales_inventory/inventory/stock_operations/transfers/stock_transfer_items_table.dart';
import 'tables/inventory/stores_table.dart';
import 'tables/master_data/products/product_units_table.dart';
import 'tables/supplier_transactions_table.dart';
import 'tables/master_data/parties/suppliers_table.dart';

import 'tables/master_data/products/products_table.dart';
import 'tables/master_data/products/product_barcodes_table.dart';
import 'tables/master_data/products/product_images_table.dart';

import 'tables/sales_inventory/purchases/supplier_products_table.dart';

import 'tables/sales_inventory/purchases/purchase_orders_table.dart';
import 'tables/sales_inventory/purchases/purchase_items_table.dart';
import 'tables/sales_inventory/purchases/purchase_receipts_table.dart';
import 'tables/sales_inventory/purchases/purchase_receipt_items_table.dart';
import 'tables/sales_inventory/purchases/purchase_payments_table.dart';

import 'tables/sales_inventory/sales/sales_table.dart';
import 'tables/sales_inventory/sales/sale_items_table.dart';
import 'tables/sales_inventory/sales/sale_payments_table.dart';

import 'tables/sales_inventory/inventory/stock_movements_table.dart';

import 'tables/sales_inventory/inventory/returns/returns_table.dart';
import 'tables/sales_inventory/inventory/returns/return_items_table.dart';

// =====================================================
// DAOs
// =====================================================


import 'daos/sales_inventory/purchases/purchase_orders_dao.dart';
import 'daos/sales_inventory/purchases/purchase_payments_dao.dart';
import 'daos/purchase_queries_dao.dart';

import 'daos/stock_dao.dart';
import 'daos/reports_dao.dart';
import 'daos/sales_inventory/sales/sales_dao.dart';
import 'daos/home_dao.dart';
import 'daos/database_maintenance_dao.dart';

import 'daos/master_data/parties/categories_dao.dart';
import 'tables/sync_logs_table.dart';
import 'tables/audit/sync_queue_table.dart';
import 'tables/sales_inventory/taxes/taxes_table.dart';

// =====================================================
// Generated
// =====================================================

part 'app_database.g.dart';

// =====================================================
// App Database
// =====================================================

@DriftDatabase(
 
tables: [



  // Existing Master Data
  Categories,
  Brands,
  Customers,
  Suppliers,
  Suppliers,

  // Existing Products
  Products,
  ProductUnits,
  ProductBarcodes,
  ProductImages,
    // Existing tables
    // Products,
    // ProductUnits,
    // ProductStocks,
    // Stores,



  // Existing Purchases
  // PurchaseOrders,
  PurchaseItems,
  PurchaseReceipts,
  PurchaseReceiptItems,
  PurchasePayments,
  SupplierProducts,

  // Existing Sales
  Sales,
  SaleItems,
  SalePayments,

  // Existing Inventory
  StockMovements,
  Returns,
  ReturnItems,

  // New Stores
  Stores,
  ProductStocks,

  // New POS
  PosTerminals,
  CashRegisters,
  CashierShifts,
  CashMovements,
  PosSettings,
  PosHeldSales,
  PosHeldSaleItems,

  // Stock Operations
  StockTransfers,
  StockTransferItems,
  StockAdjustments,
  StockAdjustmentItems,
  StockCounts,
  StockCountItems,

  // Returns
  // ReturnPayments,
    // جداول حسابات العملاء الجديدة
    // CustomerTransactions,
    CustomerPayments,
    CustomerPaymentAllocations,
  // Taxes & Pricing
  Taxes,
  ProductTaxes,
  SaleTaxes,
  DiscountRules,
  Coupons,
  CouponUsages,
  PriceLists,
  PriceListItems,

  // Payments & Expenses
  PaymentMethods,
  ExpenseCategories,
  Expenses,

  // Accounting
  Accounts,
  JournalEntries,
  JournalEntryLines,
  CustomerTransactions,
  SupplierTransactions,

  // System
  AuditLogs,
  SyncQueue,
  SyncLogs,
  NumberSequences,
  DeviceRegistrations,
],

  daos: [
    // Products
    ProductsDao,
    ProductUnitsDao,
    ProductBarcodesDao,
    ProductImagesDao,

    // Purchases
    PurchaseOrdersDao,
    PurchaseReceiptsDao,
    PurchasePaymentsDao,
    // PurchaseQueriesDao,

  StockMovementsDao,
  ReturnsDao,
  StockTransfersDao,
  StockAdjustmentsDao,
  StockCountsDao,
    // Inventory

    // Reports
    ReportsDao,
    HomeDao,

    // Sales
    SalesDao,
    CheckoutDao,

 

    // Master Data
    BrandsDao,
    CategoriesDao,
    // Customers
    CustomersDao,
    SuppliersDao,
    // Maintenance



    PosTerminalsDao,
    CashRegistersDao,
    CashierShiftsDao,
    CashMovementsDao,
    PosSettingsDao,
    PosHeldSalesDao,
    DatabaseMaintenanceDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(openConnection());

  // =====================================================
  // Schema Version
  // =====================================================

  @override
  int get schemaVersion => 7;

  // =====================================================
  // Migration Strategy
  // =====================================================

  @override
  MigrationStrategy get migration => MigrationStrategy(
        // -------------------------------------------------
        // First Installation
        // -------------------------------------------------

        onCreate: (migrator) async {
          await migrator.createAll();
        },

        // -------------------------------------------------
        // Existing Database Upgrade
        // -------------------------------------------------

        onUpgrade: (migrator, from, to) async {
          // لا نحذف أي جدول أو سجل موجود.
          // ننشئ الجداول الناقصة فقط.

          // =================================================
          // 1. Master Data
          // =================================================

          await _createTableIfMissing(
            'categories',
            () => migrator.createTable(categories),
          );

          await _createTableIfMissing(
            'brands',
            () => migrator.createTable(brands),
          );

          await _createTableIfMissing(
            'customers',
            () => migrator.createTable(customers),
          );

          await _createTableIfMissing(
            'suppliers',
            () => migrator.createTable(suppliers),
          );

          // =================================================
          // 2. Products
          // =================================================

          await _createTableIfMissing(
            'products',
            () => migrator.createTable(products),
          );

          await _createTableIfMissing(
            'product_units',
            () => migrator.createTable(productUnits),
          );

          await _createTableIfMissing(
            'product_barcodes',
            () => migrator.createTable(productBarcodes),
          );

          await _createTableIfMissing(
            'product_images',
            () => migrator.createTable(productImages),
          );

          // =================================================
          // 3. Supplier Products
          // =================================================

          await _createTableIfMissing(
            'supplier_products',
            () => migrator.createTable(supplierProducts),
          );

          // =================================================
          // 4. Purchase Orders
          // =================================================

          // await _createTableIfMissing(
          //   'purchase_orders',
          //   () => migrator.createTable(purchaseOrders),
          // );

          await _createTableIfMissing(
            'purchase_items',
            () => migrator.createTable(purchaseItems),
          );

          // =================================================
          // 5. Purchase Receipts
          // =================================================

          await _createTableIfMissing(
            'purchase_receipts',
            () => migrator.createTable(purchaseReceipts),
          );

          await _createTableIfMissing(
            'purchase_receipt_items',
            () => migrator.createTable(purchaseReceiptItems),
          );

          // =================================================
          // 6. Purchase Payments - Version 7
          // =================================================

          await _createTableIfMissing(
            'purchase_payments',
            () => migrator.createTable(purchasePayments),
          );

          // =================================================
          // 7. Sales
          // =================================================

          await _createTableIfMissing(
            'sales',
            () => migrator.createTable(sales),
          );

          await _createTableIfMissing(
            'sale_items',
            () => migrator.createTable(saleItems),
          );

          await _createTableIfMissing(
            'sale_payments',
            () => migrator.createTable(salePayments),
          );

          // =================================================
          // 8. Stock Movements
          // =================================================

          await _createTableIfMissing(
            'stock_movements',
            () => migrator.createTable(stockMovements),
          );

          // =================================================
          // 9. Returns
          // =================================================

          await _createTableIfMissing(
            'returns',
            () => migrator.createTable(returns),
          );

          await _createTableIfMissing(
            'return_items',
            () => migrator.createTable(returnItems),
          );

          // =================================================
          // Version 4: Product Barcode
          // =================================================

          if (from < 4 && to >= 4) {
            await _migrateProductBarcode();
          }

          // =================================================
          // Version 5: Expanded Customers
          // =================================================

          if (from < 5 && to >= 5) {
            await _migrateCustomersToVersion5(migrator);
          }

          // =================================================
          // Version 6: Expanded Suppliers
          // =================================================

          if (from < 6 && to >= 6) {
            await _migrateSuppliersToVersion6(migrator);
          }

          // =================================================
          // Sales: Customer ID
          // =================================================

          if (await _tableExists('sales') &&
              !await _columnExists('sales', 'customer_id')) {
            await migrator.addColumn(
              sales,
              sales.customerId,
            );
          }
        },

        // -------------------------------------------------
        // Before Open
        // -------------------------------------------------

        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );

  // =====================================================
  // Version 4: Product Barcode Migration
  // =====================================================

  Future<void> _migrateProductBarcode() async {
    if (!await _tableExists('products')) {
      return;
    }

    if (!await _columnExists('products', 'barcode')) {
      await customStatement('''
        ALTER TABLE products
        ADD COLUMN barcode TEXT NULL
      ''');
    }

    await customStatement('''
      CREATE UNIQUE INDEX IF NOT EXISTS
      products_barcode_unique
      ON products (barcode)
    ''');
  }

  // =====================================================
  // Version 5: Customers Migration
  // =====================================================

  Future<void> _migrateCustomersToVersion5(
    Migrator migrator,
  ) async {
    if (!await _tableExists('customers')) {
      return;
    }

    if (!await _columnExists('customers', 'customer_code')) {
      await customStatement('''
        ALTER TABLE customers
        ADD COLUMN customer_code TEXT NULL
      ''');
    }

    await customStatement('''
      CREATE UNIQUE INDEX IF NOT EXISTS
      customers_customer_code_unique
      ON customers (customer_code)
    ''');

    Future<void> addIfMissing(
      String columnName,
      GeneratedColumn column,
    ) async {
      if (!await _columnExists('customers', columnName)) {
        await migrator.addColumn(customers, column);
      }
    }

    // Customer Type
    await addIfMissing('customer_type', customers.customerType);

    // Company Information
    await addIfMissing('company_name', customers.companyName);
    await addIfMissing('contact_person', customers.contactPerson);
    await addIfMissing('image_path', customers.imagePath);

    // Contact Information
    await addIfMissing('secondary_phone', customers.secondaryPhone);
    await addIfMissing('whatsapp', customers.whatsapp);
    await addIfMissing('website', customers.website);

    // Legal Information
    await addIfMissing('national_id', customers.nationalId);
    await addIfMissing('tax_number', customers.taxNumber);
    await addIfMissing(
      'commercial_register',
      customers.commercialRegister,
    );

    // Address Information
    await addIfMissing('country', customers.country);
    await addIfMissing('city', customers.city);
    await addIfMissing('region', customers.region);
    await addIfMissing('street', customers.street);
    await addIfMissing(
      'building_number',
      customers.buildingNumber,
    );
    await addIfMissing('postal_code', customers.postalCode);
    await addIfMissing(
      'billing_address',
      customers.billingAddress,
    );
    await addIfMissing(
      'shipping_address',
      customers.shippingAddress,
    );

    // Classification
    await addIfMissing(
      'customer_category',
      customers.customerCategory,
    );
    await addIfMissing('price_level', customers.priceLevel);

    // Financial Information
    await addIfMissing('allow_credit', customers.allowCredit);
    await addIfMissing('credit_limit', customers.creditLimit);
    await addIfMissing(
      'opening_balance',
      customers.openingBalance,
    );
    await addIfMissing(
      'payment_terms_days',
      customers.paymentTermsDays,
    );
    await addIfMissing(
      'default_discount',
      customers.defaultDiscount,
    );
    await addIfMissing(
      'preferred_payment_method',
      customers.preferredPaymentMethod,
    );

    // Loyalty
    await addIfMissing('loyalty_points', customers.loyaltyPoints);

    // Activity
    await addIfMissing(
      'last_purchase_at',
      customers.lastPurchaseAt,
    );
  }

  // =====================================================
  // Version 6: Suppliers Migration
  // =====================================================

  Future<void> _migrateSuppliersToVersion6(
    Migrator migrator,
  ) async {
    if (!await _tableExists('suppliers')) {
      return;
    }

    Future<void> addIfMissing(
      String columnName,
      GeneratedColumn column,
    ) async {
      if (!await _columnExists('suppliers', columnName)) {
        await migrator.addColumn(suppliers, column);
      }
    }

    // Supplier Code
    if (!await _columnExists('suppliers', 'supplier_code')) {
      await customStatement('''
        ALTER TABLE suppliers
        ADD COLUMN supplier_code TEXT NULL
      ''');
    }

    await customStatement('''
      CREATE UNIQUE INDEX IF NOT EXISTS
      suppliers_supplier_code_unique
      ON suppliers (supplier_code)
    ''');

    // Basic Information
    await addIfMissing('supplier_type', suppliers.supplierType);
    await addIfMissing('company_name', suppliers.companyName);
    await addIfMissing('contact_person', suppliers.contactPerson);
    await addIfMissing('image_path', suppliers.imagePath);

    // Contact Information
    await addIfMissing(
      'secondary_phone',
      suppliers.secondaryPhone,
    );
    await addIfMissing('whatsapp', suppliers.whatsapp);
    await addIfMissing('website', suppliers.website);

    // Legal Information
    await addIfMissing('national_id', suppliers.nationalId);
    await addIfMissing('tax_number', suppliers.taxNumber);
    await addIfMissing(
      'commercial_register',
      suppliers.commercialRegister,
    );

    // Address Information
    await addIfMissing('country', suppliers.country);
    await addIfMissing('city', suppliers.city);
  }

  // =====================================================
  // Database Helpers
  // =====================================================

  Future<bool> _tableExists(String tableName) async {
    final result = await customSelect(
      '''
      SELECT name
      FROM sqlite_master
      WHERE type = 'table'
      AND name = ?
      ''',
      variables: [
        Variable.withString(tableName),
      ],
    ).getSingleOrNull();

    return result != null;
  }

  Future<bool> _columnExists(
    String tableName,
    String columnName,
  ) async {
    final result = await customSelect(
      'PRAGMA table_info("$tableName")',
    ).get();

    return result.any(
      (row) => row.read<String>('name') == columnName,
    );
  }

  Future<void> _createTableIfMissing(
    String tableName,
    Future<void> Function() create,
  ) async {
    if (!await _tableExists(tableName)) {
      await create();
    }
  }
}