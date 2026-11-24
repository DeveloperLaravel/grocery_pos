
import 'package:drift/drift.dart';

import '../../inventory/stores_table.dart';
import '../../master_data/parties/customers_table.dart';

@DataClassName('SaleDb')
class Sales extends Table {
  IntColumn get id => integer().autoIncrement()();

  // رقم الفاتورة
  TextColumn get invoiceNumber => text().unique()();

  // العميل اختياري للبيع المباشر
  IntColumn get customerId => integer()
      .nullable()
      .references(Customers, #id, onDelete: KeyAction.setNull)();
IntColumn get storeId => integer().references(
      Stores,
      #id,
      onDelete: KeyAction.restrict,
    )();
  // الإجماليات المالية
  RealColumn get subtotal => real().withDefault(const Constant(0))();

  RealColumn get discountAmount =>
      real().withDefault(const Constant(0))();

  RealColumn get taxAmount =>
      real().withDefault(const Constant(0))();

  RealColumn get totalAmount =>
      real().withDefault(const Constant(0))();

  // إجمالي المدفوع والمتبقي
  RealColumn get paidAmount =>
      real().withDefault(const Constant(0))();

  RealColumn get remainingAmount =>
      real().withDefault(const Constant(0))();

  // نوع البيع
  TextColumn get saleType => text().withDefault(
        const Constant('retail'),
      )();

  // payment: cash, card, mixed, credit
  TextColumn get paymentMethod => text().withDefault(
        const Constant('cash'),
      )();

  // unpaid, partially_paid, paid
  TextColumn get paymentStatus => text().withDefault(
        const Constant('unpaid'),
      )();

  // completed, cancelled, returned, partially_returned
  TextColumn get status => text().withDefault(
        const Constant('completed'),
      )();

  // ملاحظات الفاتورة
  TextColumn get notes => text().nullable()();

  // المستخدم الذي أنشأ الفاتورة
  IntColumn get createdBy => integer().nullable()();

  // تاريخ الفاتورة
  DateTimeColumn get saleDate =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();
}
