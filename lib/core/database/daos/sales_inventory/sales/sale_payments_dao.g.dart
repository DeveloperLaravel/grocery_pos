// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_payments_dao.dart';

// ignore_for_file: type=lint
mixin _$SalePaymentsDaoMixin on DatabaseAccessor<AppDatabase> {
  $SalesTable get sales => attachedDatabase.sales;
  $SalePaymentsTable get salePayments => attachedDatabase.salePayments;
  SalePaymentsDaoManager get managers => SalePaymentsDaoManager(this);
}

class SalePaymentsDaoManager {
  final _$SalePaymentsDaoMixin _db;
  SalePaymentsDaoManager(this._db);
  $$SalesTableTableManager get sales =>
      $$SalesTableTableManager(_db.attachedDatabase, _db.sales);
  $$SalePaymentsTableTableManager get salePayments =>
      $$SalePaymentsTableTableManager(_db.attachedDatabase, _db.salePayments);
}
