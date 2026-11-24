// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_receipts_dao.dart';

// ignore_for_file: type=lint
mixin _$PurchaseReceiptsDaoMixin on DatabaseAccessor<AppDatabase> {
  $PurchaseReceiptsTable get purchaseReceipts =>
      attachedDatabase.purchaseReceipts;
  $PurchaseReceiptItemsTable get purchaseReceiptItems =>
      attachedDatabase.purchaseReceiptItems;
  PurchaseReceiptsDaoManager get managers => PurchaseReceiptsDaoManager(this);
}

class PurchaseReceiptsDaoManager {
  final _$PurchaseReceiptsDaoMixin _db;
  PurchaseReceiptsDaoManager(this._db);
  $$PurchaseReceiptsTableTableManager get purchaseReceipts =>
      $$PurchaseReceiptsTableTableManager(
          _db.attachedDatabase, _db.purchaseReceipts);
  $$PurchaseReceiptItemsTableTableManager get purchaseReceiptItems =>
      $$PurchaseReceiptItemsTableTableManager(
          _db.attachedDatabase, _db.purchaseReceiptItems);
}
