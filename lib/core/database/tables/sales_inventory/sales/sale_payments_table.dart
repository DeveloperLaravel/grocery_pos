
import 'package:drift/drift.dart';

import 'sales_table.dart';

@DataClassName('SalePaymentDb')
class SalePayments extends Table {
  // =========================================
  // 1. Primary Key
  // =========================================

  IntColumn get id => integer().autoIncrement()();

  // =========================================
  // 2. Relationship
  // =========================================

  IntColumn get saleId => integer().references(
        Sales,
        #id,
        onDelete: KeyAction.cascade,
      )();

  // =========================================
  // 3. Payment Information
  // =========================================

  // cash / card / bank_transfer / other
  TextColumn get paymentMethod => text()
      .withLength(min: 1, max: 30)();

  RealColumn get amount =>
      real().withDefault(const Constant(0.0))();

  // Reference number for card or bank transfer.
  TextColumn get referenceNumber => text().nullable()();

  TextColumn get transactionId => text().nullable()();

  // =========================================
  // 4. Payment Status
  // =========================================

  // completed / pending / failed / refunded
  TextColumn get status => text()
      .withDefault(const Constant('completed'))
      .withLength(max: 30)();

  // =========================================
  // 5. Additional Information
  // =========================================

  TextColumn get note => text().nullable()();

  DateTimeColumn get paidAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
}
