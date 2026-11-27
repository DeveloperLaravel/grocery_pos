// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cashier_shifts_dao.dart';

// ignore_for_file: type=lint
mixin _$CashierShiftsDaoMixin on DatabaseAccessor<AppDatabase> {
  $CashierShiftsTable get cashierShifts => attachedDatabase.cashierShifts;
  $CashRegistersTable get cashRegisters => attachedDatabase.cashRegisters;
  $PosTerminalsTable get posTerminals => attachedDatabase.posTerminals;
  $PosSettingsTable get posSettings => attachedDatabase.posSettings;
  $CashMovementsTable get cashMovements => attachedDatabase.cashMovements;
  CashierShiftsDaoManager get managers => CashierShiftsDaoManager(this);
}

class CashierShiftsDaoManager {
  final _$CashierShiftsDaoMixin _db;
  CashierShiftsDaoManager(this._db);
  $$CashierShiftsTableTableManager get cashierShifts =>
      $$CashierShiftsTableTableManager(_db.attachedDatabase, _db.cashierShifts);
  $$CashRegistersTableTableManager get cashRegisters =>
      $$CashRegistersTableTableManager(_db.attachedDatabase, _db.cashRegisters);
  $$PosTerminalsTableTableManager get posTerminals =>
      $$PosTerminalsTableTableManager(_db.attachedDatabase, _db.posTerminals);
  $$PosSettingsTableTableManager get posSettings =>
      $$PosSettingsTableTableManager(_db.attachedDatabase, _db.posSettings);
  $$CashMovementsTableTableManager get cashMovements =>
      $$CashMovementsTableTableManager(_db.attachedDatabase, _db.cashMovements);
}
