import 'package:drift/drift.dart';

import '../../master_data/parties/customers_table.dart';
import '../../sales_inventory/sales/sales_table.dart';

@DataClassName('CustomerTransactionDb')
class CustomerTransactions extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get customerId => integer().references(
        Customers,
        #id,
        onDelete: KeyAction.restrict,
      )();

  IntColumn get saleId => integer()
      .nullable()
      .references(
        Sales,
        #id,
        onDelete: KeyAction.setNull,
      )();

  TextColumn get transactionType =>
      text().withLength(min: 1, max: 50)();

  RealColumn get amount =>
      real().withDefault(const Constant(0.0))();

  RealColumn get balanceAfter =>
      real().withDefault(const Constant(0.0))();

  TextColumn get referenceNumber => text().nullable()();

  TextColumn get description => text().nullable()();

  DateTimeColumn get transactionDate =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
}