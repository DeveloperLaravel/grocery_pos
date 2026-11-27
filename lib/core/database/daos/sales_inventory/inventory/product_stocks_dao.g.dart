// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_stocks_dao.dart';

// ignore_for_file: type=lint
mixin _$ProductStocksDaoMixin on DatabaseAccessor<AppDatabase> {
  $ProductStocksTable get productStocks => attachedDatabase.productStocks;
  ProductStocksDaoManager get managers => ProductStocksDaoManager(this);
}

class ProductStocksDaoManager {
  final _$ProductStocksDaoMixin _db;
  ProductStocksDaoManager(this._db);
  $$ProductStocksTableTableManager get productStocks =>
      $$ProductStocksTableTableManager(_db.attachedDatabase, _db.productStocks);
}
