// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupons_dao.dart';

// ignore_for_file: type=lint
mixin _$CouponsDaoMixin on DatabaseAccessor<AppDatabase> {
  $CouponsTable get coupons => attachedDatabase.coupons;
  CouponsDaoManager get managers => CouponsDaoManager(this);
}

class CouponsDaoManager {
  final _$CouponsDaoMixin _db;
  CouponsDaoManager(this._db);
  $$CouponsTableTableManager get coupons =>
      $$CouponsTableTableManager(_db.attachedDatabase, _db.coupons);
}
