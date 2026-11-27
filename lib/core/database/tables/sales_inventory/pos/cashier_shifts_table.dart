import 'package:drift/drift.dart';

import 'cash_registers_table.dart';
import 'pos_terminals_table.dart';

@DataClassName('CashierShiftDb')
class CashierShifts extends Table {
  // Primary Key
  IntColumn get id => integer().autoIncrement()();

  // Relationships
  IntColumn get registerId => integer().references(
        CashRegisters,
        #id,
        onDelete: KeyAction.restrict,
      )();

  IntColumn get terminalId => integer().references(
        PosTerminals,
        #id,
        onDelete: KeyAction.restrict,
      )();

  // Cashier
  IntColumn get cashierId => integer()();

  // Shift Number
  TextColumn get shiftNumber => text()
      .withLength(min: 1, max: 40)
      .unique()();

  // Shift Status
  TextColumn get status => text()
      .withDefault(const Constant('open'))();

  // open / closed / cancelled

  // Opening Information
  DateTimeColumn get openedAt =>
      dateTime().withDefault(currentDateAndTime)();

  RealColumn get openingCash =>
      real().withDefault(const Constant(0))();

  IntColumn get openedBy => integer().nullable()();

  // Closing Information
  DateTimeColumn get closedAt => dateTime().nullable()();

  RealColumn get expectedCash => real().nullable()();

  RealColumn get countedCash => real().nullable()();

  RealColumn get cashDifference => real().nullable()();

  IntColumn get closedBy => integer().nullable()();

  // Additional Information
  TextColumn get openingNote => text().nullable()();

  TextColumn get closingNote => text().nullable()();

  TextColumn get cancellationReason => text().nullable()();

  // Audit
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().nullable()();
}