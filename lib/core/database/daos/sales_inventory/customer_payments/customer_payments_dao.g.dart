// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_payments_dao.dart';

// ignore_for_file: type=lint
mixin _$CustomerPaymentsDaoMixin on DatabaseAccessor<AppDatabase> {
  $CustomerPaymentsTable get customerPayments =>
      attachedDatabase.customerPayments;
  $CustomerPaymentAllocationsTable get customerPaymentAllocations =>
      attachedDatabase.customerPaymentAllocations;
  CustomerPaymentsDaoManager get managers => CustomerPaymentsDaoManager(this);
}

class CustomerPaymentsDaoManager {
  final _$CustomerPaymentsDaoMixin _db;
  CustomerPaymentsDaoManager(this._db);
  $$CustomerPaymentsTableTableManager get customerPayments =>
      $$CustomerPaymentsTableTableManager(
          _db.attachedDatabase, _db.customerPayments);
  $$CustomerPaymentAllocationsTableTableManager
      get customerPaymentAllocations =>
          $$CustomerPaymentAllocationsTableTableManager(
              _db.attachedDatabase, _db.customerPaymentAllocations);
}
