
import 'package:drift/drift.dart';

@DataClassName('DiscountRuleDb')
class DiscountRules extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get discountType =>
      text().withDefault(const Constant('percentage'))();

  RealColumn get value => real()();

  RealColumn get minAmount =>
      real().withDefault(const Constant(0.0))();

  RealColumn get maxDiscount =>
      real().withDefault(const Constant(0.0))();

  DateTimeColumn get startDate => dateTime().nullable()();

  DateTimeColumn get endDate => dateTime().nullable()();

  BoolColumn get isActive =>
      boolean().withDefault(const Constant(true))();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  List<String> get customConstraints => [
        'CHECK (value >= 0)',
        'CHECK (min_amount >= 0)',
        'CHECK (max_discount >= 0)',
      ];
}
