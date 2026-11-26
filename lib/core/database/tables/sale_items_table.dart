
import 'package:drift/drift.dart';

import 'master_data/products/products_table.dart';
import 'sales_table.dart';

@DataClassName('SaleItemDb')
class SaleItems extends Table {
  IntColumn get id => integer().autoIncrement()();

  // Sale relationship
  IntColumn get saleId => integer().references(
        Sales,
        #id,
        onDelete: KeyAction.cascade,
      )();

  // Product relationship
  IntColumn get productId => integer().references(
        Products,
        #id,
        onDelete: KeyAction.restrict,
      )();

  // Product information snapshot
  TextColumn get productName => text().withLength(
        min: 1,
        max: 150,
      )();

  // Quantity in base units
  RealColumn get quantity => real()();

  // Selling price at sale time
  RealColumn get unitPrice => real()();

  // Cost price at sale time
  RealColumn get costPrice => real()();

  // Total = quantity * unitPrice
  RealColumn get total => real()();

  @override
  List<String> get customConstraints => [
        'CHECK (quantity > 0)',
        'CHECK (unit_price >= 0)',
        'CHECK (cost_price >= 0)',
        'CHECK (total >= 0)',
      ];
}
