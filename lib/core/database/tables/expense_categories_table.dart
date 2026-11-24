
import 'package:drift/drift.dart';

@DataClassName('ExpenseCategoryDb')
class ExpenseCategories extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get description => text().nullable()();

  IntColumn get parentId => integer()
      .nullable()
      .references(
        ExpenseCategories,
        #id,
        onDelete: KeyAction.setNull,
      )();

  BoolColumn get isActive =>
      boolean().withDefault(const Constant(true))();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
}
