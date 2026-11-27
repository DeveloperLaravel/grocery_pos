
import 'package:drift/drift.dart';

@DataClassName('ExpenseCategoryDb')
class ExpenseCategories extends Table {
  // Primary Key
  IntColumn get id => integer().autoIncrement()();

  // Self Relationship (Parent Category)
  IntColumn get parentId => integer()
      .nullable()
      .references(
        ExpenseCategories,
        #id,
        onDelete: KeyAction.setNull,
      )();

  // Basic Information
  TextColumn get name => text().withLength(
        min: 1,
        max: 100,
      )();

  TextColumn get code => text()
      .withLength(min: 1, max: 30)
      .unique()();

  TextColumn get description => text().nullable()();

  // Display
  TextColumn get icon => text().nullable()();

  TextColumn get color => text().nullable()();

  // Configuration
  BoolColumn get isActive =>
      boolean().withDefault(const Constant(true))();

  IntColumn get sortOrder =>
      integer().withDefault(const Constant(0))();

  // Audit
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().nullable()();

  @override
  List<Set<Column>> get uniqueKeys => [
        {code},
      ];
}
