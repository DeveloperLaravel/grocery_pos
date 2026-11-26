
import 'package:drift/drift.dart';

import 'purchase_orders_table.dart';

@DataClassName('PurchaseReceiptDb')
class PurchaseReceipts extends Table {
  // =====================================================
  // 1. Primary Key
  // =====================================================

  IntColumn get id => integer().autoIncrement()();

  // =====================================================
  // 2. Relationship
  // =====================================================

  IntColumn get purchaseOrderId => integer().references(
        PurchaseOrders,
        #id,
        onDelete: KeyAction.restrict,
      )();

  // =====================================================
  // 3. Receipt Information
  // =====================================================

  TextColumn get receiptNumber => text()
      .unique()
      .withLength(min: 1, max: 50)();

  DateTimeColumn get receivedAt =>
      dateTime().withDefault(currentDateAndTime)();

  // draft / confirmed / cancelled

  TextColumn get status =>
      text().withDefault(const Constant('draft'))();

  // =====================================================
  // 4. Additional Information
  // =====================================================

  TextColumn get notes => text().nullable()();

  // =====================================================
  // 5. Audit
  // =====================================================

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  // =====================================================
  // 6. Constraints
  // =====================================================

  @override
  List<String> get customConstraints => [
        'CHECK (status IN ('
            '\'draft\','
            '\'confirmed\','
            '\'cancelled\'))',
      ];
}
