
import 'package:drift/drift.dart';

@DataClassName('DeviceRegistrationDb')
class DeviceRegistrations extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get deviceUuid => text().unique()();

  TextColumn get deviceName => text()();

  TextColumn get platform => text()();

  TextColumn get appVersion => text().nullable()();

  BoolColumn get isActive =>
      boolean().withDefault(const Constant(true))();

  DateTimeColumn get lastSyncAt => dateTime().nullable()();

  DateTimeColumn get registeredAt =>
      dateTime().withDefault(currentDateAndTime)();
}
