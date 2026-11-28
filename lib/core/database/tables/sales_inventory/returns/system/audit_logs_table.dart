
import 'package:drift/drift.dart';

@DataClassName('AuditLogDb')
@TableIndex(
  name: 'idx_audit_logs_entity',
  columns: {#entityType, #entityId},
)
@TableIndex(
  name: 'idx_audit_logs_created_at',
  columns: {#createdAt},
)
class AuditLogs extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get action =>
      text().withLength(min: 1, max: 100)();

  TextColumn get entityType =>
      text().withLength(min: 1, max: 100)();

  TextColumn get entityId =>
      text().nullable()();

  TextColumn get entityDisplayName =>
      text().named('entity_name').nullable()();

  TextColumn get userId =>
      text().nullable()();

  TextColumn get userName =>
      text().nullable()();

  TextColumn get deviceUuid =>
      text().nullable()();

  TextColumn get description =>
      text().nullable()();

  TextColumn get oldValues =>
      text().nullable()();

  TextColumn get newValues =>
      text().nullable()();

  TextColumn get metadata =>
      text().nullable()();

  TextColumn get ipAddress =>
      text().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
}
