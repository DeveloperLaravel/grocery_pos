
import 'package:drift/drift.dart';

import 'master_data/products/products_table.dart';
import 'sales_inventory/taxes/taxes_table.dart';

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

  @override
  List<Set<Column>> get uniqueKeys => [
        {productId, taxId},
      ];
}
