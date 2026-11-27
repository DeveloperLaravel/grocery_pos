
import 'package:drift/drift.dart';

import '../../../tables/master_data/products/product_units_table.dart';
import '../../../tables/master_data/products/products_table.dart';
import 'price_lists_table.dart';

@DataClassName('PriceListItemDb')
class PriceListItems extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get priceListId => integer().references(
    PriceLists,
    #id,
    onDelete: KeyAction.cascade,
  )();

  IntColumn get productId => integer().references(
    Products,
    #id,
    onDelete: KeyAction.cascade,
  )();

  // Null means the product base unit
  IntColumn get productUnitId => integer().nullable().references(
    ProductUnits,
    #id,
    onDelete: KeyAction.restrict,
  )();

  RealColumn get price => real()();

  RealColumn get minimumQuantity =>
      real().withDefault(const Constant(1))();

  RealColumn get maximumQuantity => real().nullable()();

  DateTimeColumn get startsAt => dateTime().nullable()();

  DateTimeColumn get endsAt => dateTime().nullable()();

  BoolColumn get isActive =>
      boolean().withDefault(const Constant(true))();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().nullable()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {priceListId, productId, productUnitId},
  ];

  @override
  List<String> get customConstraints => [
    'CHECK (price >= 0)',
    'CHECK (minimum_quantity > 0)',
    'CHECK (maximum_quantity IS NULL OR maximum_quantity >= minimum_quantity)',
    'CHECK (ends_at IS NULL OR starts_at IS NULL OR ends_at >= starts_at)',
  ];
}
