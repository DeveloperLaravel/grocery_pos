
import 'package:drift/drift.dart';

import 'sync_queue_table.dart';

@DataClassName('SyncLogDb')
@TableIndex(
  name: 'idx_sync_logs_queue',
  columns: {#queueId},
)
@TableIndex(
  name: 'idx_sync_logs_created_at',
  columns: {#createdAt},
)
class SyncLogs extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get queueId => integer()
      .nullable()
      .references(
        SyncQueue,
        #id,
        onDelete: KeyAction.setNull,
      )();

  TextColumn get entityType =>
      text().nullable()();

  TextColumn get entityId =>
      text().nullable()();

  TextColumn get operation =>
      text().nullable()();

  TextColumn get status =>
      text().withDefault(const Constant('failed'))();

  IntColumn get durationMs =>
      integer().nullable()();

  IntColumn get httpStatusCode =>
      integer().nullable()();

  TextColumn get message =>
      text().nullable()();

  TextColumn get errorDetails =>
      text().nullable()();

  TextColumn get responseData =>
      text().nullable()();

  TextColumn get deviceUuid =>
      text().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
}
