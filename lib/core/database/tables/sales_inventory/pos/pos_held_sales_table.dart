import 'package:drift/drift.dart';

import '../../../tables/master_data/parties/customers_table.dart';
import 'cash_registers_table.dart';
import 'cashier_shifts_table.dart';
import 'pos_terminals_table.dart';

@DataClassName('PosHeldSaleDb')
class PosHeldSales extends Table {
  // Primary Key
  IntColumn get id => integer().autoIncrement()();

  // Relationships
  IntColumn get terminalId => integer().references(
        PosTerminals,
        #id,
        onDelete: KeyAction.restrict,
      )();

  IntColumn get registerId => integer().references(
        CashRegisters,
        #id,
        onDelete: KeyAction.restrict,
      )();

  IntColumn get shiftId => integer()
      .nullable()
      .references(
        CashierShifts,
        #id,
        onDelete: KeyAction.setNull,
      )();

  IntColumn get customerId => integer()
      .nullable()
      .references(
        Customers,
        #id,
        onDelete: KeyAction.setNull,
      )();

  // Cashier
  IntColumn get cashierId => integer()();

  // Held Sale Information
  TextColumn get heldNumber => text()
      .withLength(min: 1, max: 40)
      .unique()();

  TextColumn get title => text()
      .nullable()
      .withLength(max: 150)();

  // Financial Information
  RealColumn get subtotal =>
      real().withDefault(const Constant(0))();

  RealColumn get discountAmount =>
      real().withDefault(const Constant(0))();

  RealColumn get taxAmount =>
      real().withDefault(const Constant(0))();

  RealColumn get total =>
      real().withDefault(const Constant(0))();

  // Customer Information Snapshot
  TextColumn get customerName => text().nullable()();

  TextColumn get customerPhone => text().nullable()();

  // Status
  TextColumn get status => text()
      .withDefault(const Constant('held'))();

  // held / resumed / cancelled

  // Dates
  DateTimeColumn get heldAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get resumedAt => dateTime().nullable()();

  DateTimeColumn get cancelledAt => dateTime().nullable()();

  // Notes
  TextColumn get notes => text().nullable()();

  TextColumn get cancellationReason => text().nullable()();

  // Audit
  IntColumn get createdBy => integer().nullable()();

  IntColumn get updatedBy => integer().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().nullable()();
}