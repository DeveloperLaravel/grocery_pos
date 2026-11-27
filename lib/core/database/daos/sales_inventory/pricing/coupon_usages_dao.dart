
import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../tables/sales_inventory/pricing/coupon_usages_table.dart';
import '../../../tables/sales_inventory/pricing/coupons_table.dart';


part 'coupon_usages_dao.g.dart';

@DriftAccessor(tables: [CouponUsages, Coupons])
class CouponUsagesDao extends DatabaseAccessor<AppDatabase>
    with _$CouponUsagesDaoMixin {
  CouponUsagesDao(super.db);

  Future<List<CouponUsageDb>> getAll() {
    return (select(couponUsages)
          ..orderBy([
            (t) => OrderingTerm.desc(t.usedAt),
          ]))
        .get();
  }

  Future<List<CouponUsageDb>> getByCoupon(int couponId) {
    return (select(couponUsages)
          ..where((t) => t.couponId.equals(couponId))
          ..orderBy([
            (t) => OrderingTerm.desc(t.usedAt),
          ]))
        .get();
  }

  Future<List<CouponUsageDb>> getBySale(int saleId) {
    return (select(couponUsages)
          ..where((t) => t.saleId.equals(saleId)))
        .get();
  }

  Future<List<CouponUsageDb>> getByCustomer(int customerId) {
    return (select(couponUsages)
          ..where((t) =>
              t.customerId.equals(customerId) &
              t.status.equals('used'))
          ..orderBy([
            (t) => OrderingTerm.desc(t.usedAt),
          ]))
        .get();
  }

  Stream<List<CouponUsageDb>> watchByCoupon(int couponId) {
    return (select(couponUsages)
          ..where((t) => t.couponId.equals(couponId)))
        .watch();
  }

  Future<int> getCustomerUsageCount({
    required int couponId,
    required int customerId,
  }) async {
    final query = selectOnly(couponUsages)
      ..addColumns([couponUsages.id.count()])
      ..where(
        couponUsages.couponId.equals(couponId) &
        couponUsages.customerId.equals(customerId) &
        couponUsages.status.equals('used'),
      );

    final row = await query.getSingle();

    return row.read(couponUsages.id.count()) ?? 0;
  }

  Future<int> getTotalUsageCount(int couponId) async {
    final query = selectOnly(couponUsages)
      ..addColumns([couponUsages.id.count()])
      ..where(
        couponUsages.couponId.equals(couponId) &
        couponUsages.status.equals('used'),
      );

    final row = await query.getSingle();

    return row.read(couponUsages.id.count()) ?? 0;
  }

  // Register coupon usage and update counter atomically.
  Future<int> registerUsage(
    CouponUsagesCompanion entry,
  ) async {
    if (!entry.couponId.present ||
        !entry.saleId.present ||
        !entry.discountAmount.present ||
        !entry.couponCode.present) {
      throw ArgumentError('Required coupon usage fields are missing.');
    }

    if (entry.discountAmount.value < 0) {
      throw ArgumentError('Discount amount cannot be negative.');
    }

    return attachedDatabase.transaction(() async {
      final couponId = entry.couponId.value;

      final coupon = await (select(coupons)
            ..where((t) => t.id.equals(couponId)))
          .getSingleOrNull();

      if (coupon == null || !coupon.isActive) {
        throw StateError('Coupon is unavailable.');
      }

      final now = DateTime.now();

      if (coupon.startsAt != null &&
          now.isBefore(coupon.startsAt!)) {
        throw StateError('Coupon is not active yet.');
      }

      if (coupon.expiresAt != null &&
          now.isAfter(coupon.expiresAt!)) {
        throw StateError('Coupon has expired.');
      }

      final saleId = entry.saleId.value;

      // Prevent duplicate usage for the same sale.
      final existing = await (select(couponUsages)
            ..where((t) =>
                t.couponId.equals(couponId) &
                t.saleId.equals(saleId)))
          .getSingleOrNull();

      if (existing != null) {
        throw StateError('Coupon already used for this sale.');
      }

      final customerId = entry.customerId.present
          ? entry.customerId.value
          : null;

      if (coupon.usageLimit != null &&
          coupon.usageCount >= coupon.usageLimit!) {
        throw StateError('Coupon usage limit reached.');
      }

      if (customerId != null &&
          coupon.usageLimitPerCustomer != null) {
        final customerCount = await getCustomerUsageCount(
          couponId: couponId,
          customerId: customerId,
        );

        if (customerCount >= coupon.usageLimitPerCustomer!) {
          throw StateError(
            'Customer coupon usage limit reached.',
          );
        }
      }

      final id = await into(couponUsages).insert(
        entry.copyWith(
          couponCode: Value(coupon.code),
          status: const Value('used'),
          usedAt: Value(now),
        ),
      );

      await (update(coupons)
            ..where((t) => t.id.equals(couponId)))
          .write(
        CouponsCompanion(
          usageCount: Value(coupon.usageCount + 1),
          updatedAt: Value(now),
        ),
      );

      return id;
    });
  }

  // Reverse usage without deleting the history.
  Future<bool> reverseUsage(int usageId) async {
    return attachedDatabase.transaction(() async {
      final usage = await (select(couponUsages)
            ..where((t) => t.id.equals(usageId)))
          .getSingleOrNull();

      if (usage == null || usage.status == 'reversed') {
        return false;
      }

      await (update(couponUsages)
            ..where((t) => t.id.equals(usageId)))
          .write(
        CouponUsagesCompanion(
          status: const Value('reversed'),
        ),
      );

      final coupon = await (select(coupons)
            ..where((t) => t.id.equals(usage.couponId)))
          .getSingleOrNull();

      if (coupon != null && coupon.usageCount > 0) {
        await (update(coupons)
              ..where((t) => t.id.equals(coupon.id)))
            .write(
          CouponsCompanion(
            usageCount: Value(coupon.usageCount - 1),
            updatedAt: Value(DateTime.now()),
          ),
        );
      }

      return true;
    });
  }
}
