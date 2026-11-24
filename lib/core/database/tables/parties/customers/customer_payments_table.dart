
import 'package:drift/drift.dart';

import '../../master_data/parties/customers_table.dart';

@DataClassName('CustomerPaymentDb')
class CustomerPayments extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get customerId => integer().references(
        Customers,
        #id,
        onDelete: KeyAction.restrict,
      )();

  // رقم إيصال القبض
  TextColumn get receiptNumber => text().unique()();

  RealColumn get amount => real()();

  // cash, card, bank_transfer, wallet, cheque, other
  TextColumn get paymentMethod => text().withLength(
        min: 1,
        max: 30,
      )();

  TextColumn get referenceNumber => text().nullable()();

  TextColumn get notes => text().nullable()();

  // received, cancelled
  TextColumn get status =>
      text().withDefault(const Constant('received'))();

  DateTimeColumn get paymentDate =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  List<String> get customConstraints => [
        'CHECK (amount > 0)',
      ];
}
