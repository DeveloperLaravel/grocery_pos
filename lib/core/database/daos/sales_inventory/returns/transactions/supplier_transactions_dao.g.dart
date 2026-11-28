// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplier_transactions_dao.dart';

// ignore_for_file: type=lint
mixin _$SupplierTransactionsDaoMixin on DatabaseAccessor<AppDatabase> {
  $SupplierTransactionsTable get supplierTransactions =>
      attachedDatabase.supplierTransactions;
  SupplierTransactionsDaoManager get managers =>
      SupplierTransactionsDaoManager(this);
}

class SupplierTransactionsDaoManager {
  final _$SupplierTransactionsDaoMixin _db;
  SupplierTransactionsDaoManager(this._db);
  $$SupplierTransactionsTableTableManager get supplierTransactions =>
      $$SupplierTransactionsTableTableManager(
          _db.attachedDatabase, _db.supplierTransactions);
}
