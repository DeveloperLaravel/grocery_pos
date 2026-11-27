
import 'package:drift/drift.dart';

import '../../master_data/products/products_table.dart';
import 'stores_table.dart';

@DataClassName('ProductStockDb')
class ProductStocks extends Table {
  // Primary Key
  IntColumn get id => integer().autoIncrement()();

  // Relations
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

  // Quantities (Base Unit)
  RealColumn get quantity => real().withDefault(const Constant(0))();

  RealColumn get reservedQuantity =>
      real().withDefault(const Constant(0))();

  RealColumn get availableQuantity =>
      real().withDefault(const Constant(0))();

  // Stock Limits
  RealColumn get minStock => real().withDefault(const Constant(0))();

  RealColumn get maxStock => real().nullable()();

  // Cost Information
  RealColumn get averageCost => real().withDefault(const Constant(0))();

  RealColumn get totalCost => real().withDefault(const Constant(0))();

  // Stock Status
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();

  // Timestamps
  DateTimeColumn get lastMovementAt => dateTime().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().nullable()();

  @override
  List<Set<Column>> get uniqueKeys => [
        {storeId, productId},
      ];

  @override
  List<String> get customConstraints => [
        'CHECK (quantity >= 0)',
        'CHECK (reserved_quantity >= 0)',
        'CHECK (available_quantity >= 0)',
        'CHECK (min_stock >= 0)',
        'CHECK (max_stock IS NULL OR max_stock >= min_stock)',
        'CHECK (average_cost >= 0)',
        'CHECK (total_cost >= 0)',
      ];
}
