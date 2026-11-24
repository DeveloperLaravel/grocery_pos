
import 'package:drift/drift.dart';

import 'customer_payments_table.dart';
import '../../sales_inventory/sales/sales_table.dart';

@DataClassName('CustomerPaymentAllocationDb')
class CustomerPaymentAllocations extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get customerPaymentId => integer().references(
        CustomerPayments,
        #id,
        onDelete: KeyAction.restrict,
      )();

  IntColumn get saleId => integer().references(
        Sales,
        #id,
        onDelete: KeyAction.restrict,
      )();

  RealColumn get amount => real()();

  DateTimeColumn get allocatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  TextColumn get notes => text().nullable()();

  @override
  List<String> get customConstraints => [
        'CHECK (amount > 0)',
      ];
}
