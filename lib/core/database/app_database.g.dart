// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final ProductsDao productsDao = ProductsDao(this as AppDatabase);
  late final CustomersDao customersDao = CustomersDao(this as AppDatabase);
  late final SuppliersDao suppliersDao = SuppliersDao(this as AppDatabase);
  late final PurchaseOrdersDao purchaseOrdersDao =
      PurchaseOrdersDao(this as dynamic /* = invalid*/);
  late final PurchaseItemsDao purchaseItemsDao =
      PurchaseItemsDao(this as dynamic /* = invalid*/);
  late final PurchaseReceiptsDao purchaseReceiptsDao =
      PurchaseReceiptsDao(this as dynamic /* = invalid*/);
  late final PurchaseReceiptItemsDao purchaseReceiptItemsDao =
      PurchaseReceiptItemsDao(this as dynamic /* = invalid*/);
  late final SupplierProductsDao supplierProductsDao =
      SupplierProductsDao(this as dynamic /* = invalid*/);
  late final PurchaseTransactionsDao purchaseTransactionsDao =
      PurchaseTransactionsDao(this as dynamic /* = invalid*/);
  late final SalesDao salesDao = SalesDao(this as AppDatabase);
  late final StockDao stockDao = StockDao(this as AppDatabase);
  late final ReportsDao reportsDao = ReportsDao(this as AppDatabase);
  late final HomeDao homeDao = HomeDao(this as AppDatabase);
  late final DatabaseMaintenanceDao databaseMaintenanceDao =
      DatabaseMaintenanceDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [];
}

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
}
