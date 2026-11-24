
import 'package:drift/drift.dart';

import 'purchase_orders_table.dart';

@DataClassName('PurchaseReceiptDb')
class PurchaseReceipts extends Table {
  // Primary Key
  IntColumn get id => integer().autoIncrement()();

  // Relationship
  IntColumn get purchaseOrderId => integer().references(
        PurchaseOrders,
        #id,
        onDelete: KeyAction.restrict,
      )();

  // Receipt Information
  TextColumn get receiptNumber => text()
      .unique()
      .withLength(min: 1, max: 50)();

  DateTimeColumn get receivedAt =>
      dateTime().withDefault(currentDateAndTime)();

  // Additional Information
  TextColumn get notes => text().nullable()();

  // Audit
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();
}
