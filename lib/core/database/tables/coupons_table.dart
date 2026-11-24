
import 'package:drift/drift.dart';

@DataClassName('CouponDb')
class Coupons extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get code => text().unique()();

  TextColumn get discountType =>
      text().withDefault(const Constant('percentage'))();

  RealColumn get value => real()();

  IntColumn get usageLimit => integer().nullable()();

  IntColumn get usedCount =>
      integer().withDefault(const Constant(0))();

  RealColumn get minimumOrderAmount =>
      real().withDefault(const Constant(0.0))();

  DateTimeColumn get expiresAt => dateTime().nullable()();

  BoolColumn get isActive =>
      boolean().withDefault(const Constant(true))();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  List<String> get customConstraints => [
        'CHECK (value >= 0)',
        'CHECK (used_count >= 0)',
        'CHECK (minimum_order_amount >= 0)',
        'CHECK (usage_limit IS NULL OR usage_limit >= 0)',
      ];
}
