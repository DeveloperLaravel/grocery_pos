// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_held_sales_dao.dart';

// ignore_for_file: type=lint
mixin _$PosHeldSalesDaoMixin on DatabaseAccessor<AppDatabase> {
  $PosHeldSalesTable get posHeldSales => attachedDatabase.posHeldSales;
  $PosHeldSaleItemsTable get posHeldSaleItems =>
      attachedDatabase.posHeldSaleItems;
  $PosTerminalsTable get posTerminals => attachedDatabase.posTerminals;
  $CashRegistersTable get cashRegisters => attachedDatabase.cashRegisters;
  $CashierShiftsTable get cashierShifts => attachedDatabase.cashierShifts;
  $CustomersTable get customers => attachedDatabase.customers;
  PosHeldSalesDaoManager get managers => PosHeldSalesDaoManager(this);
}

class PosHeldSalesDaoManager {
  final _$PosHeldSalesDaoMixin _db;
  PosHeldSalesDaoManager(this._db);
  $$PosHeldSalesTableTableManager get posHeldSales =>
      $$PosHeldSalesTableTableManager(_db.attachedDatabase, _db.posHeldSales);
  $$PosHeldSaleItemsTableTableManager get posHeldSaleItems =>
      $$PosHeldSaleItemsTableTableManager(
          _db.attachedDatabase, _db.posHeldSaleItems);
  $$PosTerminalsTableTableManager get posTerminals =>
      $$PosTerminalsTableTableManager(_db.attachedDatabase, _db.posTerminals);
  $$CashRegistersTableTableManager get cashRegisters =>
      $$CashRegistersTableTableManager(_db.attachedDatabase, _db.cashRegisters);
  $$CashierShiftsTableTableManager get cashierShifts =>
      $$CashierShiftsTableTableManager(_db.attachedDatabase, _db.cashierShifts);
  $$CustomersTableTableManager get customers =>
      $$CustomersTableTableManager(_db.attachedDatabase, _db.customers);
}
