// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_movements_dao.dart';

// ignore_for_file: type=lint
mixin _$StockMovementsDaoMixin on DatabaseAccessor<AppDatabase> {
  $StockMovementsTable get stockMovements => attachedDatabase.stockMovements;
  $ProductStocksTable get productStocks => attachedDatabase.productStocks;
  $ProductUnitsTable get productUnits => attachedDatabase.productUnits;
  $ProductsTable get products => attachedDatabase.products;
  $StoresTable get stores => attachedDatabase.stores;
  StockMovementsDaoManager get managers => StockMovementsDaoManager(this);
}

class StockMovementsDaoManager {
  final _$StockMovementsDaoMixin _db;
  StockMovementsDaoManager(this._db);
  $$StockMovementsTableTableManager get stockMovements =>
      $$StockMovementsTableTableManager(
          _db.attachedDatabase, _db.stockMovements);
  $$ProductStocksTableTableManager get productStocks =>
      $$ProductStocksTableTableManager(_db.attachedDatabase, _db.productStocks);
  $$ProductUnitsTableTableManager get productUnits =>
      $$ProductUnitsTableTableManager(_db.attachedDatabase, _db.productUnits);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db.attachedDatabase, _db.products);
  $$StoresTableTableManager get stores =>
      $$StoresTableTableManager(_db.attachedDatabase, _db.stores);
}
