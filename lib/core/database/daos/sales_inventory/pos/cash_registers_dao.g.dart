// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cash_registers_dao.dart';

// ignore_for_file: type=lint
mixin _$CashRegistersDaoMixin on DatabaseAccessor<AppDatabase> {
  $CashRegistersTable get cashRegisters => attachedDatabase.cashRegisters;
  CashRegistersDaoManager get managers => CashRegistersDaoManager(this);
}

class CashRegistersDaoManager {
  final _$CashRegistersDaoMixin _db;
  CashRegistersDaoManager(this._db);
  $$CashRegistersTableTableManager get cashRegisters =>
      $$CashRegistersTableTableManager(_db.attachedDatabase, _db.cashRegisters);
}
