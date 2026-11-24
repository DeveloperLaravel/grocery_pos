// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_adjustments_dao.dart';

// ignore_for_file: type=lint
mixin _$StockAdjustmentsDaoMixin on DatabaseAccessor<AppDatabase> {
  $StockAdjustmentsTable get stockAdjustments =>
      attachedDatabase.stockAdjustments;
  $StockAdjustmentItemsTable get stockAdjustmentItems =>
      attachedDatabase.stockAdjustmentItems;
  StockAdjustmentsDaoManager get managers => StockAdjustmentsDaoManager(this);
}

class StockAdjustmentsDaoManager {
  final _$StockAdjustmentsDaoMixin _db;
  StockAdjustmentsDaoManager(this._db);
  $$StockAdjustmentsTableTableManager get stockAdjustments =>
      $$StockAdjustmentsTableTableManager(
          _db.attachedDatabase, _db.stockAdjustments);
  $$StockAdjustmentItemsTableTableManager get stockAdjustmentItems =>
      $$StockAdjustmentItemsTableTableManager(
          _db.attachedDatabase, _db.stockAdjustmentItems);
}
