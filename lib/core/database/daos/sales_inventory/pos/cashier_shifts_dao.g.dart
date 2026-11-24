// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cashier_shifts_dao.dart';

// ignore_for_file: type=lint
mixin _$CashierShiftsDaoMixin on DatabaseAccessor<AppDatabase> {
  $CashierShiftsTable get cashierShifts => attachedDatabase.cashierShifts;
  CashierShiftsDaoManager get managers => CashierShiftsDaoManager(this);
}

class CashierShiftsDaoManager {
  final _$CashierShiftsDaoMixin _db;
  CashierShiftsDaoManager(this._db);
  $$CashierShiftsTableTableManager get cashierShifts =>
      $$CashierShiftsTableTableManager(_db.attachedDatabase, _db.cashierShifts);
}
