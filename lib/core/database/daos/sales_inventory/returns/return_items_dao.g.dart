// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_items_dao.dart';

// ignore_for_file: type=lint
mixin _$ReturnItemsDaoMixin on DatabaseAccessor<AppDatabase> {
  $ReturnsTable get returns => attachedDatabase.returns;
  $ReturnItemsTable get returnItems => attachedDatabase.returnItems;
  ReturnItemsDaoManager get managers => ReturnItemsDaoManager(this);
}

class ReturnItemsDaoManager {
  final _$ReturnItemsDaoMixin _db;
  ReturnItemsDaoManager(this._db);
  $$ReturnsTableTableManager get returns =>
      $$ReturnsTableTableManager(_db.attachedDatabase, _db.returns);
  $$ReturnItemsTableTableManager get returnItems =>
      $$ReturnItemsTableTableManager(_db.attachedDatabase, _db.returnItems);
}
