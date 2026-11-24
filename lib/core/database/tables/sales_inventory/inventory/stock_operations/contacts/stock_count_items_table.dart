
import 'package:drift/drift.dart';

import '../../../../master_data/products/product_units_table.dart';
import '../../../../master_data/products/products_table.dart';
import 'stock_counts_table.dart';

@DataClassName('StockCountItemDb')
class StockCountItems extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get stockCountId => integer()
      .references(StockCounts, #id)();

  IntColumn get productId => integer()
      .references(Products, #id)();

  IntColumn get productUnitId => integer()
      .nullable()
      .references(ProductUnits, #id)();

  // Balance recorded when the item was added to the count
  RealColumn get systemQuantity => real()();

  // Actual physical counted quantity
  RealColumn get countedQuantity =>
      real().nullable()();

  // Difference = countedQuantity - systemQuantity
  RealColumn get differenceQuantity =>
      real().nullable()();

  RealColumn get unitCost =>
      real().withDefault(const Constant(0))();

  // Whether this item was physically counted
  BoolColumn get isCounted =>
      boolean().withDefault(const Constant(false))();

  TextColumn get notes => text().nullable()();

  DateTimeColumn get countedAt => dateTime().nullable()();

  @override
  List<String> get customConstraints => [
    'CHECK (systemQuantity >= 0)',
    'CHECK (countedQuantity IS NULL OR countedQuantity >= 0)',
    'CHECK (unitCost >= 0)',
  ];
}
