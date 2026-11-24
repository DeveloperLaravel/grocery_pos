
import 'package:drift/drift.dart';

import 'cash_registers_table.dart';
import 'cashier_shifts_table.dart';

@DataClassName('CashMovementDb')
class CashMovements extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get cashRegisterId => integer().references(
        CashRegisters,
        #id,
        onDelete: KeyAction.restrict,
      )();

  IntColumn get shiftId => integer()
      .nullable()
      .references(
        CashierShifts,
        #id,
        onDelete: KeyAction.restrict,
      )();

  IntColumn get userId => integer()();

  TextColumn get type => text()();

  RealColumn get amount => real()();

  TextColumn get referenceType => text().nullable()();

  IntColumn get referenceId => integer().nullable()();

  TextColumn get description => text().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  List<String> get customConstraints => [
        'CHECK (amount > 0)',
        "CHECK (type IN ('cash_in', 'cash_out'))",
        'CHECK (reference_id IS NULL OR reference_type IS NOT NULL)',
      ];
}
