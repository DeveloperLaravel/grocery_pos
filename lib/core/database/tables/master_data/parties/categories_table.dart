
import 'package:drift/drift.dart';

@DataClassName('CategoryDb')
class Categories extends Table {
  // Primary Key
  IntColumn get id => integer().autoIncrement()();

  // Basic Information
  TextColumn get name => text().withLength(
        min: 1,
        max: 100,
      )();

  TextColumn get description => text().nullable()();

  // Parent Category (Self Relationship)
  IntColumn get parentId => integer()
      .nullable()
      .references(
        Categories,
        #id,
        onDelete: KeyAction.setNull,
      )();

  // Image
  TextColumn get imagePath => text().nullable()();

  // Status
  BoolColumn get isActive =>
      boolean().withDefault(const Constant(true))();

  // Sorting
  IntColumn get sortOrder =>
      integer().withDefault(const Constant(0))();

  // Timestamps
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  List<String> get customConstraints => [
        'CHECK (sortOrder >= 0)',
      ];
}
