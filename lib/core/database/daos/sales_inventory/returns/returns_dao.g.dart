// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'returns_dao.dart';

// ignore_for_file: type=lint
mixin _$ReturnsDaoMixin on DatabaseAccessor<AppDatabase> {
  $ReturnsTable get returns => attachedDatabase.returns;
  $ReturnItemsTable get returnItems => attachedDatabase.returnItems;
  ReturnsDaoManager get managers => ReturnsDaoManager(this);
}

class ReturnsDaoManager {
  final _$ReturnsDaoMixin _db;
  ReturnsDaoManager(this._db);
  $$ReturnsTableTableManager get returns =>
      $$ReturnsTableTableManager(_db.attachedDatabase, _db.returns);
  $$ReturnItemsTableTableManager get returnItems =>
      $$ReturnItemsTableTableManager(_db.attachedDatabase, _db.returnItems);
}
