import 'package:drift/drift.dart';

import '../../../tables/sales_inventory/inventory/stores_table.dart';
import 'pos_terminals_table.dart';

@DataClassName('CashRegisterDb')
class CashRegisters extends Table {
  // Primary Key
  IntColumn get id => integer().autoIncrement()();

  // Relationships
  IntColumn get terminalId => integer().references(
        PosTerminals,
        #id,
        onDelete: KeyAction.restrict,
      )();

  IntColumn get storeId => integer().references(
        Stores,
        #id,
        onDelete: KeyAction.restrict,
      )();

  // Register Information
  TextColumn get registerCode => text()
      .withLength(min: 1, max: 30)
      .unique()();

  TextColumn get name => text()
      .withLength(min: 1, max: 100)();

  TextColumn get description => text().nullable()();

  // Cash Drawer
  TextColumn get drawerCode => text().nullable()();

  // Status
  BoolColumn get isActive =>
      boolean().withDefault(const Constant(true))();

  BoolColumn get isDefault =>
      boolean().withDefault(const Constant(false))();

  // Audit
  IntColumn get createdBy => integer().nullable()();

  IntColumn get updatedBy => integer().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().nullable()();

  TextColumn get notes => text().nullable()();
}