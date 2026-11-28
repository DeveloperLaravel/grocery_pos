
import 'dart:convert';

import 'package:drift/drift.dart';

import '../../../../app_database.dart';
import '../../../../tables/sales_inventory/returns/system/sync_queue_table.dart';

part 'sync_queue_dao.g.dart';

@DriftAccessor(tables: [SyncQueue])
class SyncQueueDao extends DatabaseAccessor<AppDatabase>
    with _$SyncQueueDaoMixin {
  SyncQueueDao(super.db);

  // =====================================================
  // إضافة عملية للمزامنة
  // =====================================================

  Future<int> enqueue({
    required String entityType,
    required String entityId,
    required String operation,
    required Map<String, dynamic> payload,
    String? deviceUuid,
    int priority = 0,
    int maxAttempts = 5,
  }) {
    return into(syncQueue).insert(
      SyncQueueCompanion.insert(
        entityType: entityType,
        entityId: entityId,
        operation: Value(operation),
        payload: jsonEncode(payload),
        deviceUuid: Value(deviceUuid),
        priority: Value(priority),
        maxAttempts: Value(maxAttempts),
      ),
    );
  }

  // =====================================================
  // جلب جميع العمليات
  // =====================================================

  Future<List<SyncQueueDb>> getAll({
    int limit = 100,
    int offset = 0,
  }) {
    return (select(syncQueue)
          ..orderBy([
            (t) => OrderingTerm.desc(t.priority),
            (t) => OrderingTerm.asc(t.createdAt),
          ])
          ..limit(limit, offset: offset))
        .get();
  }

  // =====================================================
  // مراقبة العمليات
  // =====================================================

  Stream<List<SyncQueueDb>> watchAll() {
    return (select(syncQueue)
          ..orderBy([
            (t) => OrderingTerm.desc(t.priority),
            (t) => OrderingTerm.asc(t.createdAt),
          ]))
        .watch();
  }

  // =====================================================
  // جلب عملية بواسطة ID
  // =====================================================

  Future<SyncQueueDb?> getById(int id) {
    return (select(syncQueue)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  // =====================================================
  // العمليات المعلقة
  // =====================================================

  Future<List<SyncQueueDb>> getPending({
    int limit = 100,
  }) {
    final now = DateTime.now();

    return (select(syncQueue)
          ..where(
            (t) =>
                t.status.equals('pending') &
                (t.nextRetryAt.isNull() |
                    t.nextRetryAt.isSmallerOrEqualValue(now)),
          )
          ..orderBy([
            (t) => OrderingTerm.desc(t.priority),
            (t) => OrderingTerm.asc(t.createdAt),
          ])
          ..limit(limit))
        .get();
  }

  // =====================================================
  // مراقبة عدد العمليات المعلقة
  // =====================================================

  Stream<int> watchPendingCount() {
    final count = syncQueue.id.count();

    final query = selectOnly(syncQueue)
      ..addColumns([count])
      ..where(syncQueue.status.equals('pending'));

    return query.map((row) => row.read(count)!).watchSingle();
  }

  // =====================================================
  // حجز العملية التالية للمعالجة
  // =====================================================

  Future<SyncQueueDb?> claimNextPending() {
    return transaction(() async {
      final now = DateTime.now();

      final item = await (select(syncQueue)
            ..where(
              (t) =>
                  t.status.equals('pending') &
                  (t.nextRetryAt.isNull() |
                      t.nextRetryAt.isSmallerOrEqualValue(now)),
            )
            ..orderBy([
              (t) => OrderingTerm.desc(t.priority),
              (t) => OrderingTerm.asc(t.createdAt),
            ])
            ..limit(1))
          .getSingleOrNull();

      if (item == null) return null;

      await (update(syncQueue)
            ..where((t) => t.id.equals(item.id)))
          .write(
        SyncQueueCompanion(
          status: const Value('processing'),
          attempts: Value(item.attempts + 1),
          updatedAt: Value(now),
        ),
      );

      return (select(syncQueue)
            ..where((t) => t.id.equals(item.id)))
          .getSingleOrNull();
    });
  }

  // =====================================================
  // تغيير حالة العملية
  // =====================================================

  Future<bool> updateStatus({
    required int id,
    required String status,
    String? error,
  }) async {
    final rows = await (update(syncQueue)
          ..where((t) => t.id.equals(id)))
        .write(
      SyncQueueCompanion(
        status: Value(status),
        lastError: Value(error),
        updatedAt: Value(DateTime.now()),
      ),
    );
    return rows > 0;
  }

  // =====================================================
  // نجاح المزامنة
  // =====================================================

  Future<bool> markSynced(int id) async {
    final now = DateTime.now();

    final rows = await (update(syncQueue)
          ..where((t) => t.id.equals(id)))
        .write(
      SyncQueueCompanion(
        status: const Value('synced'),
        syncedAt: Value(now),
        nextRetryAt: const Value(null),
        lastError: const Value(null),
        updatedAt: Value(now),
      ),
    );
    return rows > 0;
  }

  // =====================================================
  // فشل المزامنة وإعادة المحاولة
  // =====================================================

  Future<bool> markFailed({
    required int id,
    required String error,
    Duration retryDelay = const Duration(minutes: 1),
  }) async {
    final item = await getById(id);

    if (item == null) return false;

    final reachedLimit = item.attempts >= item.maxAttempts;
    final now = DateTime.now();

    final rows = await (update(syncQueue)
          ..where((t) => t.id.equals(id)))
        .write(
      SyncQueueCompanion(
        status: Value(
          reachedLimit ? 'failed' : 'pending',
        ),
        lastError: Value(error),
        nextRetryAt: Value(
          reachedLimit ? null : now.add(retryDelay),
        ),
        updatedAt: Value(now),
      ),
    );
    return rows > 0;
  }

  // =====================================================
  // إعادة محاولة عملية فاشلة
  // =====================================================

  Future<bool> retry(int id) async {
    final rows = await (update(syncQueue)
          ..where(
            (t) =>
                t.id.equals(id) &
                t.status.equals('failed'),
          ))
        .write(
      SyncQueueCompanion(
        status: const Value('pending'),
        attempts: const Value(0),
        lastError: const Value(null),
        nextRetryAt: const Value(null),
        updatedAt: Value(DateTime.now()),
      ),
    );
    return rows > 0;
  }

  // =====================================================
  // إعادة العمليات العالقة
  // =====================================================

  Future<int> recoverProcessingItems({
    Duration timeout = const Duration(minutes: 5),
  }) {
    final cutoff = DateTime.now().subtract(timeout);

    return (update(syncQueue)
          ..where(
            (t) =>
                t.status.equals('processing') &
                t.updatedAt.isSmallerThanValue(cutoff),
          ))
        .write(
          SyncQueueCompanion(
            status: const Value('pending'),
            nextRetryAt: const Value(null),
            updatedAt: Value(DateTime.now()),
          ),
        );
  }

  // =====================================================
  // حذف عملية
  // =====================================================

  Future<int> deleteItem(int id) {
    return (delete(syncQueue)
          ..where((t) => t.id.equals(id)))
        .go();
  }

  // =====================================================
  // حذف العمليات الناجحة
  // =====================================================

  Future<int> deleteSynced({
    DateTime? before,
  }) {
    final query = delete(syncQueue)
      ..where((t) => t.status.equals('synced'));

    if (before != null) {
      query.where(
        (t) => t.syncedAt.isSmallerThanValue(before),
      );
    }

    return query.go();
  }

  // =====================================================
  // قراءة Payload
  // =====================================================

  Map<String, dynamic> decodePayload(SyncQueueDb item) {
    return Map<String, dynamic>.from(
      jsonDecode(item.payload) as Map,
    );
  }

  // =====================================================
  // إحصائيات المزامنة
  // =====================================================

  Future<int> getCountByStatus(String status) async {
    final count = syncQueue.id.count();

    final query = selectOnly(syncQueue)
      ..addColumns([count])
      ..where(syncQueue.status.equals(status));

    return await query.map((row) => row.read(count)!).getSingle();
  }
}
