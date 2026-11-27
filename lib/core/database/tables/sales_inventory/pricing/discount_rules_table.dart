
import 'package:drift/drift.dart';

import '../../../tables/master_data/products/products_table.dart';


@DataClassName('DiscountRuleDb')
class DiscountRules extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name =>
      text().withLength(min: 1, max: 150)();

  TextColumn get code =>
      text().nullable().withLength(max: 50)();

  // percentage / fixed
  TextColumn get discountType =>
      text().withDefault(const Constant('percentage'))();

  // invoice / product / category
  TextColumn get appliesTo =>
      text().withDefault(const Constant('invoice'))();

  IntColumn get productId => integer().nullable().references(
    Products,
    #id,
    onDelete: KeyAction.setNull,
  )();

  RealColumn get discountValue => real()();

  RealColumn get minimumAmount =>
      real().withDefault(const Constant(0))();

  RealColumn get maximumDiscount => real().nullable()();

  RealColumn get minimumQuantity =>
      real().withDefault(const Constant(0))();

  BoolColumn get allowWithOtherDiscounts =>
      boolean().withDefault(const Constant(false))();

  DateTimeColumn get startsAt => dateTime().nullable()();

  DateTimeColumn get endsAt => dateTime().nullable()();

  IntColumn get priority =>
      integer().withDefault(const Constant(0))();

  BoolColumn get isActive =>
      boolean().withDefault(const Constant(true))();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().nullable()();

  @override
  List<String> get customConstraints => [
    "CHECK (discountType IN ('percentage', 'fixed'))",
    "CHECK (appliesTo IN ('invoice', 'product', 'category'))",
    'CHECK (discountValue >= 0)',
    'CHECK (minimumAmount >= 0)',
    'CHECK (maximumDiscount IS NULL OR maximumDiscount >= 0)',
    'CHECK (minimumQuantity >= 0)',
    'CHECK (endsAt IS NULL OR startsAt IS NULL OR endsAt >= startsAt)',
  ];
}
