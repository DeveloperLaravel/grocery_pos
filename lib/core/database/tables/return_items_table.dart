
import 'package:drift/drift.dart';

import 'products_table.dart';
import 'returns_table.dart';

@DataClassName('ReturnItemDb')
class ReturnItems extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get returnId => integer().references(
        Returns,
        #id,
        onDelete: KeyAction.cascade,
      )();

  IntColumn get productId =>
      integer().references(Products, #id)();

  RealColumn get quantity => real()();

  RealColumn get refundAmount => real()();
}
