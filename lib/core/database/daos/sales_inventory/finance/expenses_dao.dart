
import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../tables/sales_inventory/finance/expenses_table.dart';


part 'expenses_dao.g.dart';

@DriftAccessor(tables: [Expenses])
class ExpensesDao extends DatabaseAccessor<AppDatabase>
    with _$ExpensesDaoMixin {
  ExpensesDao(super.db);

  // =====================================================
  // CREATE
  // =====================================================

  Future<int> insertExpense(
    ExpensesCompanion entry,
  ) async {
    if (entry.amount.present && entry.amount.value <= 0) {
      throw ArgumentError('Expense amount must be positive.');
    }

    if (entry.totalAmount.present &&
        entry.totalAmount.value <= 0) {
      throw ArgumentError('Total amount must be positive.');
    }

    return into(expenses).insert(entry);
  }

  // =====================================================
  // UPDATE
  // =====================================================

  Future<bool> updateExpense(
    ExpensesCompanion entry,
  ) async {
    if (!entry.id.present) {
      throw ArgumentError('Expense ID is required.');
    }

    final current = await getExpenseById(entry.id.value);

    if (current == null) return false;

    if (current.status == 'cancelled') {
      throw StateError('Cannot update a cancelled expense.');
    }

    if (entry.amount.present && entry.amount.value <= 0) {
      throw ArgumentError('Expense amount must be positive.');
    }

    return update(expenses).replace(
      entry.copyWith(
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  // =====================================================
  // READ
  // =====================================================

  Future<ExpenseDb?> getExpenseById(int id) {
    return (select(expenses)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Future<List<ExpenseDb>> getAllExpenses() {
    return (select(expenses)
          ..orderBy([
            (t) => OrderingTerm.desc(t.expenseDate),
            (t) => OrderingTerm.desc(t.id),
          ]))
        .get();
  }

  Future<List<ExpenseDb>> getExpensesByCategory(
    int categoryId,
  ) {
    return (select(expenses)
          ..where(
            (t) => t.expenseCategoryId.equals(categoryId),
          )
          ..orderBy([
            (t) => OrderingTerm.desc(t.expenseDate),
          ]))
        .get();
  }

  Future<List<ExpenseDb>> getExpensesByPaymentMethod(
    int paymentMethodId,
  ) {
    return (select(expenses)
          ..where(
            (t) => t.paymentMethodId.equals(paymentMethodId),
          )
          ..orderBy([
            (t) => OrderingTerm.desc(t.expenseDate),
          ]))
        .get();
  }

  Future<List<ExpenseDb>> getExpensesByStatus(
    String status,
  ) {
    return (select(expenses)
          ..where((t) => t.status.equals(status))
          ..orderBy([
            (t) => OrderingTerm.desc(t.expenseDate),
          ]))
        .get();
  }

  // =====================================================
  // DATE FILTER
  // =====================================================

  Future<List<ExpenseDb>> getExpensesByDateRange({
    required DateTime startDate,
    required DateTime endDate,
  }) {
    return (select(expenses)
          ..where(
            (t) =>
                t.expenseDate.isBiggerOrEqualValue(startDate) &
                t.expenseDate.isSmallerOrEqualValue(endDate),
          )
          ..orderBy([
            (t) => OrderingTerm.desc(t.expenseDate),
          ]))
        .get();
  }

  // =====================================================
  // WATCH
  // =====================================================

  Stream<List<ExpenseDb>> watchAllExpenses() {
    return (select(expenses)
          ..orderBy([
            (t) => OrderingTerm.desc(t.expenseDate),
          ]))
        .watch();
  }

  Stream<List<ExpenseDb>> watchExpensesByCategory(
    int categoryId,
  ) {
    return (select(expenses)
          ..where(
            (t) => t.expenseCategoryId.equals(categoryId),
          )
          ..orderBy([
            (t) => OrderingTerm.desc(t.expenseDate),
          ]))
        .watch();
  }

  Stream<List<ExpenseDb>> watchExpensesByDateRange({
    required DateTime startDate,
    required DateTime endDate,
  }) {
    return (select(expenses)
          ..where(
            (t) =>
                t.expenseDate.isBiggerOrEqualValue(startDate) &
                t.expenseDate.isSmallerOrEqualValue(endDate),
          ))
        .watch();
  }

  // =====================================================
  // SEARCH
  // =====================================================

  Future<List<ExpenseDb>> searchExpenses(
    String keyword,
  ) {
    final search = '%${keyword.trim()}%';

    return (select(expenses)
          ..where(
            (t) =>
                t.expenseNumber.like(search) |
                t.title.like(search) |
                t.recipientName.like(search) |
                t.referenceNumber.like(search),
          )
          ..orderBy([
            (t) => OrderingTerm.desc(t.expenseDate),
          ]))
        .get();
  }

  // =====================================================
  // CANCEL EXPENSE
  // =====================================================

  Future<int> cancelExpense({
    required int id,
    required int cancelledBy,
    required String reason,
  }) async {
    final expense = await getExpenseById(id);

    if (expense == null) {
      throw StateError('Expense not found.');
    }

    if (expense.status == 'cancelled') {
      throw StateError('Expense is already cancelled.');
    }

    if (reason.trim().isEmpty) {
      throw ArgumentError('Cancellation reason is required.');
    }

    return (update(expenses)
          ..where((t) => t.id.equals(id)))
        .write(
      ExpensesCompanion(
        status: const Value('cancelled'),
        cancelledBy: Value(cancelledBy),
        cancelledAt: Value(DateTime.now()),
        cancellationReason: Value(reason.trim()),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  // =====================================================
  // TOTAL EXPENSES
  // =====================================================

  Future<double> getTotalExpenses() async {
    final total = expenses.totalAmount.sum();

    final query = selectOnly(expenses)
      ..addColumns([total])
      ..where(expenses.status.equals('paid'));

    return await query
        .map((row) => row.read(total) ?? 0.0)
        .getSingle();
  }

  // =====================================================
  // TOTAL BY DATE RANGE
  // =====================================================

  Future<double> getTotalExpensesByDateRange({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final total = expenses.totalAmount.sum();

    final query = selectOnly(expenses)
      ..addColumns([total])
      ..where(
        expenses.status.equals('paid') &
            expenses.expenseDate.isBiggerOrEqualValue(startDate) &
            expenses.expenseDate.isSmallerOrEqualValue(endDate),
      );

    return await query
        .map((row) => row.read(total) ?? 0.0)
        .getSingle();
  }

  // =====================================================
  // TOTAL BY CATEGORY
  // =====================================================

  Future<double> getTotalByCategory(int categoryId) async {
    final total = expenses.totalAmount.sum();

    final query = selectOnly(expenses)
      ..addColumns([total])
      ..where(
        expenses.expenseCategoryId.equals(categoryId) &
            expenses.status.equals('paid'),
      );

    return await query
        .map((row) => row.read(total) ?? 0.0)
        .getSingle();
  }

  // =====================================================
  // TOTAL BY PAYMENT METHOD
  // =====================================================

  Future<double> getTotalByPaymentMethod(
    int paymentMethodId,
  ) async {
    final total = expenses.totalAmount.sum();

    final query = selectOnly(expenses)
      ..addColumns([total])
      ..where(
        expenses.paymentMethodId.equals(paymentMethodId) &
            expenses.status.equals('paid'),
      );

    return await query
        .map((row) => row.read(total) ?? 0.0)
        .getSingle();
  }

  // =====================================================
  // COUNT
  // =====================================================

  Future<int> countExpenses() async {
    final count = expenses.id.count();

    final query = selectOnly(expenses)
      ..addColumns([count]);

    return await query
        .map((row) => row.read(count) ?? 0)
        .getSingle();
  }

  // =====================================================
  // COUNT BY STATUS
  // =====================================================

  Future<int> countExpensesByStatus(String status) async {
    final count = expenses.id.count();

    final query = selectOnly(expenses)
      ..addColumns([count])
      ..where(expenses.status.equals(status));

    return await query
        .map((row) => row.read(count) ?? 0)
        .getSingle();
  }
}
