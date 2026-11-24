
import 'package:drift/drift.dart';

@DataClassName('StoreDb')
class Stores extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get code => text().unique().withLength(
        min: 1,
        max: 30,
      )();

  TextColumn get name => text().withLength(
        min: 1,
        max: 150,
      )();

  TextColumn get description => text().nullable()();

  TextColumn get address => text().nullable()();

  TextColumn get phone => text().nullable()();

  IntColumn get managerId => integer().nullable()();

  BoolColumn get isDefault =>
      boolean().withDefault(const Constant(false))();

  BoolColumn get isActive =>
      boolean().withDefault(const Constant(true))();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();
}
