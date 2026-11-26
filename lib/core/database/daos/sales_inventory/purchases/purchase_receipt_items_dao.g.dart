// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_receipt_items_dao.dart';

// ignore_for_file: type=lint
mixin _$PurchaseReceiptItemsDaoMixin
    on DatabaseAccessor<dynamic /* = invalid*/ > {
  $PurchaseReceiptItemsTable get purchaseReceiptItems =>
      attachedDatabase.purchaseReceiptItems;
  PurchaseReceiptItemsDaoManager get managers =>
      PurchaseReceiptItemsDaoManager(this);
}

class PurchaseReceiptItemsDaoManager {
  final _$PurchaseReceiptItemsDaoMixin _db;
  PurchaseReceiptItemsDaoManager(this._db);
  $$PurchaseReceiptItemsTableTableManager get purchaseReceiptItems =>
      $$PurchaseReceiptItemsTableTableManager(
          _db.attachedDatabase, _db.purchaseReceiptItems);
}
