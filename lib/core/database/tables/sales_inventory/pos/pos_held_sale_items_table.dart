
import 'package:drift/drift.dart';

import 'pos_held_sales_table.dart';
import '../../master_data/products/products_table.dart';
import '../../master_data/products/product_units_table.dart';

@DataClassName('PosHeldSaleItemDb')
class PosHeldSaleItems extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get heldSaleId => integer().references(
        PosHeldSales,
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

  TextColumn get productName => text()();

  TextColumn get barcode => text().nullable()();

  TextColumn get unitName =>
      text().withDefault(const Constant('piece'))();

  RealColumn get quantity => real()();

  RealColumn get conversionFactor =>
      real().withDefault(const Constant(1.0))();

  RealColumn get baseQuantity => real()();

  RealColumn get unitPrice => real()();

  RealColumn get costPrice => real()();

  RealColumn get discount =>
      real().withDefault(const Constant(0.0))();

  RealColumn get tax =>
      real().withDefault(const Constant(0.0))();

  RealColumn get total => real()();

  @override
  List<String> get customConstraints => [
        'CHECK (quantity > 0)',
        'CHECK (conversion_factor > 0)',
        'CHECK (base_quantity > 0)',
        'CHECK (unit_price >= 0)',
        'CHECK (cost_price >= 0)',
        'CHECK (discount >= 0)',
        'CHECK (tax >= 0)',
        'CHECK (total >= 0)',
      ];
}
