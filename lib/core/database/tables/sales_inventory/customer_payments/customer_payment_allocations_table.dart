
import 'package:drift/drift.dart';

import '../sales/sales_table.dart';
import 'customer_payments_table.dart';

@DataClassName('CustomerPaymentAllocationDb')
class CustomerPaymentAllocations extends Table {
  // Primary Key
  IntColumn get id => integer().autoIncrement()();

  // Customer payment relationship
  IntColumn get customerPaymentId => integer().references(
        CustomerPayments,
        #id,
        onDelete: KeyAction.cascade,
      )();

  // Sales invoice relationship
  IntColumn get saleId => integer().references(
        Sales,
        #id,
        onDelete: KeyAction.restrict,
      )();

  // Allocated amount
  RealColumn get amount => real()();

  // Allocation date
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  List<Set<Column>> get uniqueKeys => [
        {customerPaymentId, saleId},
      ];

  @override
  List<String> get customConstraints => [
        'CHECK ("amount" > 0)',
      ];
}
