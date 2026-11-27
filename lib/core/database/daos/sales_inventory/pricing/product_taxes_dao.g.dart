// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_taxes_dao.dart';

// ignore_for_file: type=lint
mixin _$ProductTaxesDaoMixin on DatabaseAccessor<AppDatabase> {
  $ProductTaxesTable get productTaxes => attachedDatabase.productTaxes;
  $TaxesTable get taxes => attachedDatabase.taxes;
  ProductTaxesDaoManager get managers => ProductTaxesDaoManager(this);
}

class ProductTaxesDaoManager {
  final _$ProductTaxesDaoMixin _db;
  ProductTaxesDaoManager(this._db);
  $$ProductTaxesTableTableManager get productTaxes =>
      $$ProductTaxesTableTableManager(_db.attachedDatabase, _db.productTaxes);
  $$TaxesTableTableManager get taxes =>
      $$TaxesTableTableManager(_db.attachedDatabase, _db.taxes);
}
