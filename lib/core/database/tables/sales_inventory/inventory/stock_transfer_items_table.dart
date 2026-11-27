
import 'package:drift/drift.dart';

import 'stock_transfers_table.dart';
import '../../master_data/products/products_table.dart';
import '../../master_data/products/product_units_table.dart';

@DataClassName('StockTransferItemDb')
class StockTransferItems extends Table {
  // Primary Key
  IntColumn get id => integer().autoIncrement()();

  // Transfer Relationship
  IntColumn get transferId => integer().references(
        StockTransfers,
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

  // Entered Quantity
  RealColumn get enteredQuantity => real()();

  // Conversion to Base Unit
  RealColumn get conversionFactor =>
      real().withDefault(const Constant(1))();

  // Quantity in Base Unit
  RealColumn get baseQuantity => real()();

  // Quantity Actually Shipped (Base Unit)
  RealColumn get shippedQuantity =>
      real().withDefault(const Constant(0))();

  // Quantity Actually Received (Base Unit)
  RealColumn get receivedQuantity =>
      real().withDefault(const Constant(0))();

  // Cost Snapshot
  RealColumn get unitCost =>
      real().withDefault(const Constant(0))();

  RealColumn get totalCost =>
      real().withDefault(const Constant(0))();

  // Additional Information
  TextColumn get note => text().nullable()();

  // Timestamps
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  List<Set<Column>> get uniqueKeys => [
        {transferId, productId},
      ];

  @override
  List<String> get customConstraints => [
        'CHECK (entered_quantity > 0)',
        'CHECK (conversion_factor > 0)',
        'CHECK (base_quantity > 0)',
        'CHECK (shipped_quantity >= 0)',
        'CHECK (received_quantity >= 0)',
        'CHECK (shipped_quantity <= base_quantity)',
        'CHECK (received_quantity <= shipped_quantity)',
        'CHECK (unit_cost >= 0)',
        'CHECK (total_cost >= 0)',
      ];
}
