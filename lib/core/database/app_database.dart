import 'package:drift/drift.dart';

// =========================================
// Database Connection
// =========================================

import 'daos/database_maintenance_dao.dart';
import 'daos/master_data/parties/customers_dao.dart';
import 'daos/master_data/parties/suppliers_dao.dart';
import 'daos/sales_inventory/customer_payments/customer_payment_allocations_dao.dart';
import 'daos/sales_inventory/customer_payments/customer_payments_dao.dart';
import 'daos/sales_inventory/finance/expense_categories_dao.dart';
import 'daos/sales_inventory/finance/expenses_dao.dart';
import 'daos/sales_inventory/finance/payment_methods_dao.dart';
import 'daos/sales_inventory/inventory/product_stocks_dao.dart';
import 'daos/sales_inventory/inventory/stock_movements_dao.dart';
import 'daos/sales_inventory/inventory/stock_transfers_dao.dart';
import 'daos/sales_inventory/inventory/stores_dao.dart';
import 'daos/sales_inventory/pos/cash_movements_dao.dart';
import 'daos/sales_inventory/pos/pos_held_sales_dao.dart';
import 'daos/sales_inventory/pos/pos_settings_dao.dart';
import 'daos/sales_inventory/pos/pos_terminals_dao.dart';
import 'daos/sales_inventory/pos/cashier_shifts_dao.dart';
import 'daos/sales_inventory/pos/cash_registers_dao.dart';
import 'daos/sales_inventory/pos/pos_held_sale_items_dao.dart';
import 'daos/sales_inventory/pricing/coupon_usages_dao.dart';
import 'daos/sales_inventory/pricing/coupons_dao.dart';
import 'daos/sales_inventory/pricing/discount_rules_dao.dart';
import 'daos/sales_inventory/pricing/price_list_items_dao.dart';
import 'daos/sales_inventory/pricing/price_lists_dao.dart';
import 'daos/sales_inventory/pricing/product_taxes_dao.dart';
import 'daos/sales_inventory/pricing/sale_taxes_dao.dart';
import 'daos/sales_inventory/pricing/taxes_dao.dart';
import 'daos/sales_inventory/purchases/purchase_items_dao.dart';
import 'daos/sales_inventory/purchases/purchase_orders_dao.dart';
import 'daos/sales_inventory/purchases/purchase_payments_dao.dart';
import 'daos/sales_inventory/purchases/purchase_receipt_items_dao.dart';
import 'daos/sales_inventory/purchases/purchase_receipts_dao.dart';
import 'daos/sales_inventory/purchases/purchase_transactions_dao.dart';
import 'daos/sales_inventory/purchases/supplier_products_dao.dart';
import 'daos/sales_inventory/returns/accounting/accounts_dao.dart';
import 'daos/sales_inventory/returns/accounting/journal_entries_dao.dart';
import 'daos/sales_inventory/returns/accounting/journal_entry_lines_dao.dart';
import 'daos/sales_inventory/returns/return_items_dao.dart';
import 'daos/sales_inventory/returns/returns_dao.dart';
import 'daos/sales_inventory/returns/system/audit_logs_dao.dart';
import 'daos/sales_inventory/returns/system/device_registrations_dao.dart';
import 'daos/sales_inventory/returns/system/number_sequences_dao.dart';
import 'daos/sales_inventory/returns/system/sync_logs_dao.dart';
import 'daos/sales_inventory/returns/system/sync_queue_dao.dart';
import 'daos/sales_inventory/returns/transactions/customer_transactions_dao.dart';
import 'daos/sales_inventory/returns/transactions/supplier_transactions_dao.dart';
import 'daos/sales_inventory/sales/sale_items_dao.dart';
import 'daos/sales_inventory/sales/sale_payments_dao.dart';
import 'daos/sales_inventory/sales/sales_dao.dart';
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

// =========================================
// Master Data Tables
// =========================================

