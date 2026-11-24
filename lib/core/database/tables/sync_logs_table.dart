
import 'package:drift/drift.dart';

@DataClassName('SyncLogDb')
class SyncLogs extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get operationUuid => text()();

  TextColumn get entityType => text()();

  TextColumn get status => text()();

  TextColumn get message => text().nullable()();

  DateTimeColumn get startedAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get completedAt => dateTime().nullable()();
}
