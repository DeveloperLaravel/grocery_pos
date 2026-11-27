
import 'package:drift/drift.dart';

import '../sales/sale_items_table.dart';
import 'returns_table.dart';
import '../../master_data/products/products_table.dart';
import '../../master_data/products/product_units_table.dart';

@DataClassName('ReturnItemDb')
class ReturnItems extends Table {
  // =====================================================
  // 1. Primary Key
  // =====================================================

  IntColumn get id => integer().autoIncrement()();

  // =====================================================
  // 2. Relationships
  // =====================================================

  IntColumn get returnId => integer().references(
        Returns,
        #id,
        onDelete: KeyAction.cascade,
      )();

  IntColumn get saleItemId => integer().references(
        SaleItems,
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

  TextColumn get productName => text().withLength(
        min: 1,
        max: 200,
      )();

  TextColumn get unitName => text().withLength(
        min: 1,
        max: 100,
      )();

  // =====================================================
  // 4. Returned Quantities
  // =====================================================

  RealColumn get quantity => real()();

  RealColumn get conversionFactor =>
      real().withDefault(const Constant(1.0))();

  RealColumn get baseQuantity => real()();

  TextColumn get baseUnit => text().withLength(
        min: 1,
        max: 30,
      )();

  // =====================================================
  // 5. Original Sale Price Snapshot
  // =====================================================

  RealColumn get unitPrice => real()();

  RealColumn get originalQuantity => real()();

  RealColumn get originalBaseQuantity => real()();

  // =====================================================
  // 6. Discounts
  // =====================================================

  RealColumn get discountPercentage =>
      real().withDefault(const Constant(0.0))();

  RealColumn get discountAmount =>
      real().withDefault(const Constant(0.0))();

  // =====================================================
  // 7. Taxes
  // =====================================================

  RealColumn get taxPercentage =>
      real().withDefault(const Constant(0.0))();

  RealColumn get taxAmount =>
      real().withDefault(const Constant(0.0))();

  // =====================================================
  // 8. Financial Calculations
  // =====================================================

  RealColumn get subtotal => real()();

  RealColumn get totalAmount => real()();

  // =====================================================
  // 9. Product Condition
  // =====================================================

  TextColumn get itemCondition => text()
      .withDefault(const Constant('good'))
      .customConstraint(
        "CHECK (item_condition IN "
        "('good', 'damaged', 'expired', 'defective', 'opened', 'other'))",
      )();

  // =====================================================
  // 10. Inventory Disposition
  // =====================================================

  TextColumn get inventoryDisposition => text()
      .withDefault(const Constant('restock'))
      .customConstraint(
        "CHECK (inventory_disposition IN "
        "('restock', 'damaged', 'scrapped', 'inspection'))",
      )();

  BoolColumn get addedToStock =>
      boolean().withDefault(const Constant(false))();

  // =====================================================
  // 11. Return Reason
  // =====================================================

  TextColumn get reason => text().nullable()();

  TextColumn get notes => text().nullable()();

  // =====================================================
  // 12. Audit Information
  // =====================================================

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  List<String> get customConstraints => [
        'CHECK (quantity > 0)',
        'CHECK (conversion_factor > 0)',
        'CHECK (base_quantity > 0)',
        'CHECK (unit_price >= 0)',
        'CHECK (original_quantity > 0)',
        'CHECK (original_base_quantity > 0)',
        'CHECK (discount_percentage >= 0 AND discount_percentage <= 100)',
        'CHECK (discount_amount >= 0)',
        'CHECK (tax_percentage >= 0)',
        'CHECK (tax_amount >= 0)',
        'CHECK (subtotal >= 0)',
        'CHECK (total_amount >= 0)',
      ];
}
