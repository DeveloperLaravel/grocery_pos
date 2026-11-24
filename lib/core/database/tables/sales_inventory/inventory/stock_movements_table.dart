
import 'package:drift/drift.dart';

import '../../inventory/stores_table.dart';
import '../../master_data/products/products_table.dart';

@DataClassName('StockMovementDb')
class StockMovements extends Table {
  IntColumn get id => integer().autoIncrement()();

  // Product and Store
  IntColumn get productId => integer()
      .references(Products, #id)();

  IntColumn get storeId => integer()
      .references(Stores, #id)();

  // Movement information
  TextColumn get movementType => text().withLength(
        min: 1,
        max: 30,
      )();

  // purchase, sale, return, transfer, adjustment, count
  TextColumn get referenceType => text().withLength(
        min: 1,
        max: 40,
      )();

  // ID of the source document
  IntColumn get referenceId => integer()();

  // Optional source document item
  IntColumn get referenceItemId =>
      integer().nullable()();

  // Quantity is always stored in base units
  RealColumn get quantityIn =>
      real().withDefault(const Constant(0))();

  RealColumn get quantityOut =>
      real().withDefault(const Constant(0))();

  // Quantity after this movement
  RealColumn get balanceAfter => real()();

  // Cost per base unit
  RealColumn get unitCost =>
      real().withDefault(const Constant(0))();

  // Total movement value
  RealColumn get totalCost =>
      real().withDefault(const Constant(0))();

  TextColumn get notes => text().nullable()();

  // Audit
  IntColumn get createdBy => integer().nullable()();

  DateTimeColumn get movementDate => dateTime()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  List<Set<Column>> get uniqueKeys => [];

  @override
  List<String> get customConstraints => [
    'CHECK (quantityIn >= 0)',
    'CHECK (quantityOut >= 0)',
    'CHECK (NOT (quantityIn > 0 AND quantityOut > 0))',
    'CHECK (unitCost >= 0)',
    'CHECK (totalCost >= 0)',
  ];
}
