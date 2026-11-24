// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_orders_dao.dart';

// ignore_for_file: type=lint
mixin _$PurchaseOrdersDaoMixin on DatabaseAccessor<AppDatabase> {
  $PurchaseOrdersTable get purchaseOrders => attachedDatabase.purchaseOrders;
  $PurchaseItemsTable get purchaseItems => attachedDatabase.purchaseItems;
  PurchaseOrdersDaoManager get managers => PurchaseOrdersDaoManager(this);
}

class PurchaseOrdersDaoManager {
  final _$PurchaseOrdersDaoMixin _db;
  PurchaseOrdersDaoManager(this._db);
  $$PurchaseOrdersTableTableManager get purchaseOrders =>
      $$PurchaseOrdersTableTableManager(
          _db.attachedDatabase, _db.purchaseOrders);
  $$PurchaseItemsTableTableManager get purchaseItems =>
      $$PurchaseItemsTableTableManager(_db.attachedDatabase, _db.purchaseItems);
}
