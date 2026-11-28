// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_payment_allocations_dao.dart';

// ignore_for_file: type=lint
mixin _$CustomerPaymentAllocationsDaoMixin on DatabaseAccessor<AppDatabase> {
  $CustomerPaymentsTable get customerPayments =>
      attachedDatabase.customerPayments;
  $CustomerPaymentAllocationsTable get customerPaymentAllocations =>
      attachedDatabase.customerPaymentAllocations;
  $SalesTable get sales => attachedDatabase.sales;
  CustomerPaymentAllocationsDaoManager get managers =>
      CustomerPaymentAllocationsDaoManager(this);
}

class CustomerPaymentAllocationsDaoManager {
  final _$CustomerPaymentAllocationsDaoMixin _db;
  CustomerPaymentAllocationsDaoManager(this._db);
  $$CustomerPaymentsTableTableManager get customerPayments =>
      $$CustomerPaymentsTableTableManager(
          _db.attachedDatabase, _db.customerPayments);
  $$CustomerPaymentAllocationsTableTableManager
      get customerPaymentAllocations =>
          $$CustomerPaymentAllocationsTableTableManager(
              _db.attachedDatabase, _db.customerPaymentAllocations);
  $$SalesTableTableManager get sales =>
      $$SalesTableTableManager(_db.attachedDatabase, _db.sales);
}
