
import 'package:drift/drift.dart';

import 'sales_table.dart';

@DataClassName('SalePaymentDb')
class SalePayments extends Table {
  IntColumn get id => integer().autoIncrement()();

  // الفاتورة المرتبطة بالدفعة
  IntColumn get saleId => integer().references(
        Sales,
        #id,
        onDelete: KeyAction.cascade,
      )();

  // المبلغ المدفوع
  RealColumn get amount => real()();

  // cash, card, bank_transfer, mobile_wallet
  TextColumn get paymentMethod => text()();

  // رقم مرجع العملية
  TextColumn get transactionReference => text().nullable()();

  // ملاحظات
  TextColumn get notes => text().nullable()();

  // تاريخ الدفعة
  DateTimeColumn get paymentDate =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
}
