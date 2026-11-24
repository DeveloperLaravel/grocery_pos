
import 'package:drift/drift.dart';

@DataClassName('AuditLogDb')
class AuditLogs extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get userId => integer().nullable()();

  TextColumn get action => text()();

  TextColumn get entityType => text()();

  IntColumn get entityId => integer().nullable()();

  TextColumn get oldData => text().nullable()();

  TextColumn get newData => text().nullable()();

  TextColumn get description => text().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
}
