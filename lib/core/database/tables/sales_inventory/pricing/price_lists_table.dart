
import 'package:drift/drift.dart';

import '../../../tables/master_data/parties/customers_table.dart';

@DataClassName('PriceListDb')
class PriceLists extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name =>
      text().withLength(min: 1, max: 150)();

  TextColumn get code =>
      text().nullable().withLength(max: 50)();

  TextColumn get description => text().nullable()();

  // retail / wholesale / special / promotional
  TextColumn get listType =>
      text().withDefault(const Constant('retail'))();

  // Optional customer-specific price list
  IntColumn get customerId => integer().nullable().references(
    Customers,
    #id,
    onDelete: KeyAction.setNull,
  )();

  BoolColumn get isDefault =>
      boolean().withDefault(const Constant(false))();

  BoolColumn get isActive =>
      boolean().withDefault(const Constant(true))();

  DateTimeColumn get startsAt => dateTime().nullable()();

  DateTimeColumn get endsAt => dateTime().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().nullable()();

  @override
  List<String> get customConstraints => [
    'UNIQUE(code)',
    "CHECK (list_type IN ('retail', 'wholesale', 'special', 'promotional'))",
    'CHECK (ends_at IS NULL OR starts_at IS NULL OR ends_at >= starts_at)',
  ];
}
