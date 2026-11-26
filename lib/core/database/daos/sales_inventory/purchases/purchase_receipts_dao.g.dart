// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_receipts_dao.dart';

// ignore_for_file: type=lint
mixin _$PurchaseReceiptsDaoMixin on DatabaseAccessor<AppDatabase> {
  $PurchaseReceiptsTable get purchaseReceipts =>
      attachedDatabase.purchaseReceipts;
  PurchaseReceiptsDaoManager get managers => PurchaseReceiptsDaoManager(this);
}

class PurchaseReceiptsDaoManager {
  final _$PurchaseReceiptsDaoMixin _db;
  PurchaseReceiptsDaoManager(this._db);
  $$PurchaseReceiptsTableTableManager get purchaseReceipts =>
      $$PurchaseReceiptsTableTableManager(
          _db.attachedDatabase, _db.purchaseReceipts);
}
