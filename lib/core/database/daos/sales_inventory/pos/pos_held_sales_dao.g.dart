// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_held_sales_dao.dart';

// ignore_for_file: type=lint
mixin _$PosHeldSalesDaoMixin on DatabaseAccessor<AppDatabase> {
  $PosHeldSalesTable get posHeldSales => attachedDatabase.posHeldSales;
  $PosHeldSaleItemsTable get posHeldSaleItems =>
      attachedDatabase.posHeldSaleItems;
  PosHeldSalesDaoManager get managers => PosHeldSalesDaoManager(this);
}

class PosHeldSalesDaoManager {
  final _$PosHeldSalesDaoMixin _db;
  PosHeldSalesDaoManager(this._db);
  $$PosHeldSalesTableTableManager get posHeldSales =>
      $$PosHeldSalesTableTableManager(_db.attachedDatabase, _db.posHeldSales);
  $$PosHeldSaleItemsTableTableManager get posHeldSaleItems =>
      $$PosHeldSaleItemsTableTableManager(
          _db.attachedDatabase, _db.posHeldSaleItems);
}
