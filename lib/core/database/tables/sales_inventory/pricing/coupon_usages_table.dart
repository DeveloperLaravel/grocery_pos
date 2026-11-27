
import 'package:drift/drift.dart';

import '../../../tables/master_data/parties/customers_table.dart';
import '../sales/sales_table.dart';
import 'coupons_table.dart';

@DataClassName('CouponUsageDb')
class CouponUsages extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get couponId => integer().references(
    Coupons,
    #id,
    onDelete: KeyAction.restrict,
  )();

  IntColumn get saleId => integer().references(
    Sales,
    #id,
    onDelete: KeyAction.cascade,
  )();

  IntColumn get customerId => integer().nullable().references(
    Customers,
    #id,
    onDelete: KeyAction.setNull,
  )();

  // Snapshot
  TextColumn get couponCode => text()();

  RealColumn get discountAmount => real()();

  DateTimeColumn get usedAt =>
      dateTime().withDefault(currentDateAndTime)();

  TextColumn get status =>
      text().withDefault(const Constant('used'))();

  @override
  List<String> get customConstraints => [
    'UNIQUE(coupon_id, sale_id)',
    'CHECK (discountAmount >= 0)',
    "CHECK (status IN ('used', 'reversed'))",
  ];
}
