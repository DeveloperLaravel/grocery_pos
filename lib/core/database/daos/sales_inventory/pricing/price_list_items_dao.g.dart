// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_list_items_dao.dart';

// ignore_for_file: type=lint
mixin _$PriceListItemsDaoMixin on DatabaseAccessor<AppDatabase> {
  $PriceListItemsTable get priceListItems => attachedDatabase.priceListItems;
  PriceListItemsDaoManager get managers => PriceListItemsDaoManager(this);
}

class PriceListItemsDaoManager {
  final _$PriceListItemsDaoMixin _db;
  PriceListItemsDaoManager(this._db);
  $$PriceListItemsTableTableManager get priceListItems =>
      $$PriceListItemsTableTableManager(
          _db.attachedDatabase, _db.priceListItems);
}
