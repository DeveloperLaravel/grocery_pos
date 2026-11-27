// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_terminals_dao.dart';

// ignore_for_file: type=lint
mixin _$PosTerminalsDaoMixin on DatabaseAccessor<AppDatabase> {
  $PosTerminalsTable get posTerminals => attachedDatabase.posTerminals;
  $StoresTable get stores => attachedDatabase.stores;
  PosTerminalsDaoManager get managers => PosTerminalsDaoManager(this);
}

class PosTerminalsDaoManager {
  final _$PosTerminalsDaoMixin _db;
  PosTerminalsDaoManager(this._db);
  $$PosTerminalsTableTableManager get posTerminals =>
      $$PosTerminalsTableTableManager(_db.attachedDatabase, _db.posTerminals);
  $$StoresTableTableManager get stores =>
      $$StoresTableTableManager(_db.attachedDatabase, _db.stores);
}
