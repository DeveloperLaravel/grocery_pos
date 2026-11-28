import 'dart:convert';

import 'package:drift/drift.dart';

import '../../../../app_database.dart';
import '../../../../tables/sales_inventory/returns/system/audit_logs_table.dart';

part 'audit_logs_dao.g.dart';

@DriftAccessor(tables: [AuditLogs])
class AuditLogsDao extends DatabaseAccessor<AppDatabase>
    with _$AuditLogsDaoMixin {
  AuditLogsDao(super.db);

  // تسجيل عملية
  Future<int> logAction({
    required String action,
    required String entityType,
    String? entityId,
    String? entityName,
    String? userId,
    String? userName,
    String? deviceUuid,
    String? description,
    Map<String, dynamic>? oldValues,
    Map<String, dynamic>? newValues,
    Map<String, dynamic>? metadata,
    String? ipAddress,
  }) {
    return into(auditLogs).insert(
      AuditLogsCompanion.insert(
        action: action,
        entityType: entityType,
        entityId: Value(entityId),
        entityDisplayName: Value(entityName),
        userId: Value(userId),
        userName: Value(userName),
        deviceUuid: Value(deviceUuid),
        description: Value(description),
        oldValues: Value(
          oldValues == null ? null : jsonEncode(oldValues),
        ),
        newValues: Value(
          newValues == null ? null : jsonEncode(newValues),
        ),
        metadata: Value(
          metadata == null ? null : jsonEncode(metadata),
        ),
        ipAddress: Value(ipAddress),
      ),
    );
  }

  // جميع السجلات
  Future<List<AuditLogDb>> getAll({
    int limit = 100,
    int offset = 0,
  }) {
    return (select(auditLogs)
          ..orderBy([
            (t) => OrderingTerm.desc(t.createdAt),
          ])
          ..limit(limit, offset: offset))
        .get();
  }

  // مراقبة السجلات
  Stream<List<AuditLogDb>> watchAll({
    int limit = 100,
  }) {
    return (select(auditLogs)
          ..orderBy([
            (t) => OrderingTerm.desc(t.createdAt),
          ])
          ..limit(limit))
        .watch();
  }

  // البحث حسب نوع العملية
  Future<List<AuditLogDb>> getByAction(String action) {
    return (select(auditLogs)
          ..where((t) => t.action.equals(action))
          ..orderBy([
            (t) => OrderingTerm.desc(t.createdAt),
          ]))
        .get();
  }

  // البحث حسب الجدول أو الكيان
  Future<List<AuditLogDb>> getByEntity({
    required String entityType,
    String? entityId,
    int limit = 100,
  }) {
    final query = select(auditLogs)
      ..where((t) => t.entityType.equals(entityType))
      ..orderBy([
        (t) => OrderingTerm.desc(t.createdAt),
      ])
      ..limit(limit);

    if (entityId != null) {
      query.where((t) => t.entityId.equals(entityId));
    }

    return query.get();
  }

  // سجلات مستخدم
  Future<List<AuditLogDb>> getByUser(
    String userId, {
    int limit = 100,
  }) {
    return (select(auditLogs)
          ..where((t) => t.userId.equals(userId))
          ..orderBy([
            (t) => OrderingTerm.desc(t.createdAt),
          ])
          ..limit(limit))
        .get();
  }

  // سجلات جهاز
  Future<List<AuditLogDb>> getByDevice(String deviceUuid) {
    return (select(auditLogs)
          ..where((t) => t.deviceUuid.equals(deviceUuid))
          ..orderBy([
            (t) => OrderingTerm.desc(t.createdAt),
          ]))
        .get();
  }

  // سجلات فترة زمنية
  Future<List<AuditLogDb>> getByDateRange({
    required DateTime from,
    required DateTime to,
    int limit = 1000,
  }) {
    return (select(auditLogs)
          ..where(
            (t) =>
                t.createdAt.isBiggerOrEqualValue(from) &
                t.createdAt.isSmallerOrEqualValue(to),
          )
          ..orderBy([
            (t) => OrderingTerm.desc(t.createdAt),
          ])
          ..limit(limit))
        .get();
  }

  // قراءة JSON القديم
  Map<String, dynamic>? decodeOldValues(AuditLogDb log) {
    if (log.oldValues == null) return null;

    return Map<String, dynamic>.from(
      jsonDecode(log.oldValues!) as Map,
    );
  }

  // قراءة JSON الجديد
  Map<String, dynamic>? decodeNewValues(AuditLogDb log) {
    if (log.newValues == null) return null;

    return Map<String, dynamic>.from(
      jsonDecode(log.newValues!) as Map,
    );
  }

  // حذف السجلات الأقدم من تاريخ معين
  Future<int> deleteOlderThan(DateTime date) {
    return (delete(auditLogs)
          ..where((t) => t.createdAt.isSmallerThanValue(date)))
        .go();
  }

  // عدد السجلات
  Future<int> getCount() async {
    final count = auditLogs.id.count();

    final query = selectOnly(auditLogs)..addColumns([count]);

    return await query.map((row) => row.read(count)!).getSingle();
  }
}
