// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_lists_dao.dart';

// ignore_for_file: type=lint
mixin _$PriceListsDaoMixin on DatabaseAccessor<AppDatabase> {
  $PriceListsTable get priceLists => attachedDatabase.priceLists;
  PriceListsDaoManager get managers => PriceListsDaoManager(this);
}

class PriceListsDaoManager {
  final _$PriceListsDaoMixin _db;
  PriceListsDaoManager(this._db);
  $$PriceListsTableTableManager get priceLists =>
      $$PriceListsTableTableManager(_db.attachedDatabase, _db.priceLists);
}
