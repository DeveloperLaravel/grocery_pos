
import 'package:drift/drift.dart';

import 'products_table.dart';
import 'sales_table.dart';

@DataClassName('SaleItemDb')
class SaleItems extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get saleId => integer().references(
        Sales,
        #id,
        onDelete: KeyAction.cascade,
      )();

  IntColumn get productId =>
      integer().references(Products, #id)();

  TextColumn get productName => text()();

  RealColumn get quantity => real()();

  RealColumn get unitPrice => real()();

  RealColumn get costPrice => real()();

  RealColumn get total => real()();
}
