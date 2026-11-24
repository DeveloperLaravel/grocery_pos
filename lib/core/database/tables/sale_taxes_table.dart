
import 'package:drift/drift.dart';

import 'sales_inventory/sales/sales_table.dart';
import 'sales_inventory/sales/sale_items_table.dart';
import 'sales_inventory/taxes/taxes_table.dart';

@DataClassName('SaleTaxDb')
class SaleTaxes extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get saleId => integer().references(
        Sales,
        #id,
        onDelete: KeyAction.cascade,
      )();

  IntColumn get saleItemId => integer()
      .nullable()
      .references(
        SaleItems,
        #id,
        onDelete: KeyAction.setNull,
      )();

  IntColumn get taxId => integer()
      .nullable()
      .references(
        Taxes,
        #id,
        onDelete: KeyAction.setNull,
      )();

  TextColumn get taxName => text()();

  RealColumn get rate => real()();

  RealColumn get amount => real()();

  BoolColumn get isInclusive =>
      boolean().withDefault(const Constant(false))();

  @override
  List<String> get customConstraints => [
        'CHECK (rate >= 0)',
        'CHECK (amount >= 0)',
      ];
}
