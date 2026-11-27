
import 'package:drift/drift.dart';

import 'payment_methods_table.dart';
import 'expense_categories_table.dart';

@DataClassName('ExpenseDb')
class Expenses extends Table {
  // =====================================================
  // 1. Primary Key
  // =====================================================

  IntColumn get id => integer().autoIncrement()();

  // =====================================================
  // 2. Relationships
  // =====================================================

  IntColumn get expenseCategoryId => integer().references(
        ExpenseCategories,
        #id,
        onDelete: KeyAction.restrict,
      )();

  IntColumn get paymentMethodId => integer().references(
        PaymentMethods,
        #id,
        onDelete: KeyAction.restrict,
      )();

  // =====================================================
  // 3. Expense Information
  // =====================================================

  TextColumn get expenseNumber => text()
      .withLength(min: 1, max: 50)
      .unique()();

  TextColumn get title => text().withLength(
        min: 1,
        max: 150,
      )();

  TextColumn get description => text().nullable()();

  // =====================================================
  // 4. Financial Information
  // =====================================================

  RealColumn get amount => real()();

  RealColumn get taxAmount =>
      real().withDefault(const Constant(0))();

  RealColumn get discountAmount =>
      real().withDefault(const Constant(0))();

  RealColumn get totalAmount => real()();

  // =====================================================
  // 5. Payment Information
  // =====================================================

  TextColumn get status => text()
      .withDefault(const Constant('paid'))();

  // draft, paid, cancelled

  DateTimeColumn get expenseDate =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get paidAt => dateTime().nullable()();

  // =====================================================
  // 6. Additional Information
  // =====================================================

  TextColumn get referenceNumber => text().nullable()();

  TextColumn get recipientName => text().nullable()();

  TextColumn get recipientPhone => text().nullable()();

  TextColumn get attachmentPath => text().nullable()();

  TextColumn get notes => text().nullable()();

  // =====================================================
  // 7. Audit Information
  // =====================================================

  IntColumn get createdBy => integer().nullable()();

  IntColumn get updatedBy => integer().nullable()();

  IntColumn get cancelledBy => integer().nullable()();

  DateTimeColumn get cancelledAt => dateTime().nullable()();

  TextColumn get cancellationReason => text().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().nullable()();
}
