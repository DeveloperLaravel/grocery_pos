
import 'package:drift/drift.dart';

import '../../../../app_database.dart';
import '../../../../tables/sales_inventory/returns/system/device_registrations_table.dart';


part 'device_registrations_dao.g.dart';

@DriftAccessor(tables: [DeviceRegistrations])
class DeviceRegistrationsDao
    extends DatabaseAccessor<AppDatabase>
    with _$DeviceRegistrationsDaoMixin {
  DeviceRegistrationsDao(super.db);

  // تسجيل جهاز جديد أو تحديث بيانات جهاز موجود
  Future<int> registerDevice({
    required String deviceUuid,
    required String deviceName,
    String deviceType = 'desktop',
    String? operatingSystem,
    String? osVersion,
    String? appVersion,
    String? deviceModel,
    String? registeredBy,
    bool isTrusted = false,
  }) async {
    return transaction(() async {
      final existing = await (select(deviceRegistrations)
            ..where((t) => t.deviceUuid.equals(deviceUuid)))
          .getSingleOrNull();

      final now = DateTime.now();

      if (existing != null) {
        await (update(deviceRegistrations)
              ..where((t) => t.id.equals(existing.id)))
            .write(
          DeviceRegistrationsCompanion(
            deviceName: Value(deviceName),
            deviceType: Value(deviceType),
            operatingSystem: Value(operatingSystem),
            osVersion: Value(osVersion),
            appVersion: Value(appVersion),
            deviceModel: Value(deviceModel),
            lastSeenAt: Value(now),
            updatedAt: Value(now),
            isTrusted: Value(isTrusted),
          ),
        );

        return existing.id;
      }

      return into(deviceRegistrations).insert(
        DeviceRegistrationsCompanion.insert(
          deviceUuid: deviceUuid,
          deviceName: deviceName,
          deviceType: Value(deviceType),
          operatingSystem: Value(operatingSystem),
          osVersion: Value(osVersion),
          appVersion: Value(appVersion),
          deviceModel: Value(deviceModel),
          registeredBy: Value(registeredBy),
          isTrusted: Value(isTrusted),
          lastSeenAt: Value(now),
        ),
      );
    });
  }

  // جميع الأجهزة
  Future<List<DeviceRegistrationDb>> getAllDevices() {
    return (select(deviceRegistrations)
          ..orderBy([
            (t) => OrderingTerm.desc(t.registeredAt),
          ]))
        .get();
  }

  // الأجهزة النشطة
  Future<List<DeviceRegistrationDb>> getActiveDevices() {
    return (select(deviceRegistrations)
          ..where((t) => t.isActive.equals(true))
          ..orderBy([
            (t) => OrderingTerm.desc(t.lastSeenAt),
          ]))
        .get();
  }

  // مراقبة الأجهزة
  Stream<List<DeviceRegistrationDb>> watchAllDevices() {
    return (select(deviceRegistrations)
          ..orderBy([
            (t) => OrderingTerm.desc(t.registeredAt),
          ]))
        .watch();
  }

  // البحث بالمعرف
  Future<DeviceRegistrationDb?> getByUuid(String uuid) {
    return (select(deviceRegistrations)
          ..where((t) => t.deviceUuid.equals(uuid)))
        .getSingleOrNull();
  }

  // البحث بالرقم
  Future<DeviceRegistrationDb?> getById(int id) {
    return (select(deviceRegistrations)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  // تحديث آخر نشاط
  Future<bool> updateLastSeen(String uuid) async {
    final rows = await (update(deviceRegistrations)
          ..where((t) => t.deviceUuid.equals(uuid)))
        .write(
      DeviceRegistrationsCompanion(
        lastSeenAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      ),
    );
    return rows > 0;
  }

  // تحديث آخر مزامنة
  Future<bool> updateLastSync(String uuid) async {
    final now = DateTime.now();
    final rows = await (update(deviceRegistrations)
          ..where((t) => t.deviceUuid.equals(uuid)))
        .write(
      DeviceRegistrationsCompanion(
        lastSyncAt: Value(now),
        lastSeenAt: Value(now),
        updatedAt: Value(now),
      ),
    );
    return rows > 0;
  }

  // تغيير حالة الجهاز
  Future<bool> updateStatus({
    required int id,
    required String status,
    required bool isActive,
  }) async {
    final rows = await (update(deviceRegistrations)
          ..where((t) => t.id.equals(id)))
        .write(
      DeviceRegistrationsCompanion(
        status: Value(status),
        isActive: Value(isActive),
        updatedAt: Value(DateTime.now()),
      ),
    );
    return rows > 0;
  }

  // الوثوق بالجهاز
  Future<bool> setTrusted(int id, bool trusted) async {
    final rows = await (update(deviceRegistrations)
          ..where((t) => t.id.equals(id)))
        .write(
      DeviceRegistrationsCompanion(
        isTrusted: Value(trusted),
        updatedAt: Value(DateTime.now()),
      ),
    );
    return rows > 0;
  }

  // حذف جهاز
  Future<int> deleteDevice(int id) {
    return (delete(deviceRegistrations)
          ..where((t) => t.id.equals(id)))
        .go();
  }

  // عدد الأجهزة النشطة
  Future<int> getActiveCount() async {
    final count = deviceRegistrations.id.count();

    final query = selectOnly(deviceRegistrations)
      ..addColumns([count])
      ..where(deviceRegistrations.isActive.equals(true));

    return await query.map((row) => row.read(count)!).getSingle();
  }
}
