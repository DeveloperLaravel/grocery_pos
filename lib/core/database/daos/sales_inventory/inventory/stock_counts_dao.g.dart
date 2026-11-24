// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_counts_dao.dart';

// ignore_for_file: type=lint
mixin _$StockCountsDaoMixin on DatabaseAccessor<AppDatabase> {
  $StockCountsTable get stockCounts => attachedDatabase.stockCounts;
  $StockCountItemsTable get stockCountItems => attachedDatabase.stockCountItems;
  StockCountsDaoManager get managers => StockCountsDaoManager(this);
}

class StockCountsDaoManager {
  final _$StockCountsDaoMixin _db;
  StockCountsDaoManager(this._db);
  $$StockCountsTableTableManager get stockCounts =>
      $$StockCountsTableTableManager(_db.attachedDatabase, _db.stockCounts);
  $$StockCountItemsTableTableManager get stockCountItems =>
      $$StockCountItemsTableTableManager(
          _db.attachedDatabase, _db.stockCountItems);
}
