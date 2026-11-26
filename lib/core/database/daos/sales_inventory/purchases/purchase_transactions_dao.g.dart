// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_transactions_dao.dart';

// ignore_for_file: type=lint
mixin _$PurchaseTransactionsDaoMixin on DatabaseAccessor<AppDatabase> {
  $PurchaseOrdersTable get purchaseOrders => attachedDatabase.purchaseOrders;
  $PurchaseItemsTable get purchaseItems => attachedDatabase.purchaseItems;
  $PurchasePaymentsTable get purchasePayments =>
      attachedDatabase.purchasePayments;
  PurchaseTransactionsDaoManager get managers =>
      PurchaseTransactionsDaoManager(this);
}

class PurchaseTransactionsDaoManager {
  final _$PurchaseTransactionsDaoMixin _db;
  PurchaseTransactionsDaoManager(this._db);
  $$PurchaseOrdersTableTableManager get purchaseOrders =>
      $$PurchaseOrdersTableTableManager(
          _db.attachedDatabase, _db.purchaseOrders);
  $$PurchaseItemsTableTableManager get purchaseItems =>
      $$PurchaseItemsTableTableManager(_db.attachedDatabase, _db.purchaseItems);
  $$PurchasePaymentsTableTableManager get purchasePayments =>
      $$PurchasePaymentsTableTableManager(
          _db.attachedDatabase, _db.purchasePayments);
}
