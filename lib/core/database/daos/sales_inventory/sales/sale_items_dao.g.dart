// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_items_dao.dart';

// ignore_for_file: type=lint
mixin _$SaleItemsDaoMixin on DatabaseAccessor<AppDatabase> {
  $SalesTable get sales => attachedDatabase.sales;
  $SaleItemsTable get saleItems => attachedDatabase.saleItems;
  SaleItemsDaoManager get managers => SaleItemsDaoManager(this);
}

class SaleItemsDaoManager {
  final _$SaleItemsDaoMixin _db;
  SaleItemsDaoManager(this._db);
  $$SalesTableTableManager get sales =>
      $$SalesTableTableManager(_db.attachedDatabase, _db.sales);
  $$SaleItemsTableTableManager get saleItems =>
      $$SaleItemsTableTableManager(_db.attachedDatabase, _db.saleItems);
}
