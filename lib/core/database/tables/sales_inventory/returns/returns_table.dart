import 'package:drift/drift.dart';

import '../sales/sales_table.dart';
import '../../master_data/parties/customers_table.dart';

@DataClassName('ReturnDb')
class Returns extends Table {
  // =====================================================
  // 1. Primary Key
  // =====================================================

  IntColumn get id => integer().autoIncrement()();

  // =====================================================
  // 2. Return Information
  // =====================================================

  TextColumn get returnNumber => text()
      .withLength(
        min: 1,
        max: 50,
      )
      .unique()();

  IntColumn get saleId => integer().references(
        Sales,
        #id,
        onDelete: KeyAction.restrict,
      )();

  IntColumn get customerId => integer().nullable().references(
        Customers,
        #id,
        onDelete: KeyAction.setNull,
      )();

  // =====================================================
  // 3. Return Type
  // =====================================================

  TextColumn get returnType =>
      text().withDefault(const Constant('partial')).customConstraint(
            "CHECK (return_type IN ('full', 'partial'))",
          )();

  // =====================================================
  // 4. Return Status
  // =====================================================

  TextColumn get status =>
      text().withDefault(const Constant('draft')).customConstraint(
            "CHECK (status IN ('draft', 'confirmed', 'cancelled'))",
          )();

  // =====================================================
  // 5. Refund Information
  // =====================================================

  TextColumn get refundMethod => text().nullable().customConstraint(
        "CHECK (refund_method IS NULL OR refund_method IN "
        "('cash', 'card', 'bank_transfer', 'store_credit', 'original_payment', 'other'))",
      )();

  TextColumn get refundStatus =>
      text().withDefault(const Constant('pending')).customConstraint(
            "CHECK (refund_status IN ('pending', 'partially_refunded', 'refunded', 'not_applicable'))",
          )();

  // =====================================================
  // 6. Financial Information
  // =====================================================

  RealColumn get subtotal => real().withDefault(const Constant(0.0))();

  RealColumn get discountAmount => real().withDefault(const Constant(0.0))();

  RealColumn get taxAmount => real().withDefault(const Constant(0.0))();

  RealColumn get totalAmount => real().withDefault(const Constant(0.0))();

  RealColumn get refundedAmount => real().withDefault(const Constant(0.0))();

  RealColumn get remainingRefundAmount =>
      real().withDefault(const Constant(0.0))();

  // =====================================================
  // 7. Reason & Notes
  // =====================================================

  TextColumn get reason => text().nullable()();

  TextColumn get notes => text().nullable()();

  // =====================================================
  // 8. Processing Information
  // =====================================================

  IntColumn get createdBy => integer().nullable()();

  IntColumn get confirmedBy => integer().nullable()();

  IntColumn get cancelledBy => integer().nullable()();

  DateTimeColumn get confirmedAt => dateTime().nullable()();

  DateTimeColumn get cancelledAt => dateTime().nullable()();

  DateTimeColumn get refundedAt => dateTime().nullable()();

  // =====================================================
  // 9. Audit Information
  // =====================================================

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  List<String> get customConstraints => [
        'CHECK (subtotal >= 0)',
        'CHECK (discount_amount >= 0)',
        'CHECK (tax_amount >= 0)',
        'CHECK (total_amount >= 0)',
        'CHECK (refunded_amount >= 0)',
        'CHECK (remaining_refund_amount >= 0)',
        'CHECK (refunded_amount <= total_amount)',
      ];
}
