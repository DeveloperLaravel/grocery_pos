// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_items_dao.dart';

// ignore_for_file: type=lint
mixin _$PurchaseItemsDaoMixin on DatabaseAccessor<dynamic /* = invalid*/ > {
  $PurchaseItemsTable get purchaseItems => attachedDatabase.purchaseItems;
  PurchaseItemsDaoManager get managers => PurchaseItemsDaoManager(this);
}

class PurchaseItemsDaoManager {
  final _$PurchaseItemsDaoMixin _db;
  PurchaseItemsDaoManager(this._db);
  $$PurchaseItemsTableTableManager get purchaseItems =>
      $$PurchaseItemsTableTableManager(_db.attachedDatabase, _db.purchaseItems);
}
