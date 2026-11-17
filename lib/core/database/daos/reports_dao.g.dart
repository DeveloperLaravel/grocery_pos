// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reports_dao.dart';

// ignore_for_file: type=lint
mixin _$ReportsDaoMixin on DatabaseAccessor<AppDatabase> {
  $SalesTable get sales => attachedDatabase.sales;
  $SaleItemsTable get saleItems => attachedDatabase.saleItems;
  $ReturnsTable get returns => attachedDatabase.returns;
  $ProductsTable get products => attachedDatabase.products;
  ReportsDaoManager get managers => ReportsDaoManager(this);
}

class ReportsDaoManager {
  final _$ReportsDaoMixin _db;
  ReportsDaoManager(this._db);
  $$SalesTableTableManager get sales =>
      $$SalesTableTableManager(_db.attachedDatabase, _db.sales);
  $$SaleItemsTableTableManager get saleItems =>
      $$SaleItemsTableTableManager(_db.attachedDatabase, _db.saleItems);
  $$ReturnsTableTableManager get returns =>
      $$ReturnsTableTableManager(_db.attachedDatabase, _db.returns);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db.attachedDatabase, _db.products);
}
