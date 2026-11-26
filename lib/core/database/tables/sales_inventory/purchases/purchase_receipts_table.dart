
import 'package:drift/drift.dart';

import 'purchase_orders_table.dart';

@DataClassName('PurchaseReceiptDb')
class PurchaseReceipts extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get purchaseOrderId => integer().references(
        PurchaseOrders,
        #id,
        onDelete: KeyAction.restrict,
      )();

  TextColumn get receiptNumber =>
      text().unique().withLength(min: 1, max: 50)();

  DateTimeColumn get receivedAt =>
      dateTime().withDefault(currentDateAndTime)();

  // draft / confirmed / cancelled
  TextColumn get status =>
      text().withDefault(const Constant('draft'))();

  TextColumn get notes => text().nullable()();

  TextColumn get internalNotes => text().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  List<String> get customConstraints => [
        'CHECK (status IN ('
            '\'draft\','
            '\'confirmed\','
            '\'cancelled\'))',
      ];
}
