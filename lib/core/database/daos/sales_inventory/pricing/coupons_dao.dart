
import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../tables/sales_inventory/pricing/coupons_table.dart';


part 'coupons_dao.g.dart';

@DriftAccessor(tables: [Coupons])
class CouponsDao extends DatabaseAccessor<AppDatabase>
    with _$CouponsDaoMixin {
  CouponsDao(super.db);

  Future<List<CouponDb>> getAll() {
    return (select(coupons)
          ..orderBy([
            (t) => OrderingTerm.desc(t.id),
          ]))
        .get();
  }

  Stream<List<CouponDb>> watchAll() {
    return select(coupons).watch();
  }

  Future<CouponDb?> getById(int id) {
    return (select(coupons)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Future<CouponDb?> getByCode(String code) {
    final normalized = code.trim().toUpperCase();

    return (select(coupons)
          ..where((t) => t.code.equals(normalized)))
        .getSingleOrNull();
  }

  Future<List<CouponDb>> getActiveCoupons() {
    final now = DateTime.now();

    return (select(coupons)
          ..where((t) =>
              t.isActive.equals(true) &
              (t.startsAt.isNull() |
                  t.startsAt.isSmallerOrEqualValue(now)) &
              (t.expiresAt.isNull() |
                  t.expiresAt.isBiggerOrEqualValue(now)))
          ..orderBy([
            (t) => OrderingTerm.desc(t.id),
          ]))
        .get();
  }

  // Validate coupon availability.
  Future<CouponDb?> validateCoupon(String code) async {
    final coupon = await getByCode(code);

    if (coupon == null) return null;

    final now = DateTime.now();

    if (!coupon.isActive) return null;

    if (coupon.startsAt != null &&
        now.isBefore(coupon.startsAt!)) {
      return null;
    }

    if (coupon.expiresAt != null &&
        now.isAfter(coupon.expiresAt!)) {
      return null;
    }

    if (coupon.usageLimit != null &&
        coupon.usageCount >= coupon.usageLimit!) {
      return null;
    }

    if (coupon.discountValue < 0) return null;

    if (coupon.discountType == 'percentage' &&
        coupon.discountValue > 100) {
      return null;
    }

    return coupon;
  }

  Future<List<CouponDb>> search(String query) {
    final value = '%${query.trim()}%';

    return (select(coupons)
          ..where((t) =>
              t.code.like(value) |
              t.name.like(value)))
        .get();
  }

  Future<int> insertCoupon(
    CouponsCompanion entry,
  ) async {
    _validate(entry);

    final normalized = entry.code.value.trim().toUpperCase();

    return into(coupons).insert(
      entry.copyWith(
        code: Value(normalized),
      ),
    );
  }

  Future<bool> updateCoupon(
    int id,
    CouponsCompanion entry,
  ) async {
    _validate(entry);

    final normalized = entry.code.present
        ? entry.code.value.trim().toUpperCase()
        : null;

    final affected = await (update(coupons)
          ..where((t) => t.id.equals(id)))
        .write(
      entry.copyWith(
        code: normalized == null
            ? entry.code
            : Value(normalized),
        updatedAt: Value(DateTime.now()),
      ),
    );

    return affected > 0;
  }

  Future<bool> setActive(int id, bool active) async {
    final affected = await (update(coupons)
          ..where((t) => t.id.equals(id)))
        .write(
      CouponsCompanion(
        isActive: Value(active),
        updatedAt: Value(DateTime.now()),
      ),
    );

    return affected > 0;
  }

  // Do not delete coupons that have usage history.
  Future<int> deleteCoupon(int id) {
    return (delete(coupons)
          ..where((t) => t.id.equals(id)))
        .go();
  }

  void _validate(CouponsCompanion entry) {
    if (entry.discountValue.present &&
        entry.discountValue.value < 0) {
      throw ArgumentError('Coupon discount cannot be negative.');
    }

    if (entry.discountType.present &&
        !['percentage', 'fixed']
            .contains(entry.discountType.value)) {
      throw ArgumentError('Invalid coupon discount type.');
    }

    if (entry.discountType.present &&
        entry.discountType.value == 'percentage' &&
        entry.discountValue.present &&
        entry.discountValue.value > 100) {
      throw ArgumentError('Coupon percentage cannot exceed 100%.');
    }

    if (entry.code.present &&
        entry.code.value.trim().isEmpty) {
      throw ArgumentError('Coupon code is required.');
    }
  }
}
