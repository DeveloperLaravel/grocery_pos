// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_transactions_dao.dart';

// ignore_for_file: type=lint
mixin _$CustomerTransactionsDaoMixin on DatabaseAccessor<AppDatabase> {
  $CustomerTransactionsTable get customerTransactions =>
      attachedDatabase.customerTransactions;
  CustomerTransactionsDaoManager get managers =>
      CustomerTransactionsDaoManager(this);
}

class CustomerTransactionsDaoManager {
  final _$CustomerTransactionsDaoMixin _db;
  CustomerTransactionsDaoManager(this._db);
  $$CustomerTransactionsTableTableManager get customerTransactions =>
      $$CustomerTransactionsTableTableManager(
          _db.attachedDatabase, _db.customerTransactions);
}
