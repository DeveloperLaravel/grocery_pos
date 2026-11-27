
import 'package:drift/drift.dart';

import 'discount_rules_table.dart';

@DataClassName('CouponDb')
class Coupons extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get discountRuleId => integer().nullable().references(
    DiscountRules,
    #id,
    onDelete: KeyAction.setNull,
  )();

  TextColumn get code =>
      text().withLength(min: 1, max: 50)();

  TextColumn get name =>
      text().withLength(min: 1, max: 150)();

  // percentage / fixed
  TextColumn get discountType =>
      text().withDefault(const Constant('percentage'))();

  RealColumn get discountValue => real()();

  RealColumn get minimumPurchase =>
      real().withDefault(const Constant(0))();

  RealColumn get maximumDiscount => real().nullable()();

  IntColumn get usageLimit => integer().nullable()();

  IntColumn get usageLimitPerCustomer =>
      integer().nullable()();

  IntColumn get usageCount =>
      integer().withDefault(const Constant(0))();

  DateTimeColumn get startsAt => dateTime().nullable()();

  DateTimeColumn get expiresAt => dateTime().nullable()();

  BoolColumn get isActive =>
      boolean().withDefault(const Constant(true))();

  TextColumn get description => text().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().nullable()();

  @override
  List<String> get customConstraints => [
    'UNIQUE(code)',
    "CHECK (discountType IN ('percentage', 'fixed'))",
    'CHECK (discountValue >= 0)',
    'CHECK (minimumPurchase >= 0)',
    'CHECK (usageCount >= 0)',
    'CHECK (usageLimit IS NULL OR usageLimit >= 0)',
    'CHECK (usageLimitPerCustomer IS NULL OR usageLimitPerCustomer >= 0)',
    'CHECK (maximumDiscount IS NULL OR maximumDiscount >= 0)',
    'CHECK (expiresAt IS NULL OR startsAt IS NULL OR expiresAt >= startsAt)',
  ];
}
