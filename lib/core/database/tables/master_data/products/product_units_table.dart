
import 'package:drift/drift.dart';

import 'products_table.dart';

@DataClassName('ProductUnitDb')
class ProductUnits extends Table {
  IntColumn get id => integer().autoIncrement()();

  // Product relationship
  IntColumn get productId => integer().references(
        Products,
        #id,
        onDelete: KeyAction.cascade,
      )();

  // Unit name
  TextColumn get unitName => text().withLength(
        min: 1,
        max: 100,
      )();

  // Conversion to base unit
  // Piece = 1, Box = 12, Carton = 144
  RealColumn get conversionFactor =>
      real().withDefault(const Constant(1.0))();

  // Unit prices
  RealColumn get costPrice =>
      real().withDefault(const Constant(0.0))();

  RealColumn get salePrice =>
      real().withDefault(const Constant(0.0))();

  // Base unit
  BoolColumn get isBaseUnit =>
      boolean().withDefault(const Constant(false))();

  // Default selling unit
  BoolColumn get isDefault =>
      boolean().withDefault(const Constant(false))();

  // Status
  BoolColumn get isActive =>
      boolean().withDefault(const Constant(true))();

  // Sorting
  IntColumn get sortOrder =>
      integer().withDefault(const Constant(0))();

  // Timestamps
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  List<Set<Column>> get uniqueKeys => [
        {productId, unitName},
      ];

  @override
  List<String> get customConstraints => [
        'CHECK (conversionFactor > 0)',
        'CHECK (costPrice >= 0)',
        'CHECK (salePrice >= 0)',
        'CHECK (sortOrder >= 0)',
      ];
}
