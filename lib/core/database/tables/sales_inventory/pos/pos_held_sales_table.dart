
import 'package:drift/drift.dart';

import '../../master_data/parties/customers_table.dart';
import '../../inventory/stores_table.dart';
import 'pos_terminals_table.dart';

@DataClassName('PosHeldSaleDb')
class PosHeldSales extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get holdNumber => text().unique()();

  IntColumn get customerId => integer()
      .nullable()
      .references(
        Customers,
        #id,
        onDelete: KeyAction.setNull,
      )();

  IntColumn get storeId => integer().references(
        Stores,
        #id,
        onDelete: KeyAction.restrict,
      )();

  IntColumn get terminalId => integer()
      .nullable()
      .references(
        PosTerminals,
        #id,
        onDelete: KeyAction.setNull,
      )();

  IntColumn get cashierId => integer()();

  RealColumn get subtotal =>
      real().withDefault(const Constant(0.0))();

  RealColumn get discount =>
      real().withDefault(const Constant(0.0))();

  RealColumn get tax =>
      real().withDefault(const Constant(0.0))();

  RealColumn get total =>
      real().withDefault(const Constant(0.0))();

  TextColumn get notes => text().nullable()();

  DateTimeColumn get heldAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  List<String> get customConstraints => [
        'CHECK (subtotal >= 0)',
        'CHECK (discount >= 0)',
        'CHECK (tax >= 0)',
        'CHECK (total >= 0)',
        'CHECK (discount <= subtotal)',
      ];
}
