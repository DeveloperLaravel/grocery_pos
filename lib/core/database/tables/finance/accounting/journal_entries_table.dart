
import 'package:drift/drift.dart';

@DataClassName('JournalEntryDb')
class JournalEntries extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get entryNumber => text().unique()();

  DateTimeColumn get entryDate =>
      dateTime().withDefault(currentDateAndTime)();

  TextColumn get description => text().nullable()();

  TextColumn get referenceType => text().nullable()();

  TextColumn get referenceId => text().nullable()();

  TextColumn get status =>
      text().withDefault(const Constant('draft'))();

  IntColumn get createdBy => integer().nullable()();

  DateTimeColumn get postedAt => dateTime().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
}
