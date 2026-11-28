
import 'package:drift/drift.dart';

import '../../../../app_database.dart';
import '../../../../tables/sales_inventory/returns/system/sync_logs_table.dart';

part 'sync_logs_dao.g.dart';

@DriftAccessor(tables: [SyncLogs])
class SyncLogsDao extends DatabaseAccessor<AppDatabase>
    with _$SyncLogsDaoMixin {
  SyncLogsDao(super.db);

  // =====================================================
  // تسجيل محاولة مزامنة
  // =====================================================

  Future<int> insertLog({
    int? queueId,
    String? entityType,
    String? entityId,
    String? operation,
    String status = 'failed',
    int? durationMs,
    int? httpStatusCode,
    String? message,
    String? errorDetails,
    String? responseData,
    String? deviceUuid,
  }) {
    return into(syncLogs).insert(
      SyncLogsCompanion.insert(
        queueId: Value(queueId),
        entityType: Value(entityType),
        entityId: Value(entityId),
        operation: Value(operation),
        status: Value(status),
        durationMs: Value(durationMs),
        httpStatusCode: Value(httpStatusCode),
        message: Value(message),
        errorDetails: Value(errorDetails),
        responseData: Value(responseData),
        deviceUuid: Value(deviceUuid),
      ),
    );
  }

  // =====================================================
  // جلب جميع سجلات المزامنة
  // =====================================================

  Future<List<SyncLogDb>> getAll({
    int limit = 100,
    int offset = 0,
  }) {
    return (select(syncLogs)
          ..orderBy([
            (t) => OrderingTerm.desc(t.createdAt),
          ])
          ..limit(limit, offset: offset))
        .get();
  }

  // =====================================================
  // مراقبة السجلات
  // =====================================================

  Stream<List<SyncLogDb>> watchAll({
    int limit = 100,
  }) {
    return (select(syncLogs)
          ..orderBy([
            (t) => OrderingTerm.desc(t.createdAt),
          ])
          ..limit(limit))
        .watch();
  }

  // =====================================================
  // سجلات عملية معينة
  // =====================================================

  Future<List<SyncLogDb>> getByQueueId(int queueId) {
    return (select(syncLogs)
          ..where((t) => t.queueId.equals(queueId))
          ..orderBy([
            (t) => OrderingTerm.desc(t.createdAt),
          ]))
        .get();
  }

  // =====================================================
  // سجلات كيان معين
  // =====================================================

  Future<List<SyncLogDb>> getByEntity({
    required String entityType,
    required String entityId,
  }) {
    return (select(syncLogs)
          ..where(
            (t) =>
                t.entityType.equals(entityType) &
                t.entityId.equals(entityId),
          )
          ..orderBy([
            (t) => OrderingTerm.desc(t.createdAt),
          ]))
        .get();
  }

  // =====================================================
  // السجلات الناجحة
  // =====================================================

  Future<List<SyncLogDb>> getSuccessful({
    int limit = 100,
  }) {
    return (select(syncLogs)
          ..where((t) => t.status.equals('success'))
          ..orderBy([
            (t) => OrderingTerm.desc(t.createdAt),
          ])
          ..limit(limit))
        .get();
  }

  // =====================================================
  // السجلات الفاشلة
  // =====================================================

  Future<List<SyncLogDb>> getFailed({
    int limit = 100,
  }) {
    return (select(syncLogs)
          ..where((t) => t.status.equals('failed'))
          ..orderBy([
            (t) => OrderingTerm.desc(t.createdAt),
          ])
          ..limit(limit))
        .get();
  }

  // =====================================================
  // مراقبة آخر السجلات الفاشلة
  // =====================================================

  Stream<List<SyncLogDb>> watchFailed({
    int limit = 50,
  }) {
    return (select(syncLogs)
          ..where((t) => t.status.equals('failed'))
          ..orderBy([
            (t) => OrderingTerm.desc(t.createdAt),
          ])
          ..limit(limit))
        .watch();
  }

  // =====================================================
  // عدد السجلات حسب الحالة
  // =====================================================

  Future<int> getCountByStatus(String status) async {
    final count = syncLogs.id.count();

    final query = selectOnly(syncLogs)
      ..addColumns([count])
      ..where(syncLogs.status.equals(status));

    return await query.map((row) => row.read(count)!).getSingle();
  }

  // =====================================================
  // متوسط مدة المزامنة الناجحة
  // =====================================================

  Future<double?> getAverageDuration() async {
    final average = syncLogs.durationMs.avg();

    final query = selectOnly(syncLogs)
      ..addColumns([average])
      ..where(
        syncLogs.status.equals('success') &
            syncLogs.durationMs.isNotNull(),
      );

    return query.map((row) => row.read(average)).getSingle();
  }

  // =====================================================
  // حذف السجلات القديمة
  // =====================================================

  Future<int> deleteOlderThan(DateTime date) {
    return (delete(syncLogs)
          ..where((t) => t.createdAt.isSmallerThanValue(date)))
        .go();
  }

  // =====================================================
  // حذف سجل واحد
  // =====================================================

  Future<int> deleteLog(int id) {
    return (delete(syncLogs)
          ..where((t) => t.id.equals(id)))
        .go();
  }
}
