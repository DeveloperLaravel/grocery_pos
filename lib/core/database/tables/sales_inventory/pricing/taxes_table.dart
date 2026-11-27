
import 'package:drift/drift.dart';

@DataClassName('TaxDb')
class Taxes extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 1, max: 100)();

  TextColumn get code => text().nullable().withLength(max: 30)();

  // percentage / fixed
  TextColumn get taxType => text()
      .withDefault(const Constant('percentage'))();

  // Tax percentage or fixed amount
  RealColumn get rate => real()();

  // Is tax included in product price?
  BoolColumn get isInclusive =>
      boolean().withDefault(const Constant(false))();

  BoolColumn get isCompound =>
      boolean().withDefault(const Constant(false))();

  BoolColumn get isDefault =>
      boolean().withDefault(const Constant(false))();

  BoolColumn get isActive =>
      boolean().withDefault(const Constant(true))();

  TextColumn get description => text().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().nullable()();

  @override
  List<String> get customConstraints => [
    'CHECK (rate >= 0)',
    "CHECK (taxType IN ('percentage', 'fixed'))",
  ];
}
