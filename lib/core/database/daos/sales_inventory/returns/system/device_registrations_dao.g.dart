// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_registrations_dao.dart';

// ignore_for_file: type=lint
mixin _$DeviceRegistrationsDaoMixin on DatabaseAccessor<AppDatabase> {
  $DeviceRegistrationsTable get deviceRegistrations =>
      attachedDatabase.deviceRegistrations;
  DeviceRegistrationsDaoManager get managers =>
      DeviceRegistrationsDaoManager(this);
}

class DeviceRegistrationsDaoManager {
  final _$DeviceRegistrationsDaoMixin _db;
  DeviceRegistrationsDaoManager(this._db);
  $$DeviceRegistrationsTableTableManager get deviceRegistrations =>
      $$DeviceRegistrationsTableTableManager(
          _db.attachedDatabase, _db.deviceRegistrations);
}
