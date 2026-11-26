// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_payments_dao.dart';

// ignore_for_file: type=lint
mixin _$PurchasePaymentsDaoMixin on DatabaseAccessor<AppDatabase> {
  $PurchasePaymentsTable get purchasePayments =>
      attachedDatabase.purchasePayments;
  PurchasePaymentsDaoManager get managers => PurchasePaymentsDaoManager(this);
}

class PurchasePaymentsDaoManager {
  final _$PurchasePaymentsDaoMixin _db;
  PurchasePaymentsDaoManager(this._db);
  $$PurchasePaymentsTableTableManager get purchasePayments =>
      $$PurchasePaymentsTableTableManager(
          _db.attachedDatabase, _db.purchasePayments);
}
