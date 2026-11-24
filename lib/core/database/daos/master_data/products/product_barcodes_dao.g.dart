// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_barcodes_dao.dart';

// ignore_for_file: type=lint
mixin _$ProductBarcodesDaoMixin on DatabaseAccessor<AppDatabase> {
  $ProductsTable get products => attachedDatabase.products;
  $ProductUnitsTable get productUnits => attachedDatabase.productUnits;
  $ProductBarcodesTable get productBarcodes => attachedDatabase.productBarcodes;
  ProductBarcodesDaoManager get managers => ProductBarcodesDaoManager(this);
}

class ProductBarcodesDaoManager {
  final _$ProductBarcodesDaoMixin _db;
  ProductBarcodesDaoManager(this._db);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db.attachedDatabase, _db.products);
  $$ProductUnitsTableTableManager get productUnits =>
      $$ProductUnitsTableTableManager(_db.attachedDatabase, _db.productUnits);
  $$ProductBarcodesTableTableManager get productBarcodes =>
      $$ProductBarcodesTableTableManager(
          _db.attachedDatabase, _db.productBarcodes);
}
