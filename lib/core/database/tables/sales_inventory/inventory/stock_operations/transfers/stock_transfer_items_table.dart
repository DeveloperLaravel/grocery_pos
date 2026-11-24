
import 'package:drift/drift.dart';

import '../../../../master_data/products/product_units_table.dart';
import '../../../../master_data/products/products_table.dart';
import 'stock_transfers_table.dart';

@DataClassName('StockTransferItemDb')
class StockTransferItems extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get transferId => integer()
      .references(StockTransfers, #id)();

  IntColumn get productId => integer()
      .references(Products, #id)();

  IntColumn get productUnitId => integer()
      .nullable()
      .references(ProductUnits, #id)();

  // Always base unit
  RealColumn get quantity => real()();

  RealColumn get enteredQuantity =>
      real().withDefault(const Constant(0))();

  RealColumn get conversionFactor =>
      real().withDefault(const Constant(1))();

  RealColumn get unitCost =>
      real().withDefault(const Constant(0))();

  TextColumn get notes => text().nullable()();

  @override
  List<String> get customConstraints => [
    'CHECK (quantity > 0)',
    'CHECK (enteredQuantity >= 0)',
    'CHECK (conversionFactor > 0)',
    'CHECK (unitCost >= 0)',
  ];
}
