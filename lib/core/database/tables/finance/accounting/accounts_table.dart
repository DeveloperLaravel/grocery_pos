
import 'package:drift/drift.dart';

@DataClassName('AccountDb')
class Accounts extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get accountCode => text().unique()();

  TextColumn get name => text()();

  IntColumn get parentId => integer()
      .nullable()
      .references(
        Accounts,
        #id,
        onDelete: KeyAction.restrict,
      )();

  TextColumn get accountType => text()();

  TextColumn get normalBalance => text()();

  BoolColumn get isActive =>
      boolean().withDefault(const Constant(true))();

  BoolColumn get isSystem =>
      boolean().withDefault(const Constant(false))();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();
}
