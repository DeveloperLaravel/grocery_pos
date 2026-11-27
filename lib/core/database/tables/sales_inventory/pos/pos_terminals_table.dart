import 'package:drift/drift.dart';

import '../../../tables/sales_inventory/inventory/stores_table.dart';

@DataClassName('PosTerminalDb')
class PosTerminals extends Table {
  // Primary Key
  IntColumn get id => integer().autoIncrement()();

  // Store Relationship
  IntColumn get storeId => integer().references(
        Stores,
        #id,
        onDelete: KeyAction.restrict,
      )();

  // Terminal Information
  TextColumn get terminalCode => text()
      .withLength(min: 1, max: 30)
      .unique()();

  TextColumn get name => text()
      .withLength(min: 1, max: 100)();

  // Unique physical device identifier
  TextColumn get deviceId => text()
      .nullable()
      .unique()();

  TextColumn get description => text().nullable()();

  // Device Information
  TextColumn get deviceName => text().nullable()();

  TextColumn get operatingSystem => text().nullable()();

  TextColumn get appVersion => text().nullable()();

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

  DateTimeColumn get updatedAt =>
      dateTime().nullable()();

  // Notes
  TextColumn get notes => text().nullable()();
}