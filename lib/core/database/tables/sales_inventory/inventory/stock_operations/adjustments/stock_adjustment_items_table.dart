
import 'package:drift/drift.dart';

import '../../../../../../stock_adjustments_table.dart';
import '../../../../master_data/products/product_units_table.dart';
import '../../../../master_data/products/products_table.dart';

@DataClassName('StockAdjustmentItemDb')
class StockAdjustmentItems extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get adjustmentId => integer()
      .references(StockAdjustments, #id)();

  IntColumn get productId => integer()
      .references(Products, #id)();

  IntColumn get productUnitId => integer()
      .nullable()
      .references(ProductUnits, #id)();

  // Quantity currently in stock
  RealColumn get systemQuantity => real()();

  // Quantity to add or remove
  RealColumn get adjustmentQuantity => real()();

  // Cost per base unit
  RealColumn get unitCost =>
      real().withDefault(const Constant(0))();

  TextColumn get reason => text().nullable()();

  TextColumn get notes => text().nullable()();

  @override
  List<String> get customConstraints => [
    'CHECK (systemQuantity >= 0)',
    'CHECK (adjustmentQuantity != 0)',
    'CHECK (unitCost >= 0)',
  ];
}
