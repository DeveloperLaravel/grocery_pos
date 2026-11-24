// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_movements_dao.dart';

// ignore_for_file: type=lint
mixin _$StockMovementsDaoMixin on DatabaseAccessor<AppDatabase> {
  $StockMovementsTable get stockMovements => attachedDatabase.stockMovements;
  StockMovementsDaoManager get managers => StockMovementsDaoManager(this);
}

class StockMovementsDaoManager {
  final _$StockMovementsDaoMixin _db;
  StockMovementsDaoManager(this._db);
  $$StockMovementsTableTableManager get stockMovements =>
      $$StockMovementsTableTableManager(
          _db.attachedDatabase, _db.stockMovements);
}
