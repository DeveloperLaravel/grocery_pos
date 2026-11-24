
import 'package:drift/drift.dart';

@DataClassName('CategoryDb')
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(
        min: 1,
        max: 100,
      )();

  TextColumn get description => text().nullable()();

  IntColumn get parentId => integer()
      .nullable()
      .references(
        Categories,
        #id,
        onDelete: KeyAction.setNull,
      )();

  TextColumn get imagePath => text().nullable()();

  BoolColumn get isActive =>
      boolean().withDefault(const Constant(true))();

  IntColumn get sortOrder =>
      integer().withDefault(const Constant(0))();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();
}
