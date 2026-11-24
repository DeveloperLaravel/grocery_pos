// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_transfers_dao.dart';

// ignore_for_file: type=lint
mixin _$StockTransfersDaoMixin on DatabaseAccessor<AppDatabase> {
  $StockTransfersTable get stockTransfers => attachedDatabase.stockTransfers;
  $StockTransferItemsTable get stockTransferItems =>
      attachedDatabase.stockTransferItems;
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
}
