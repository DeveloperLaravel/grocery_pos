// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cash_movements_dao.dart';

// ignore_for_file: type=lint
mixin _$CashMovementsDaoMixin on DatabaseAccessor<AppDatabase> {
  $CashMovementsTable get cashMovements => attachedDatabase.cashMovements;
  $CashierShiftsTable get cashierShifts => attachedDatabase.cashierShifts;
  $CashRegistersTable get cashRegisters => attachedDatabase.cashRegisters;
  CashMovementsDaoManager get managers => CashMovementsDaoManager(this);
}

class CashMovementsDaoManager {
  final _$CashMovementsDaoMixin _db;
  CashMovementsDaoManager(this._db);
  $$CashMovementsTableTableManager get cashMovements =>
      $$CashMovementsTableTableManager(_db.attachedDatabase, _db.cashMovements);
  $$CashierShiftsTableTableManager get cashierShifts =>
      $$CashierShiftsTableTableManager(_db.attachedDatabase, _db.cashierShifts);
  $$CashRegistersTableTableManager get cashRegisters =>
      $$CashRegistersTableTableManager(_db.attachedDatabase, _db.cashRegisters);
}
