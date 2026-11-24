
import 'package:drift/drift.dart';

import 'database/tables/inventory/stores_table.dart';

@DataClassName('StockAdjustmentDb')
class StockAdjustments extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get adjustmentNumber => text().unique()();

  IntColumn get storeId => integer().references(
        Stores,
        #id,
        onDelete: KeyAction.restrict,
      )();

  DateTimeColumn get adjustmentDate =>
      dateTime().withDefault(currentDateAndTime)();

  TextColumn get reason => text()();

  TextColumn get status =>
      text().withDefault(const Constant('draft'))();

  IntColumn get createdBy => integer().nullable()();

  IntColumn get approvedBy => integer().nullable()();

  DateTimeColumn get approvedAt => dateTime().nullable()();

  TextColumn get notes => text().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
}
