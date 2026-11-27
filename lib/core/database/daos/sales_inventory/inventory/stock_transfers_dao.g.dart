// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_transfers_dao.dart';

// ignore_for_file: type=lint
mixin _$StockTransfersDaoMixin on DatabaseAccessor<AppDatabase> {
  $StockTransfersTable get stockTransfers => attachedDatabase.stockTransfers;
  $StockTransferItemsTable get stockTransferItems =>
      attachedDatabase.stockTransferItems;
  $StoresTable get stores => attachedDatabase.stores;
  $ProductStocksTable get productStocks => attachedDatabase.productStocks;
  $ProductsTable get products => attachedDatabase.products;
  $ProductUnitsTable get productUnits => attachedDatabase.productUnits;
  StockTransfersDaoManager get managers => StockTransfersDaoManager(this);
}

class StockTransfersDaoManager {
  final _$StockTransfersDaoMixin _db;
  StockTransfersDaoManager(this._db);
  $$StockTransfersTableTableManager get stockTransfers =>
      $$StockTransfersTableTableManager(
          _db.attachedDatabase, _db.stockTransfers);
  $$StockTransferItemsTableTableManager get stockTransferItems =>
      $$StockTransferItemsTableTableManager(
          _db.attachedDatabase, _db.stockTransferItems);
  $$StoresTableTableManager get stores =>
      $$StoresTableTableManager(_db.attachedDatabase, _db.stores);
  $$ProductStocksTableTableManager get productStocks =>
      $$ProductStocksTableTableManager(_db.attachedDatabase, _db.productStocks);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db.attachedDatabase, _db.products);
  $$ProductUnitsTableTableManager get productUnits =>
      $$ProductUnitsTableTableManager(_db.attachedDatabase, _db.productUnits);
}
