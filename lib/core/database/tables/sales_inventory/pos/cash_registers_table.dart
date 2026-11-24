
import 'package:drift/drift.dart';

import '../../inventory/stores_table.dart';
import 'pos_terminals_table.dart';

@DataClassName('CashRegisterDb')
class CashRegisters extends Table {
  IntColumn get id => integer().autoIncrement()();

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

  TextColumn get code => text().unique()();

  TextColumn get name => text()();

  RealColumn get openingBalance =>
      real().withDefault(const Constant(0.0))();

  BoolColumn get isActive =>
      boolean().withDefault(const Constant(true))();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  List<String> get customConstraints => [
        'CHECK (opening_balance >= 0)',
      ];
}
