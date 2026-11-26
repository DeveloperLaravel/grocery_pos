
import 'package:drift/drift.dart';

import 'master_data/products/products_table.dart';

@DataClassName('StockMovementDb')
class StockMovements extends Table {
  IntColumn get id => integer().autoIncrement()();

  // Product relationship
  IntColumn get productId => integer().references(
        Products,
        #id,
        onDelete: KeyAction.restrict,
      )();

  // Movement quantity (always positive)
  RealColumn get quantity => real()();

  // Movement type
  // sale, sale_return, purchase, purchase_return,
  // adjustment_in, adjustment_out, damage
  TextColumn get type => text()();

  // Reference number (invoice, purchase, etc.)
  TextColumn get reference => text().nullable()();

  // Movement description
  TextColumn get note => text().nullable()();

  // Creation timestamp
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  List<String> get customConstraints => [
        'CHECK (quantity > 0)',
        "CHECK (type IN ('sale', 'sale_return', 'purchase', "
            "'purchase_return', 'adjustment_in', 'adjustment_out', 'damage'))",
      ];
}
