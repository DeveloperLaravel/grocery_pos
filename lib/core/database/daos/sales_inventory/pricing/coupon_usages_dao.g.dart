// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_usages_dao.dart';

// ignore_for_file: type=lint
mixin _$CouponUsagesDaoMixin on DatabaseAccessor<AppDatabase> {
  $CouponUsagesTable get couponUsages => attachedDatabase.couponUsages;
  $CouponsTable get coupons => attachedDatabase.coupons;
  CouponUsagesDaoManager get managers => CouponUsagesDaoManager(this);
}

class CouponUsagesDaoManager {
  final _$CouponUsagesDaoMixin _db;
  CouponUsagesDaoManager(this._db);
  $$CouponUsagesTableTableManager get couponUsages =>
      $$CouponUsagesTableTableManager(_db.attachedDatabase, _db.couponUsages);
  $$CouponsTableTableManager get coupons =>
      $$CouponsTableTableManager(_db.attachedDatabase, _db.coupons);
}
