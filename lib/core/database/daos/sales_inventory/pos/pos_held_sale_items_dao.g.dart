// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_held_sale_items_dao.dart';

// ignore_for_file: type=lint
mixin _$PosHeldSaleItemsDaoMixin on DatabaseAccessor<AppDatabase> {
  $PosHeldSaleItemsTable get posHeldSaleItems =>
      attachedDatabase.posHeldSaleItems;
  $PosHeldSalesTable get posHeldSales => attachedDatabase.posHeldSales;
  $ProductsTable get products => attachedDatabase.products;
  $ProductUnitsTable get productUnits => attachedDatabase.productUnits;
  PosHeldSaleItemsDaoManager get managers => PosHeldSaleItemsDaoManager(this);
}

class PosHeldSaleItemsDaoManager {
  final _$PosHeldSaleItemsDaoMixin _db;
  PosHeldSaleItemsDaoManager(this._db);
  $$PosHeldSaleItemsTableTableManager get posHeldSaleItems =>
      $$PosHeldSaleItemsTableTableManager(
          _db.attachedDatabase, _db.posHeldSaleItems);
  $$PosHeldSalesTableTableManager get posHeldSales =>
      $$PosHeldSalesTableTableManager(_db.attachedDatabase, _db.posHeldSales);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db.attachedDatabase, _db.products);
  $$ProductUnitsTableTableManager get productUnits =>
      $$ProductUnitsTableTableManager(_db.attachedDatabase, _db.productUnits);
}
