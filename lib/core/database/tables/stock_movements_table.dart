
import 'package:drift/drift.dart';

import 'products_table.dart';

@DataClassName('StockMovementDb')
class StockMovements extends Table {
  // Primary Key
  IntColumn get id => integer().autoIncrement()();

  // Related Product
  IntColumn get productId =>
      integer().references(Products, #id)();

  // Movement Type: in, out, sale, return
  TextColumn get type => text()();

  // Movement Quantity
  // يجب أن تكون الكمية موجبة
  RealColumn get quantity => real()();

  // Optional Reference
  TextColumn get reference => text().nullable()();

  // Optional Note
  TextColumn get note => text().nullable()();

  // Movement Date
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
}
