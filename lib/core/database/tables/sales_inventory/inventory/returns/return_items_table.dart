
import 'package:drift/drift.dart';

import '../../../master_data/products/product_units_table.dart';
import '../../../master_data/products/products_table.dart';
import 'returns_table.dart';

@DataClassName('ReturnItemDb')
class ReturnItems extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get returnId => integer()
      .references(Returns, #id)();

  IntColumn get productId => integer()
      .references(Products, #id)();

  IntColumn get productUnitId => integer()
      .nullable()
      .references(ProductUnits, #id)();

  // Returned quantity in base units
  RealColumn get quantity => real()();

  // Original entered quantity and conversion factor
  RealColumn get enteredQuantity =>
      real().withDefault(const Constant(0))();

  RealColumn get conversionFactor =>
      real().withDefault(const Constant(1))();

  RealColumn get unitPrice =>
      real().withDefault(const Constant(0))();

  RealColumn get discountAmount =>
      real().withDefault(const Constant(0))();

  RealColumn get taxAmount =>
      real().withDefault(const Constant(0))();

  RealColumn get totalAmount =>
      real().withDefault(const Constant(0))();

  // restock / damaged / discarded
  TextColumn get condition =>
      text().withDefault(const Constant('restock'))();

  TextColumn get notes => text().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  List<String> get customConstraints => [
    'CHECK (quantity > 0)',
    'CHECK (enteredQuantity >= 0)',
    'CHECK (conversionFactor > 0)',
    'CHECK (unitPrice >= 0)',
    'CHECK (discountAmount >= 0)',
    'CHECK (taxAmount >= 0)',
    'CHECK (totalAmount >= 0)',
    'CHECK (condition IN (\'restock\', \'damaged\', \'discarded\'))',
  ];
}
