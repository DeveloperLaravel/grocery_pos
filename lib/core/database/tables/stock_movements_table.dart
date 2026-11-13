
import 'package:drift/drift.dart';

import 'products_table.dart';

@DataClassName('StockMovementDb')
class StockMovements extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get productId =>
      integer().references(Products, #id)();

  TextColumn get type => text()();

  RealColumn get quantity => real()();

  TextColumn get reference => text().nullable()();

  TextColumn get note => text().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
}
