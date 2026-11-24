import 'package:drift/drift.dart';

import 'purchase_orders_table.dart';
import '../../master_data/products/products_table.dart';
import '../../master_data/products/product_units_table.dart';

@DataClassName('PurchaseItemDb')
class PurchaseItems extends Table {
  IntColumn get id => integer().autoIncrement()();

  // Relationships

  IntColumn get purchaseOrderId => integer().references(
        PurchaseOrders,
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

  // Product snapshot

  TextColumn get productName => text()();

  TextColumn get unitName =>
      text().withDefault(const Constant('piece'))();

  // Quantity

  RealColumn get quantity =>
      real().withDefault(const Constant(0.0))();

  RealColumn get conversionFactor =>
      real().withDefault(const Constant(1.0))();

  RealColumn get baseQuantity =>
      real().withDefault(const Constant(0.0))();

  // Pricing

  RealColumn get unitPrice =>
      real().withDefault(const Constant(0.0))();

  RealColumn get baseUnitCost =>
      real().withDefault(const Constant(0.0))();

  RealColumn get total =>
      real().withDefault(const Constant(0.0))();

  // Additional

  TextColumn get notes => text().nullable()();

  @override
  List<String> get customConstraints => [
        'CHECK (quantity > 0)',
        'CHECK (conversion_factor > 0)',
        'CHECK (unit_price >= 0)',
        'CHECK (base_quantity >= 0)',
        'CHECK (base_unit_cost >= 0)',
        'CHECK (total >= 0)',
      ];
}