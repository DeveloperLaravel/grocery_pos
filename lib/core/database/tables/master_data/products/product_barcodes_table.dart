import 'package:drift/drift.dart';

import 'products_table.dart';
import 'product_units_table.dart';

@DataClassName('ProductBarcodeDb')
class ProductBarcodes extends Table {
  // Primary Key
  IntColumn get id => integer().autoIncrement()();

  // Product relationship
  IntColumn get productId => integer().references(
        Products,
        #id,
        onDelete: KeyAction.cascade,
      )();

  // Optional product unit
  IntColumn get productUnitId => integer()
      .nullable()
      .references(
        ProductUnits,
        #id,
        onDelete: KeyAction.restrict,
      )();

  // Globally unique barcode
  TextColumn get barcode => text()
      .withLength(min: 1, max: 100)
      .unique()();

  // internal / external
  TextColumn get barcodeType => text()
      .withDefault(const Constant('internal'))();

  // Barcode source
  TextColumn get source => text().nullable()();

  // Default barcode
  BoolColumn get isDefault =>
      boolean().withDefault(const Constant(false))();

  // Active / Inactive
  BoolColumn get isActive =>
      boolean().withDefault(const Constant(true))();

  // Timestamps
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  List<String> get customConstraints => [
        "CHECK (barcodeType IN ('internal', 'external'))",
      ];
}