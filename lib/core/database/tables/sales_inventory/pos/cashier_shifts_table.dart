
import 'package:drift/drift.dart';

import 'cash_registers_table.dart';
import 'pos_terminals_table.dart';

@DataClassName('CashierShiftDb')
class CashierShifts extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get shiftNumber => text().unique()();

  IntColumn get cashRegisterId => integer().references(
        CashRegisters,
        #id,
        onDelete: KeyAction.restrict,
      )();

  IntColumn get terminalId => integer()
      .nullable()
      .references(
        PosTerminals,
        #id,
        onDelete: KeyAction.setNull,
      )();

  IntColumn get cashierId => integer()();

  DateTimeColumn get openedAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get closedAt => dateTime().nullable()();

  RealColumn get openingCash =>
      real().withDefault(const Constant(0.0))();

  RealColumn get expectedCash =>
      real().withDefault(const Constant(0.0))();

  RealColumn get actualCash => real().nullable()();

  RealColumn get cashDifference =>
      real().withDefault(const Constant(0.0))();

  RealColumn get totalSales =>
      real().withDefault(const Constant(0.0))();

  RealColumn get totalReturns =>
      real().withDefault(const Constant(0.0))();

  RealColumn get totalCashIn =>
      real().withDefault(const Constant(0.0))();

  RealColumn get totalCashOut =>
      real().withDefault(const Constant(0.0))();

  TextColumn get status =>
      text().withDefault(const Constant('open'))();

  TextColumn get notes => text().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  List<String> get customConstraints => [
        'CHECK (opening_cash >= 0)',
        'CHECK (expected_cash >= 0)',
        'CHECK (actual_cash IS NULL OR actual_cash >= 0)',
        "CHECK (status IN ('open', 'closed', 'suspended'))",
        'CHECK (closed_at IS NULL OR closed_at >= opened_at)',
      ];
}
