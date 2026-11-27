
import 'package:drift/drift.dart';

import 'stock_counts_table.dart';
import '../../master_data/products/products_table.dart';
import '../../master_data/products/product_units_table.dart';

@DataClassName('StockCountItemDb')
class StockCountItems extends Table {
  // Primary Key
  IntColumn get id => integer().autoIncrement()();

  // Count Relationship
  IntColumn get countId => integer().references(
        StockCounts,
        #id,
        onDelete: KeyAction.cascade,
      )();

  // Product Relationship
  IntColumn get productId => integer().references(
        Products,
        #id,
        onDelete: KeyAction.restrict,
      )();

  // Selected Unit
  IntColumn get productUnitId => integer()
      .nullable()
      .references(
        ProductUnits,
        #id,
        onDelete: KeyAction.setNull,
      )();

  // Unit Snapshot
  TextColumn get unitName => text().withLength(
        min: 1,
        max: 100,
      )();

  // Conversion Factor
  RealColumn get conversionFactor =>
      real().withDefault(const Constant(1))();

  // System Quantity Snapshot (Base Unit)
  RealColumn get systemQuantity => real()();

  // Quantity Entered by Employee
  RealColumn get countedEnteredQuantity => real().nullable()();

  // Actual Counted Quantity (Base Unit)
  RealColumn get countedQuantity => real().nullable()();

  // Difference = Counted - System
  // Positive = Surplus
  // Negative = Shortage
  RealColumn get difference => real().nullable()();

  // Cost Snapshot
  RealColumn get unitCost =>
      real().withDefault(const Constant(0))();

  // Notes
  TextColumn get note => text().nullable()();

  // Counting Information
  DateTimeColumn get countedAt => dateTime().nullable()();

  TextColumn get countedBy => text().nullable()();

  // Timestamps
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  List<Set<Column>> get uniqueKeys => [
        {countId, productId},
      ];

  @override
  List<String> get customConstraints => [
        'CHECK (conversion_factor > 0)',
        'CHECK (system_quantity >= 0)',
        'CHECK (counted_entered_quantity IS NULL OR counted_entered_quantity >= 0)',
        'CHECK (counted_quantity IS NULL OR counted_quantity >= 0)',
        'CHECK (unit_cost >= 0)',
      ];
}
