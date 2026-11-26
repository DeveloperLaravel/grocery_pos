
import 'package:drift/drift.dart';

import 'purchase_orders_table.dart';

@DataClassName('PurchasePaymentDb')
class PurchasePayments extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get purchaseOrderId => integer().references(
        PurchaseOrders,
        #id,
        onDelete: KeyAction.restrict,
      )();

  TextColumn get paymentNumber =>
      text().unique().withLength(min: 1, max: 50)();

  // Payment
  RealColumn get amount => real()();

  DateTimeColumn get paymentDate =>
      dateTime().withDefault(currentDateAndTime)();

  // cash / bank_transfer / cheque / card
  TextColumn get paymentMethod =>
      text().withDefault(const Constant('cash'))();

  // Reference
  TextColumn get referenceNumber =>
      text().nullable().withLength(max: 100)();

  TextColumn get notes => text().nullable()();

  // Audit
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  List<String> get customConstraints => [
        'CHECK (amount > 0)',
        'CHECK (payment_method IN ('
            '\'cash\','
            '\'bank_transfer\','
            '\'cheque\','
            '\'card\'))',
      ];
}
