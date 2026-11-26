
import 'package:drift/drift.dart';

import 'purchase_orders_table.dart';
import '../../master_data/products/products_table.dart';
import '../../master_data/products/product_units_table.dart';

@DataClassName('PurchaseItemDb')
class PurchaseItems extends Table {
  // =====================================================
  // 1. Primary Key
  // =====================================================

  IntColumn get id => integer().autoIncrement()();

  // =====================================================
  // 2. Relationships
  // =====================================================

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

  // =====================================================
  // 3. Product Snapshot
  // =====================================================

  TextColumn get productName => text()
      .withLength(min: 1, max: 200)();

  TextColumn get unitName => text()
      .withDefault(const Constant('piece'))
      .withLength(min: 1, max: 50)();

  // =====================================================
  // 4. Quantity
  // =====================================================

  RealColumn get quantity => real()();

  RealColumn get conversionFactor =>
      real().withDefault(const Constant(1.0))();

  RealColumn get baseQuantity => real()();

  // =====================================================
  // 5. Pricing
  // =====================================================

  RealColumn get unitPrice => real()();

  RealColumn get baseUnitCost => real()();

  RealColumn get total => real()();

  // =====================================================
  // 6. Additional Information
  // =====================================================

  TextColumn get notes => text().nullable()();

  // =====================================================
  // 7. Constraints
  // =====================================================

  @override
  List<String> get customConstraints => [
        'CHECK (quantity > 0)',
        'CHECK (conversion_factor > 0)',
        'CHECK (base_quantity > 0)',
        'CHECK (unit_price >= 0)',
        'CHECK (base_unit_cost >= 0)',
        'CHECK (total >= 0)',
      ];
}
