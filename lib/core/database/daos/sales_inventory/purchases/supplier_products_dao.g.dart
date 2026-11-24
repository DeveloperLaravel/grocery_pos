// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplier_products_dao.dart';

// ignore_for_file: type=lint
mixin _$SupplierProductsDaoMixin on DatabaseAccessor<AppDatabase> {
  $SupplierProductsTable get supplierProducts =>
      attachedDatabase.supplierProducts;
  SupplierProductsDaoManager get managers => SupplierProductsDaoManager(this);
}

class SupplierProductsDaoManager {
  final _$SupplierProductsDaoMixin _db;
  SupplierProductsDaoManager(this._db);
  $$SupplierProductsTableTableManager get supplierProducts =>
      $$SupplierProductsTableTableManager(
          _db.attachedDatabase, _db.supplierProducts);
}
