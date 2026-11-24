
import 'package:drift/drift.dart';

import 'products_table.dart';
import 'product_units_table.dart';

@DataClassName('ProductBarcodeDb')
class ProductBarcodes extends Table {
  IntColumn get id => integer().autoIncrement()();

  // Product Relationship
  IntColumn get productId => integer().references(
        Products,
        #id,
        onDelete: KeyAction.cascade,
      )();

  // Optional Unit Relationship
  IntColumn get productUnitId => integer()
      .nullable()
      .references(
        ProductUnits,
        #id,
        onDelete: KeyAction.restrict,
      )();

  // Globally unique barcode
  TextColumn get barcode => text()
      .unique()
      .withLength(
        min: 1,
        max: 100,
      )();

  // internal / external
  TextColumn get barcodeType =>
      text().withDefault(const Constant('internal'))();

  TextColumn get source => text().nullable()();

  // Default barcode for this product
  BoolColumn get isDefault =>
      boolean().withDefault(const Constant(false))();

  BoolColumn get isActive =>
      boolean().withDefault(const Constant(true))();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  List<String> get customConstraints => [
        'CHECK (barcodeType IN (\'internal\', \'external\'))',
      ];
}
