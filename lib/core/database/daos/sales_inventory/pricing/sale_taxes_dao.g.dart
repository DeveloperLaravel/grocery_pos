// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_taxes_dao.dart';

// ignore_for_file: type=lint
mixin _$SaleTaxesDaoMixin on DatabaseAccessor<AppDatabase> {
  $SaleTaxesTable get saleTaxes => attachedDatabase.saleTaxes;
  SaleTaxesDaoManager get managers => SaleTaxesDaoManager(this);
}

class SaleTaxesDaoManager {
  final _$SaleTaxesDaoMixin _db;
  SaleTaxesDaoManager(this._db);
  $$SaleTaxesTableTableManager get saleTaxes =>
      $$SaleTaxesTableTableManager(_db.attachedDatabase, _db.saleTaxes);
}
