
import 'package:drift/drift.dart';

import 'purchase_orders_table.dart';

@DataClassName('PurchasePaymentDb')
class PurchasePayments extends Table {
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
  // 3. Payment Number
  // =====================================================

  TextColumn get paymentNumber => text()
      .unique()
      .withLength(min: 1, max: 50)();

  // =====================================================
  // 4. Payment Information
  // =====================================================

  RealColumn get amount => real()();

  DateTimeColumn get paymentDate =>
      dateTime().withDefault(currentDateAndTime)();

  // cash / bank_transfer / cheque / card

  TextColumn get paymentMethod => text()
      .withDefault(const Constant('cash'))();

  // =====================================================
  // 5. Reference Information
  // =====================================================

  TextColumn get referenceNumber =>
      text().nullable().withLength(max: 100)();

  TextColumn get notes => text().nullable()();

  // =====================================================
  // 6. Audit
  // =====================================================

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  // =====================================================
  // 7. Constraints
  // =====================================================

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
