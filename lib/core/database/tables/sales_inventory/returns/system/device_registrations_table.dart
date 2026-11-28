
import 'package:drift/drift.dart';

@DataClassName('DeviceRegistrationDb')
@TableIndex(
  name: 'idx_device_registrations_uuid',
  columns: {#deviceUuid},
  unique: true,
)
class DeviceRegistrations extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get deviceUuid =>
      text().withLength(min: 1, max: 100)();

  TextColumn get deviceName =>
      text().withLength(min: 1, max: 150)();

  TextColumn get deviceType =>
      text().withDefault(const Constant('desktop'))();

  TextColumn get operatingSystem =>
      text().nullable()();

  TextColumn get osVersion =>
      text().nullable()();

  TextColumn get appVersion =>
      text().nullable()();

  TextColumn get deviceModel =>
      text().nullable()();

  TextColumn get registeredBy =>
      text().nullable()();

  TextColumn get status =>
      text().withDefault(const Constant('active'))();

  BoolColumn get isActive =>
      boolean().withDefault(const Constant(true))();

  BoolColumn get isTrusted =>
      boolean().withDefault(const Constant(false))();

  DateTimeColumn get registeredAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get lastSeenAt =>
      dateTime().nullable()();

  DateTimeColumn get lastSyncAt =>
      dateTime().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();
}
