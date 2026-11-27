
import 'package:drift/drift.dart';

import '../../../tables/master_data/products/products_table.dart';
import '../sales/sales_table.dart';
import 'taxes_table.dart';

@DataClassName('SaleTaxDb')
class SaleTaxes extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get saleId => integer().references(
    Sales,
    #id,
    onDelete: KeyAction.cascade,
  )();

  IntColumn get taxId => integer().nullable().references(
    Taxes,
    #id,
    onDelete: KeyAction.setNull,
  )();

  IntColumn get productId => integer().nullable().references(
    Products,
    #id,
    onDelete: KeyAction.setNull,
  )();

  // Snapshot of tax details
  TextColumn get taxName => text().withLength(
    min: 1,
    max: 100,
  )();

  RealColumn get taxRate => real()();

  TextColumn get taxType =>
      text().withDefault(const Constant('percentage'))();

  // Amount before tax
  RealColumn get taxableAmount => real()();

  // Actual tax amount
  RealColumn get taxAmount => real()();

  BoolColumn get isInclusive =>
      boolean().withDefault(const Constant(false))();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  List<String> get customConstraints => [
    'CHECK (taxRate >= 0)',
    'CHECK (taxableAmount >= 0)',
    'CHECK (taxAmount >= 0)',
  ];
}
