
import 'package:drift/drift.dart';

import '../master_data/products/products_table.dart';
import 'stores_table.dart';

@DataClassName('ProductStockDb')
class ProductStocks extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get productId => integer().references(
        Products,
        #id,
        onDelete: KeyAction.restrict,
      )();

  IntColumn get storeId => integer().references(
        Stores,
        #id,
        onDelete: KeyAction.restrict,
      )();

  RealColumn get quantity =>
      real().withDefault(const Constant(0.0))();

  RealColumn get reservedQuantity =>
      real().withDefault(const Constant(0.0))();

  RealColumn get averageCost =>
      real().withDefault(const Constant(0.0))();

  DateTimeColumn get lastMovementAt => dateTime().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  List<Set<Column>> get uniqueKeys => [
        {productId, storeId},
      ];

  @override
  List<String> get customConstraints => [
        'CHECK (quantity >= 0)',
        'CHECK (reserved_quantity >= 0)',
      ];
}
