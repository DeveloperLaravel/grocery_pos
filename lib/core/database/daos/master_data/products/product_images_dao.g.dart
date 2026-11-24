// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_images_dao.dart';

// ignore_for_file: type=lint
mixin _$ProductImagesDaoMixin on DatabaseAccessor<AppDatabase> {
  $ProductsTable get products => attachedDatabase.products;
  $ProductImagesTable get productImages => attachedDatabase.productImages;
  ProductImagesDaoManager get managers => ProductImagesDaoManager(this);
}

class ProductImagesDaoManager {
  final _$ProductImagesDaoMixin _db;
  ProductImagesDaoManager(this._db);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db.attachedDatabase, _db.products);
  $$ProductImagesTableTableManager get productImages =>
      $$ProductImagesTableTableManager(_db.attachedDatabase, _db.productImages);
}
