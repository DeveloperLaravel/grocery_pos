// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_settings_dao.dart';

// ignore_for_file: type=lint
mixin _$PosSettingsDaoMixin on DatabaseAccessor<AppDatabase> {
  $PosSettingsTable get posSettings => attachedDatabase.posSettings;
  PosSettingsDaoManager get managers => PosSettingsDaoManager(this);
}

class PosSettingsDaoManager {
  final _$PosSettingsDaoMixin _db;
  PosSettingsDaoManager(this._db);
  $$PosSettingsTableTableManager get posSettings =>
      $$PosSettingsTableTableManager(_db.attachedDatabase, _db.posSettings);
}
