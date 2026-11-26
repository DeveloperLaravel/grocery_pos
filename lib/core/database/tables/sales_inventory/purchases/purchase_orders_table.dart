
import 'package:drift/drift.dart';

import '../../master_data/parties/suppliers_table.dart';

@DataClassName('PurchaseOrderDb')
class PurchaseOrders extends Table {
  // =====================================================
  // 1. Primary Key
  // =====================================================

  IntColumn get id => integer().autoIncrement()();

  // =====================================================
  // 2. Supplier Relationship
  // =====================================================

  IntColumn get supplierId => integer().references(
        Suppliers,
        #id,
        onDelete: KeyAction.restrict,
      )();

  // =====================================================
  // 3. Invoice Information
  // =====================================================

  TextColumn get invoiceNumber => text()
      .unique()
      .withLength(min: 1, max: 50)();

  TextColumn get supplierInvoiceNumber =>
      text().nullable().withLength(max: 100)();

  // =====================================================
  // 4. Dates
  // =====================================================

  DateTimeColumn get purchaseDate =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get expectedDeliveryDate =>
      dateTime().nullable()();

  DateTimeColumn get completedAt =>
      dateTime().nullable()();

  // =====================================================
  // 5. Financial Summary
  // =====================================================

  RealColumn get subtotal =>
      real().withDefault(const Constant(0.0))();

  RealColumn get discount =>
      real().withDefault(const Constant(0.0))();

  RealColumn get tax =>
      real().withDefault(const Constant(0.0))();

  RealColumn get shippingCost =>
      real().withDefault(const Constant(0.0))();

  RealColumn get additionalCost =>
      real().withDefault(const Constant(0.0))();

  RealColumn get total =>
      real().withDefault(const Constant(0.0))();

  // =====================================================
  // 6. Payment Summary
  // =====================================================

  RealColumn get paidAmount =>
      real().withDefault(const Constant(0.0))();

  RealColumn get remainingAmount =>
      real().withDefault(const Constant(0.0))();

  // =====================================================
  // 7. Purchase Status
  // =====================================================

  // draft / confirmed / partially_received /
  // received / cancelled

  TextColumn get status =>
      text().withDefault(const Constant('draft'))();

  // =====================================================
  // 8. Payment Status
  // =====================================================

  // unpaid / partially_paid / paid

  TextColumn get paymentStatus =>
      text().withDefault(const Constant('unpaid'))();

  // =====================================================
  // 9. Additional Information
  // =====================================================

  TextColumn get notes => text().nullable()();

  TextColumn get internalNotes => text().nullable()();

  // =====================================================
  // 10. Audit Information
  // =====================================================

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  List<String> get customConstraints => [
        'CHECK (subtotal >= 0)',
        'CHECK (discount >= 0)',
        'CHECK (tax >= 0)',
        'CHECK (shipping_cost >= 0)',
        'CHECK (additional_cost >= 0)',
        'CHECK (total >= 0)',
        'CHECK (paid_amount >= 0)',
        'CHECK (remaining_amount >= 0)',

        'CHECK (discount <= subtotal)',

        'CHECK (status IN ('
            '\'draft\','
            '\'confirmed\','
            '\'partially_received\','
            '\'received\','
            '\'cancelled\'))',

        'CHECK (payment_status IN ('
            '\'unpaid\','
            '\'partially_paid\','
            '\'paid\'))',
      ];
}
