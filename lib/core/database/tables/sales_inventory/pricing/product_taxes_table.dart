
import 'package:drift/drift.dart';

import '../../../tables/master_data/products/products_table.dart';
import 'taxes_table.dart';

@DataClassName('ProductTaxDb')
class ProductTaxes extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get productId => integer().references(
    Products,
    #id,
    onDelete: KeyAction.cascade,
  )();

  IntColumn get taxId => integer().references(
    Taxes,
    #id,
    onDelete: KeyAction.restrict,
  )();

  BoolColumn get isActive =>
      boolean().withDefault(const Constant(true))();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  List<Set<Column>> get uniqueKeys => [
    {productId, taxId},
  ];
}
