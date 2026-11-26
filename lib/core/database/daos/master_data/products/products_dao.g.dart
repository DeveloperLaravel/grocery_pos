// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_dao.dart';

// ignore_for_file: type=lint
mixin _$ProductsDaoMixin on DatabaseAccessor<AppDatabase> {
  $ProductsTable get products => attachedDatabase.products;
  $ProductUnitsTable get productUnits => attachedDatabase.productUnits;
  $ProductBarcodesTable get productBarcodes => attachedDatabase.productBarcodes;
  $ProductImagesTable get productImages => attachedDatabase.productImages;
  $CategoriesTable get categories => attachedDatabase.categories;
  $BrandsTable get brands => attachedDatabase.brands;
  ProductsDaoManager get managers => ProductsDaoManager(this);
}

class ProductsDaoManager {
  final _$ProductsDaoMixin _db;
  ProductsDaoManager(this._db);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db.attachedDatabase, _db.products);
  $$ProductUnitsTableTableManager get productUnits =>
      $$ProductUnitsTableTableManager(_db.attachedDatabase, _db.productUnits);
  $$ProductBarcodesTableTableManager get productBarcodes =>
      $$ProductBarcodesTableTableManager(
          _db.attachedDatabase, _db.productBarcodes);
  $$ProductImagesTableTableManager get productImages =>
      $$ProductImagesTableTableManager(_db.attachedDatabase, _db.productImages);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db.attachedDatabase, _db.categories);
  $$BrandsTableTableManager get brands =>
      $$BrandsTableTableManager(_db.attachedDatabase, _db.brands);
}
