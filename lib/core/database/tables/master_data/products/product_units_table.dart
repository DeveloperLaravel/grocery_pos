
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

  TextColumn get unitName => text().withLength(
        min: 1,
        max: 100,
      )();

  RealColumn get conversionFactor =>
      real().withDefault(const Constant(1.0))();

  RealColumn get costPrice =>
      real().withDefault(const Constant(0.0))();

  RealColumn get salePrice =>
      real().withDefault(const Constant(0.0))();

  BoolColumn get isBaseUnit =>
      boolean().withDefault(const Constant(false))();

  BoolColumn get isDefault =>
      boolean().withDefault(const Constant(false))();

  BoolColumn get isActive =>
      boolean().withDefault(const Constant(true))();

  IntColumn get sortOrder =>
      integer().withDefault(const Constant(0))();

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
        'CHECK (conversion_factor > 0)',
        'CHECK (cost_price >= 0)',
        'CHECK (sale_price >= 0)',
        'CHECK (sort_order >= 0)',
      ];
}