import 'tables/sales_inventory/customer_payments/customer_payment_allocations_table.dart';
import 'tables/sales_inventory/customer_payments/customer_payments_table.dart';
import 'tables/sales_inventory/finance/expense_categories_table.dart';
import 'tables/sales_inventory/finance/expenses_table.dart';
import 'tables/sales_inventory/finance/payment_methods_table.dart';
import 'tables/sales_inventory/pos/cash_movements_table.dart';
import 'tables/sales_inventory/pos/cash_registers_table.dart';
import 'tables/sales_inventory/pos/cashier_shifts_table.dart';
import 'tables/sales_inventory/pos/pos_held_sale_items_table.dart';
import 'tables/sales_inventory/pos/pos_held_sales_table.dart';
import 'tables/sales_inventory/pos/pos_settings_table.dart';
import 'tables/sales_inventory/pos/pos_terminals_table.dart';
import 'tables/sales_inventory/pricing/coupon_usages_table.dart';
import 'tables/sales_inventory/pricing/coupons_table.dart';
import 'tables/sales_inventory/pricing/discount_rules_table.dart';
import 'tables/sales_inventory/pricing/price_list_items_table.dart';
import 'tables/sales_inventory/pricing/price_lists_table.dart';
import 'tables/sales_inventory/pricing/product_taxes_table.dart';
import 'tables/sales_inventory/pricing/sale_taxes_table.dart';
import 'tables/sales_inventory/pricing/taxes_table.dart';
import 'tables/sales_inventory/returns/accounting/accounts_table.dart';
import 'tables/sales_inventory/returns/accounting/journal_entries_table.dart';
import 'tables/sales_inventory/returns/accounting/journal_entry_lines_table.dart';
import 'tables/sales_inventory/returns/system/audit_logs_table.dart';
import 'tables/sales_inventory/returns/system/device_registrations_table.dart';
import 'tables/sales_inventory/returns/system/number_sequences_table.dart';
import 'tables/sales_inventory/returns/system/sync_logs_table.dart';
import 'tables/sales_inventory/returns/system/sync_queue_table.dart';
import 'tables/sales_inventory/returns/transactions/customer_transactions_table.dart';
import 'tables/sales_inventory/returns/transactions/supplier_transactions_table.dart';
import 'tables/sales_inventory/sales/sale_payments_table.dart';
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
import 'tables/sales_inventory/inventory/product_stocks_table.dart';
import 'tables/sales_inventory/inventory/stock_adjustment_items_table.dart';
import 'tables/sales_inventory/inventory/stock_adjustments_table.dart';
import 'tables/sales_inventory/inventory/stock_count_items_table.dart';
import 'tables/sales_inventory/inventory/stock_counts_table.dart';
import 'tables/sales_inventory/inventory/stock_transfer_items_table.dart';
import 'tables/sales_inventory/inventory/stock_transfers_table.dart';
import 'tables/sales_inventory/inventory/stores_table.dart';
import 'tables/sales_inventory/purchases/purchase_items_table.dart';
import 'tables/sales_inventory/purchases/purchase_orders_table.dart';
import 'tables/sales_inventory/purchases/purchase_payments_table.dart';
import 'tables/sales_inventory/purchases/purchase_receipt_items_table.dart';
import 'tables/sales_inventory/purchases/purchase_receipts_table.dart';
import 'tables/sales_inventory/purchases/supplier_products_table.dart';
import 'tables/sales_inventory/sales/sales_table.dart';
import 'tables/sales_inventory/sales/sale_items_table.dart';
import 'tables/sales_inventory/returns/returns_table.dart';
import 'tables/sales_inventory/returns/return_items_table.dart';
import 'tables/sales_inventory/inventory/stock_movements_table.dart';

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
    Stores,
    ProductStocks,
    StockMovements,

    // Stock Transfers
    StockTransfers,
    StockTransferItems,

    // Stock Counts
    StockCounts,
    StockCountItems,

    // Stock Adjustments
    StockAdjustments,
    StockAdjustmentItems,

    Sales,
    SaleItems,
    SalePayments,

    PosTerminals,
    CashRegisters,
    CashierShifts,
    CashMovements,
    PosSettings,
    PosHeldSales,
    PosHeldSaleItems,

    PaymentMethods,
    ExpenseCategories,
    Expenses,

    Taxes,
    ProductTaxes,
    SaleTaxes,
    DiscountRules,
    Coupons,
    CouponUsages,
    PriceLists,
    PriceListItems,

    CustomerPayments,
    CustomerPaymentAllocations,
    Returns,
    ReturnItems,

    Accounts,
    JournalEntries,
    JournalEntryLines,

    CustomerTransactions,
    SupplierTransactions,

    NumberSequences,
    DeviceRegistrations,
    AuditLogs,
    SyncQueue,
    SyncLogs,

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
    StoresDao,
    ProductStocksDao,
    StockMovementsDao,
    StockTransfersDao,
    SalesDao,
    SaleItemsDao,
    SalePaymentsDao,
    PosTerminalsDao,
    CashRegistersDao,
    CashierShiftsDao,
    CashMovementsDao,
    PosSettingsDao,
    PosHeldSalesDao,
    PosHeldSaleItemsDao,
    PaymentMethodsDao,
    ExpenseCategoriesDao,
    ExpensesDao,
    TaxesDao,
    ProductTaxesDao,
    SaleTaxesDao,
    DiscountRulesDao,
    CouponsDao,
    CouponUsagesDao,
    PriceListsDao,
    PriceListItemsDao,
    CustomerPaymentsDao,
    CustomerPaymentAllocationsDao,
    ReturnsDao,
    ReturnItemsDao,
    AccountsDao,
    JournalEntriesDao,
    JournalEntryLinesDao,
    CustomerTransactionsDao,
    SupplierTransactionsDao,
    NumberSequencesDao,
    DeviceRegistrationsDao,
    AuditLogsDao,
    SyncQueueDao,
    SyncLogsDao,
    ReportsDao,
    HomeDao,
    DatabaseMaintenanceDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(openConnection());

  @override
  int get schemaVersion => 5;

  Future<void> _migrateLegacyReturns(Migrator migrator) async {
    await customStatement(
      'ALTER TABLE return_items RENAME TO legacy_return_items',
    );
    await customStatement(
      'ALTER TABLE returns RENAME TO legacy_returns',
    );

    await migrator.createTable(returns);
    await migrator.createTable(returnItems);

    final unmappableReturns = await customSelect('''
      SELECT COUNT(*) AS count
      FROM legacy_returns AS old_return
      LEFT JOIN sales AS sale ON sale.id = old_return.sale_id
      WHERE sale.id IS NULL
    ''').getSingle();
    final unmappableReturnCount = unmappableReturns.read<int>('count');
    if (unmappableReturnCount > 0) {
      throw StateError(
        'Cannot migrate $unmappableReturnCount legacy return(s): '
        'the related sale is missing.',
      );
    }

    final unmappableItems = await customSelect('''
      SELECT COUNT(*) AS count
      FROM (
        SELECT old_item.id
        FROM legacy_return_items AS old_item
        INNER JOIN legacy_returns AS old_return
          ON old_return.id = old_item.return_id
        LEFT JOIN sale_items AS sale_item
          ON sale_item.sale_id = old_return.sale_id
          AND sale_item.product_id = old_item.product_id
        LEFT JOIN products AS product
          ON product.id = old_item.product_id
        GROUP BY old_item.id
        HAVING COUNT(sale_item.id) != 1
          OR MAX(product.id) IS NULL
          OR MIN(sale_item.quantity) <= 0
          OR MIN(sale_item.base_quantity) <= 0
          OR MIN(sale_item.conversion_factor) <= 0
      )
    ''').getSingle();

    final unmappableCount = unmappableItems.read<int>('count');
    if (unmappableCount > 0) {
      throw StateError(
        'Cannot migrate $unmappableCount legacy return item(s): '
        'a matching sale item is ambiguous or has invalid sale/product data.',
      );
    }

    await customStatement('''
      INSERT INTO returns (
        id, return_number, sale_id, customer_id, return_type, status,
        subtotal, discount_amount, tax_amount, total_amount,
        refunded_amount, remaining_refund_amount, refund_status,
        created_at, updated_at
      )
      SELECT
        old_return.id,
        'LEGACY-' || old_return.id,
        old_return.sale_id,
        sale.customer_id,
        'partial',
        'confirmed',
        old_return.total,
        0,
        0,
        old_return.total,
        old_return.total,
        0,
        'refunded',
        old_return.created_at,
        old_return.created_at
      FROM legacy_returns AS old_return
      INNER JOIN sales AS sale ON sale.id = old_return.sale_id
    ''');

    await customStatement('''
      INSERT INTO return_items (
        id, return_id, sale_item_id, product_id, product_unit_id,
        product_name, unit_name, quantity, conversion_factor,
        base_quantity, base_unit, unit_price, original_quantity,
        original_base_quantity, discount_percentage, discount_amount,
        tax_percentage, tax_amount, subtotal, total_amount,
        added_to_stock, created_at, updated_at
      )
      SELECT
        old_item.id,
        old_item.return_id,
        sale_item.id,
        old_item.product_id,
        sale_item.product_unit_id,
        product.name,
        sale_item.unit_name,
        old_item.quantity,
        sale_item.conversion_factor,
        old_item.quantity * sale_item.conversion_factor,
        product.base_unit,
        old_item.unit_price,
        sale_item.quantity,
        sale_item.base_quantity,
        0,
        0,
        0,
        0,
        old_item.total,
        old_item.total,
        1,
        old_return.created_at,
        old_return.created_at
      FROM legacy_return_items AS old_item
      INNER JOIN legacy_returns AS old_return
        ON old_return.id = old_item.return_id
      INNER JOIN sale_items AS sale_item
        ON sale_item.sale_id = old_return.sale_id
        AND sale_item.product_id = old_item.product_id
      INNER JOIN products AS product
        ON product.id = old_item.product_id
    ''');

    await customStatement('DROP TABLE legacy_return_items');
    await customStatement('DROP TABLE legacy_returns');
  }

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

  Future<void> _createAccountingAndSystemTables(
    Migrator migrator,
  ) async {
    await migrator.createTable(accounts);
    await migrator.createTable(journalEntries);
    await migrator.createTable(journalEntryLines);
    await migrator.createTable(customerTransactions);
    await migrator.createTable(supplierTransactions);
    await migrator.createTable(numberSequences);
    await migrator.createTable(deviceRegistrations);
    await migrator.createTable(auditLogs);
    await migrator.createTable(syncQueue);
    await migrator.createTable(syncLogs);
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
        final productIds =
            rows.map((row) => row.read<int>('product_id')).join(', ');

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

          if (from < 4) {
            final currentTable = await customSelect(
              '''SELECT name FROM sqlite_master
              WHERE type = 'table' AND name = 'stock_movements' ''',
            ).get();
            final legacyTable = await customSelect(
              '''SELECT name FROM sqlite_master
              WHERE type = 'table' AND name = 'legacy_stock_movements' ''',
            ).get();

            if (currentTable.isNotEmpty) {
              if (legacyTable.isNotEmpty) {
                throw StateError(
                  'Cannot archive stock_movements because '
                  'legacy_stock_movements already exists.',
                );
              }

              await customStatement(
                'ALTER TABLE stock_movements '
                'RENAME TO legacy_stock_movements',
              );
            }

            await migrator.createTable(stores);
            await migrator.createTable(productStocks);
            await migrator.createTable(stockMovements);
            await migrator.createTable(stockTransfers);
            await migrator.createTable(stockTransferItems);
            await migrator.createTable(stockCounts);
            await migrator.createTable(stockCountItems);
            await migrator.createTable(stockAdjustments);
            await migrator.createTable(stockAdjustmentItems);
          }

          if (from < 5) {
            await _migrateLegacyReturns(migrator);
            await _createAccountingAndSystemTables(migrator);
          }
        },
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );
}
