
import 'package:drift/drift.dart';

import 'coupons_table.dart';
import 'sales_inventory/sales/sales_table.dart';
import 'master_data/parties/customers_table.dart';

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
        onDelete: KeyAction.restrict,
      )();

  IntColumn get customerId => integer()
      .nullable()
      .references(
        Customers,
        #id,
        onDelete: KeyAction.setNull,
      )();

  RealColumn get discountAmount => real()();

  DateTimeColumn get usedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  List<String> get customConstraints => [
        'CHECK (discount_amount >= 0)',
      ];
}
