
import 'package:drift/drift.dart';

import 'purchase_orders_table.dart';
import '../../master_data/products/products_table.dart';
import '../../master_data/products/product_units_table.dart';

@DataClassName('PurchaseItemDb')
class PurchaseItems extends Table {
  // Primary Key
  IntColumn get id => integer().autoIncrement()();

  // Relationships
  IntColumn get purchaseOrderId => integer().references(
        PurchaseOrders,
        #id,
        onDelete: KeyAction.restrict,
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

  // Product Snapshot
  TextColumn get productName =>
      text().withLength(min: 1, max: 200)();

  TextColumn get unitName => text()
      .withDefault(const Constant('piece'))
      .withLength(min: 1, max: 50)();

  // Quantity
  RealColumn get quantity => real()();

  RealColumn get conversionFactor =>
      real().withDefault(const Constant(1.0))();

  RealColumn get baseQuantity => real()();

  // Pricing
  RealColumn get unitPrice => real()();

  RealColumn get baseUnitCost => real()();

  RealColumn get total => real()();

  // Additional
  TextColumn get notes => text().nullable()();

  @override
  List<String> get customConstraints => [
        'CHECK (quantity > 0)',
        'CHECK (conversionFactor > 0)',
        'CHECK (baseQuantity > 0)',
        'CHECK (unitPrice >= 0)',
        'CHECK (baseUnitCost >= 0)',
        'CHECK (total >= 0)',
      ];
}
