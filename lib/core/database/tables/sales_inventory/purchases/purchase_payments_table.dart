
import 'package:drift/drift.dart';

import 'purchase_orders_table.dart';

@DataClassName('PurchasePaymentDb')
class PurchasePayments extends Table {
  // Primary Key
  IntColumn get id => integer().autoIncrement()();

  // Relationship
  IntColumn get purchaseOrderId => integer().references(
        PurchaseOrders,
        #id,
        onDelete: KeyAction.restrict,
      )();

  // Payment Information
  TextColumn get paymentNumber => text()
      .unique()
      .withLength(min: 1, max: 50)();

  RealColumn get amount => real()();

  DateTimeColumn get paymentDate =>
      dateTime().withDefault(currentDateAndTime)();

  TextColumn get paymentMethod => text()
      .withDefault(const Constant('bank_transfer'))();

// Additional Information
TextColumn get referenceNumber => text().nullable()();

TextColumn get notes => text().nullable()();

  // Audit
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  List<String> get customConstraints => [
        'CHECK (amount > 0)',
      ];
}
