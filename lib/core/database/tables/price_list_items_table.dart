
import 'package:drift/drift.dart';

import 'price_lists_table.dart';
import 'master_data/products/products_table.dart';
import 'master_data/products/product_units_table.dart';

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
        onDelete: KeyAction.restrict,
      )();

  IntColumn get productUnitId => integer()
      .nullable()
      .references(
        ProductUnits,
        #id,
        onDelete: KeyAction.setNull,
      )();

  RealColumn get salePrice => real()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  List<Set<Column>> get uniqueKeys => [
        {priceListId, productId, productUnitId},
      ];

  @override
  List<String> get customConstraints => [
        'CHECK (sale_price >= 0)',
      ];
}
