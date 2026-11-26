
import 'package:drift/drift.dart';

import '../../master_data/parties/suppliers_table.dart';

@DataClassName('PurchaseOrderDb')
class PurchaseOrders extends Table {
  IntColumn get id => integer().autoIncrement()();

  // Supplier
  IntColumn get supplierId => integer().references(
        Suppliers,
        #id,
        onDelete: KeyAction.restrict,
      )();

  // Invoice
  TextColumn get invoiceNumber =>
      text().unique().withLength(min: 1, max: 50)();

  TextColumn get supplierInvoiceNumber =>
      text().nullable().withLength(max: 100)();

  // Dates
  DateTimeColumn get purchaseDate =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get expectedDeliveryDate =>
      dateTime().nullable()();

  DateTimeColumn get completedAt =>
      dateTime().nullable()();

  // Financial
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

  // Payments
  RealColumn get paidAmount =>
      real().withDefault(const Constant(0.0))();

  RealColumn get remainingAmount =>
      real().withDefault(const Constant(0.0))();

  // draft / confirmed / partially_received
  // received / cancelled
  TextColumn get status =>
      text().withDefault(const Constant('draft'))();

  // unpaid / partially_paid / paid
  TextColumn get paymentStatus =>
      text().withDefault(const Constant('unpaid'))();

  // Notes
  TextColumn get notes => text().nullable()();

  TextColumn get internalNotes => text().nullable()();

  // Audit
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  List<String> get customConstraints => [
        'CHECK (subtotal >= 0)',
        'CHECK (discount >= 0)',
        'CHECK (discount <= subtotal)',
        'CHECK (tax >= 0)',
        'CHECK (shipping_cost >= 0)',
        'CHECK (additional_cost >= 0)',
        'CHECK (total >= 0)',
        'CHECK (paid_amount >= 0)',
        'CHECK (remaining_amount >= 0)',
        'CHECK (paid_amount <= total)',
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
