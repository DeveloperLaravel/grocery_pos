
import 'package:drift/drift.dart';

import '../../master_data/parties/customers_table.dart';
import '../finance/payment_methods_table.dart';

@DataClassName('CustomerPaymentDb')
class CustomerPayments extends Table {
  // Primary Key
  IntColumn get id => integer().autoIncrement()();

  // Customer relationship
  IntColumn get customerId => integer().references(
        Customers,
        #id,
        onDelete: KeyAction.restrict,
      )();

  // Payment method relationship
  IntColumn get paymentMethodId => integer().references(
        PaymentMethods,
        #id,
        onDelete: KeyAction.restrict,
      )();

  // Payment information
  RealColumn get amount => real()();

  // Payment reference
  TextColumn get referenceNumber => text()
      .nullable()
      .withLength(max: 100)();

  // Optional bank / card transaction reference
  TextColumn get transactionReference => text()
      .nullable()
      .withLength(max: 150)();

  // Payment date
  DateTimeColumn get paymentDate =>
      dateTime().withDefault(currentDateAndTime)();

  // Payment status: posted / voided
  TextColumn get status => text()
      .withDefault(const Constant('posted'))
      .withLength(max: 20)();

  // Notes
  TextColumn get notes => text().nullable()();

  // Audit
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  List<String> get customConstraints => [
        'CHECK ("amount" > 0)',
        "CHECK (\"status\" IN ('posted', 'voided'))",
      ];
}
