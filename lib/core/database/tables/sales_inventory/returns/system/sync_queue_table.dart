
import 'package:drift/drift.dart';

@DataClassName('SyncQueueDb')
@TableIndex(
  name: 'idx_sync_queue_status',
  columns: {#status, #nextRetryAt},
)
@TableIndex(
  name: 'idx_sync_queue_entity',
  columns: {#entityType, #entityId},
)
class SyncQueue extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get entityType =>
      text().withLength(min: 1, max: 100)();

  TextColumn get entityId =>
      text().withLength(min: 1, max: 100)();

  TextColumn get operation =>
      text().withDefault(const Constant('create'))();

  TextColumn get payload =>
      text()();

  TextColumn get status =>
      text().withDefault(const Constant('pending'))();

  TextColumn get deviceUuid =>
      text().nullable()();

  IntColumn get priority =>
      integer().withDefault(const Constant(0))();

  IntColumn get attempts =>
      integer().withDefault(const Constant(0))();

  IntColumn get maxAttempts =>
      integer().withDefault(const Constant(5))();

  TextColumn get lastError =>
      text().nullable()();

  DateTimeColumn get nextRetryAt =>
      dateTime().nullable()();

  DateTimeColumn get syncedAt =>
      dateTime().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();
}
