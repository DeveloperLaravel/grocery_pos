
import 'package:drift/drift.dart';

import 'products_table.dart';

@DataClassName('ProductUnitDb')
class ProductUnits extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get productId => integer().references(
        Products,
        #id,
        onDelete: KeyAction.cascade,
      )();

  // Unit name
  TextColumn get name => text().withLength(
        min: 1,
        max: 100,
      )();

  // Conversion to base unit
  // Piece = 1, Box = 12, Carton = 144
  RealColumn get conversionFactor =>
      real().withDefault(const Constant(1.0))();

  BoolColumn get isBaseUnit =>
      boolean().withDefault(const Constant(false))();

  BoolColumn get isActive =>
      boolean().withDefault(const Constant(true))();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  List<Set<Column>> get uniqueKeys => [
        {productId, name},
      ];

  @override
  List<String> get customConstraints => [
        'CHECK (conversionFactor > 0)',
      ];
}
