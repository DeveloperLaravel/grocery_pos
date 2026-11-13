// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_maintenance_dao.dart';

// ignore_for_file: type=lint
mixin _$DatabaseMaintenanceDaoMixin on DatabaseAccessor<AppDatabase> {
  $ProductsTable get products => attachedDatabase.products;
  $SalesTable get sales => attachedDatabase.sales;
  $SaleItemsTable get saleItems => attachedDatabase.saleItems;
  $StockMovementsTable get stockMovements => attachedDatabase.stockMovements;
  $ReturnsTable get returns => attachedDatabase.returns;
  $ReturnItemsTable get returnItems => attachedDatabase.returnItems;
  DatabaseMaintenanceDaoManager get managers =>
      DatabaseMaintenanceDaoManager(this);
}

class DatabaseMaintenanceDaoManager {
  final _$DatabaseMaintenanceDaoMixin _db;
  DatabaseMaintenanceDaoManager(this._db);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db.attachedDatabase, _db.products);
  $$SalesTableTableManager get sales =>
      $$SalesTableTableManager(_db.attachedDatabase, _db.sales);
  $$SaleItemsTableTableManager get saleItems =>
      $$SaleItemsTableTableManager(_db.attachedDatabase, _db.saleItems);
  $$StockMovementsTableTableManager get stockMovements =>
      $$StockMovementsTableTableManager(
          _db.attachedDatabase, _db.stockMovements);
  $$ReturnsTableTableManager get returns =>
      $$ReturnsTableTableManager(_db.attachedDatabase, _db.returns);
  $$ReturnItemsTableTableManager get returnItems =>
      $$ReturnItemsTableTableManager(_db.attachedDatabase, _db.returnItems);
}
