
import 'package:drift/drift.dart';

import '../../master_data/products/product_units_table.dart';
import '../../master_data/products/products_table.dart';
import 'stores_table.dart';

@DataClassName('StockMovementDb')
class StockMovements extends Table {
  // =====================================================
  // Primary Key
  // =====================================================

  IntColumn get id => integer().autoIncrement()();

  // =====================================================
  // Relations
  // =====================================================

  IntColumn get storeId => integer().references(
        Stores,
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
  // Movement Information
  // =====================================================

  // Example: MOV-000001
  TextColumn get movementNumber =>
      text().nullable().unique().withLength(max: 50)();

  // in / out / sale / purchase / return /
  // adjustment / transfer_in / transfer_out
  TextColumn get movementType => text().withLength(
        min: 2,
        max: 30,
      )();

  TextColumn get referenceType =>
      text().nullable().withLength(max: 50)();

  IntColumn get referenceId => integer().nullable()();

  // =====================================================
  // Quantity Information
  // =====================================================

  // Quantity entered by the user
  RealColumn get enteredQuantity => real()();

  // Conversion factor to base unit
  RealColumn get conversionFactor =>
      real().withDefault(const Constant(1))();

  // Quantity converted to base unit
  RealColumn get quantity => real()();

  // Snapshot of the unit name at movement time
  TextColumn get unitName => text().withLength(
        min: 1,
        max: 100,
      )();

  // =====================================================
  // Stock Before / After
  // =====================================================

  RealColumn get previousQuantity => real()();

  RealColumn get newQuantity => real()();

  // =====================================================
  // Cost Information
  // =====================================================

  RealColumn get unitCost =>
      real().withDefault(const Constant(0))();

  RealColumn get totalCost =>
      real().withDefault(const Constant(0))();

  // =====================================================
  // Additional Information
  // =====================================================

  TextColumn get note => text().nullable()();

  TextColumn get createdBy =>
      text().nullable().withLength(max: 100)();

  // =====================================================
  // Timestamps
  // =====================================================

  DateTimeColumn get movementDate =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
  // =====================================================
  // Constraints
  // =====================================================

  @override
  List<String> get customConstraints => [
        // Valid movement types
        '''
        CHECK (
          movement_type IN (
            'in',
            'out',
            'sale',
            'purchase',
            'return',
            'adjustment',
            'transfer_in',
            'transfer_out'
          )
        )
        ''',

        // Quantity validation
        'CHECK (entered_quantity > 0)',
        'CHECK (conversion_factor > 0)',
        'CHECK (quantity > 0)',

        // Stock validation
        'CHECK (previous_quantity >= 0)',
        'CHECK (new_quantity >= 0)',

        // Cost validation
        'CHECK (unit_cost >= 0)',
        'CHECK (total_cost >= 0)',

        // Reference validation
        'CHECK (reference_id IS NULL OR reference_id > 0)',
      ];
}
