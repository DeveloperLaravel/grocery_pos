
import 'package:drift/drift.dart';

import '../../inventory/stores_table.dart';

@DataClassName('PosTerminalDb')
class PosTerminals extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get storeId => integer().references(
        Stores,
        #id,
        onDelete: KeyAction.restrict,
      )();

  TextColumn get code => text().unique()();

  TextColumn get name => text()();

  TextColumn get description => text().nullable()();

  BoolColumn get isActive =>
      boolean().withDefault(const Constant(true))();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();
}
