
import 'package:drift/drift.dart';

import '../../master_data/parties/customers_table.dart';
import '../inventory/stores_table.dart';

@DataClassName('SaleDb')
class Sales extends Table {
  // =========================================
  // 1. Primary Key
  // =========================================

  IntColumn get id => integer().autoIncrement()();

  // Example: INV-2026-000001
  TextColumn get invoiceNumber =>
      text().unique().withLength(min: 1, max: 50)();

  // =========================================
  // 2. Relationships
  // =========================================

  IntColumn get customerId => integer()
      .nullable()
      .references(Customers, #id, onDelete: KeyAction.setNull)();

  IntColumn get storeId => integer()
      .references(Stores, #id, onDelete: KeyAction.restrict)();

  // =========================================
  // 3. Invoice Amounts
  // =========================================

  RealColumn get subtotal =>
      real().withDefault(const Constant(0.0))();

  RealColumn get discountAmount =>
      real().withDefault(const Constant(0.0))();

  // Percentage discount, if applicable.
  RealColumn get discountPercentage =>
      real().withDefault(const Constant(0.0))();

  RealColumn get taxAmount =>
      real().withDefault(const Constant(0.0))();

  RealColumn get taxPercentage =>
      real().withDefault(const Constant(0.0))();

  RealColumn get total =>
      real().withDefault(const Constant(0.0))();

  RealColumn get paidAmount =>
      real().withDefault(const Constant(0.0))();

  RealColumn get remainingAmount =>
      real().withDefault(const Constant(0.0))();

  // =========================================
  // 4. Invoice Status
  // =========================================

  // completed / cancelled / returned / partially_returned
  TextColumn get status => text()
      .withDefault(const Constant('completed'))
      .withLength(max: 30)();

  // unpaid / partially_paid / paid
  TextColumn get paymentStatus => text()
      .withDefault(const Constant('unpaid'))
      .withLength(max: 30)();

  // cash / card / mixed / credit
  // Informational primary payment type.
  TextColumn get paymentMethod => text()
      .withDefault(const Constant('cash'))
      .withLength(max: 30)();

  // =========================================
  // 5. Additional Information
  // =========================================

  TextColumn get note => text().nullable()();

  TextColumn get cancellationReason => text().nullable()();

  // =========================================
  // 6. Dates
  // =========================================

  DateTimeColumn get saleDate =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().nullable()();
}
