
import 'package:drift/drift.dart';

import '../../../../app_database.dart';
import '../../../../tables/sales_inventory/returns/transactions/customer_transactions_table.dart';


part 'customer_transactions_dao.g.dart';

@DriftAccessor(
  tables: [
    CustomerTransactions,
  ],
)
class CustomerTransactionsDao
    extends DatabaseAccessor<AppDatabase>
    with _$CustomerTransactionsDaoMixin {
  CustomerTransactionsDao(super.db);

  // =====================================================
  // 1. Insert Transaction
  // =====================================================

  Future<int> insertTransaction(
    CustomerTransactionsCompanion transaction,
  ) {
    return db.transaction(() async {
      final id = await into(customerTransactions).insert(transaction);

      final balance = await _calculateBalance(
        transaction.customerId.value,
      );

      await (update(customerTransactions)
            ..where((t) => t.id.equals(id)))
          .write(
        CustomerTransactionsCompanion(
          balanceAfter: Value(balance),
        ),
      );

      return id;
    });
  }

  // =====================================================
  // 2. Insert Multiple Transactions
  // =====================================================

  Future<List<int>> insertTransactions(
    List<CustomerTransactionsCompanion> transactions,
  ) {
    return db.transaction(() async {
      final ids = <int>[];

      for (final transaction in transactions) {
        final id = await into(customerTransactions).insert(
          transaction,
        );

        ids.add(id);
      }

      final customerIds = transactions
          .map((e) => e.customerId.value)
          .toSet();

      for (final customerId in customerIds) {
        await _recalculateCustomerBalances(customerId);
      }

      return ids;
    });
  }

  // =====================================================
  // 3. Get All Transactions
  // =====================================================

  Future<List<CustomerTransactionDb>> getAllTransactions() {
    return (select(customerTransactions)
          ..orderBy([
            (t) => OrderingTerm.desc(t.transactionDate),
            (t) => OrderingTerm.desc(t.id),
          ]))
        .get();
  }

  // =====================================================
  // 4. Watch All Transactions
  // =====================================================

  Stream<List<CustomerTransactionDb>> watchAllTransactions() {
    return (select(customerTransactions)
          ..orderBy([
            (t) => OrderingTerm.desc(t.transactionDate),
            (t) => OrderingTerm.desc(t.id),
          ]))
        .watch();
  }

  // =====================================================
  // 5. Get Transaction By ID
  // =====================================================

  Future<CustomerTransactionDb?> getTransactionById(
    int id,
  ) {
    return (select(customerTransactions)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  // =====================================================
  // 6. Get Transaction By Number
  // =====================================================

  Future<CustomerTransactionDb?> getTransactionByNumber(
    String number,
  ) {
    return (select(customerTransactions)
          ..where(
            (t) => t.transactionNumber.equals(number),
          ))
        .getSingleOrNull();
  }

  // =====================================================
  // 7. Get Customer Transactions
  // =====================================================

  Future<List<CustomerTransactionDb>> getByCustomer(
    int customerId,
  ) {
    return (select(customerTransactions)
          ..where(
            (t) => t.customerId.equals(customerId),
          )
          ..orderBy([
            (t) => OrderingTerm.desc(t.transactionDate),
            (t) => OrderingTerm.desc(t.id),
          ]))
        .get();
  }

  // =====================================================
  // 8. Watch Customer Transactions
  // =====================================================

  Stream<List<CustomerTransactionDb>> watchByCustomer(
    int customerId,
  ) {
    return (select(customerTransactions)
          ..where(
            (t) => t.customerId.equals(customerId),
          )
          ..orderBy([
            (t) => OrderingTerm.desc(t.transactionDate),
            (t) => OrderingTerm.desc(t.id),
          ]))
        .watch();
  }

  // =====================================================
  // 9. Get By Transaction Type
  // =====================================================

  Future<List<CustomerTransactionDb>> getByType(
    String transactionType,
  ) {
    return (select(customerTransactions)
          ..where(
            (t) => t.transactionType.equals(transactionType),
          )
          ..orderBy([
            (t) => OrderingTerm.desc(t.transactionDate),
          ]))
        .get();
  }

  // =====================================================
  // 10. Get By Source
  // =====================================================

  Future<List<CustomerTransactionDb>> getBySource(
    String sourceType,
    int sourceId,
  ) {
    return (select(customerTransactions)
          ..where(
            (t) =>
                t.sourceType.equals(sourceType) &
                t.sourceId.equals(sourceId),
          ))
        .get();
  }

  // =====================================================
  // 11. Get By Date Range
  // =====================================================

  Future<List<CustomerTransactionDb>> getByDateRange({
    required DateTime from,
    required DateTime to,
    int? customerId,
  }) {
    final query = select(customerTransactions)
      ..where(
        (t) =>
            t.transactionDate.isBiggerOrEqualValue(from) &
            t.transactionDate.isSmallerOrEqualValue(to),
      )
      ..orderBy([
        (t) => OrderingTerm.desc(t.transactionDate),
      ]);

    if (customerId != null) {
      query.where(
        (t) => t.customerId.equals(customerId),
      );
    }

    return query.get();
  }

  // =====================================================
  // 12. Search Transactions
  // =====================================================

  Future<List<CustomerTransactionDb>> searchTransactions(
    String keyword, {
    int? customerId,
  }) {
    final query = select(customerTransactions)
      ..where(
        (t) =>
            t.transactionNumber.contains(keyword) |
            t.referenceNumber.contains(keyword) |
            t.description.contains(keyword),
      )
      ..orderBy([
        (t) => OrderingTerm.desc(t.transactionDate),
      ]);

    if (customerId != null) {
      query.where(
        (t) => t.customerId.equals(customerId),
      );
    }

    return query.get();
  }

  // =====================================================
  // 13. Get Customer Balance
  // =====================================================

  Future<int> getCustomerBalance(int customerId) {
    return _calculateBalance(customerId);
  }

  // =====================================================
  // 14. Get Customer Totals
  // =====================================================

  Future<({int debit, int credit, int balance})>
      getCustomerTotals(int customerId) async {
    final query = selectOnly(customerTransactions)
      ..addColumns([
        customerTransactions.debitAmount.sum(),
        customerTransactions.creditAmount.sum(),
      ])
      ..where(
        customerTransactions.customerId.equals(customerId) &
            customerTransactions.status.equals('posted'),
      );

    final result = await query.getSingle();

    final debit = result.read(
          customerTransactions.debitAmount.sum(),
        ) ??
        0;

    final credit = result.read(
          customerTransactions.creditAmount.sum(),
        ) ??
        0;

    return (
      debit: debit,
      credit: credit,
      balance: debit - credit,
    );
  }

  // =====================================================
  // 15. Watch Customer Balance
  // =====================================================

  Stream<int> watchCustomerBalance(int customerId) {
    final query = selectOnly(customerTransactions)
      ..addColumns([
        customerTransactions.debitAmount.sum(),
        customerTransactions.creditAmount.sum(),
      ])
      ..where(
        customerTransactions.customerId.equals(customerId) &
            customerTransactions.status.equals('posted'),
      );

    return query.watchSingle().map((result) {
      final debit = result.read(
            customerTransactions.debitAmount.sum(),
          ) ??
          0;

      final credit = result.read(
            customerTransactions.creditAmount.sum(),
          ) ??
          0;

      return debit - credit;
    });
  }

  // =====================================================
  // 16. Get Transactions Count
  // =====================================================

  Future<int> getCustomerTransactionsCount(
    int customerId,
  ) async {
    final count = customerTransactions.id.count();

    final query = selectOnly(customerTransactions)
      ..addColumns([count])
      ..where(
        customerTransactions.customerId.equals(customerId),
      );

    final result = await query.getSingle();

    return result.read(count) ?? 0;
  }

  // =====================================================
  // 17. Recalculate Customer Balances
  // =====================================================

  Future<void> _recalculateCustomerBalances(
    int customerId,
  ) async {
    final rows = await (select(customerTransactions)
          ..where(
            (t) => t.customerId.equals(customerId),
          )
          ..orderBy([
            (t) => OrderingTerm.asc(t.transactionDate),
            (t) => OrderingTerm.asc(t.id),
          ]))
        .get();

    var balance = 0;

    for (final row in rows) {
      if (row.status == 'posted') {
        balance += row.debitAmount - row.creditAmount;
      }

      await (update(customerTransactions)
            ..where((t) => t.id.equals(row.id)))
          .write(
        CustomerTransactionsCompanion(
          balanceAfter: Value(balance),
        ),
      );
    }
  }

  // =====================================================
  // 18. Calculate Balance
  // =====================================================

  Future<int> _calculateBalance(int customerId) async {
    final totals = await getCustomerTotals(customerId);
    return totals.balance;
  }

  // =====================================================
  // 19. Reverse Transaction
  // =====================================================

  Future<int> reverseTransaction({
    required int transactionId,
    required String reversalNumber,
    required DateTime reversalDate,
    int? createdBy,
    String? notes,
  }) {
    return db.transaction(() async {
      final original = await (select(customerTransactions)
            ..where((t) => t.id.equals(transactionId)))
          .getSingleOrNull();

      if (original == null) {
        throw StateError('الحركة المالية غير موجودة');
      }

      if (original.status != 'posted') {
        throw StateError('لا يمكن عكس حركة غير مرحلة');
      }

      if (original.isReversal) {
        throw StateError('لا يمكن عكس حركة عكسية');
      }

      final alreadyReversed = await (select(customerTransactions)
            ..where(
              (t) =>
                  t.reversedTransactionId.equals(transactionId),
            ))
          .getSingleOrNull();

      if (alreadyReversed != null) {
        throw StateError('تم عكس هذه الحركة مسبقاً');
      }

      await (update(customerTransactions)
            ..where((t) => t.id.equals(transactionId)))
          .write(
        const CustomerTransactionsCompanion(
          status: Value('reversed'),
        ),
      );

      final reversalId = await into(customerTransactions).insert(
        CustomerTransactionsCompanion.insert(
          transactionNumber: reversalNumber,
          customerId: original.customerId,
          transactionType: original.transactionType,
          sourceType: const Value('manual'),
          sourceId: const Value(null),
          referenceNumber: Value(original.referenceNumber),
          journalEntryId: const Value(null),
          debitAmount: Value(original.creditAmount),
          creditAmount: Value(original.debitAmount),
          balanceAfter: const Value(0),
          description: Value(
            'عكس الحركة رقم ${original.transactionNumber}',
          ),
          transactionDate: reversalDate,
          isReversal: const Value(true),
          reversedTransactionId: Value(original.id),
          status: const Value('posted'),
          createdBy: Value(createdBy),
          notes: Value(notes),
        ),
      );

      await _recalculateCustomerBalances(
        original.customerId,
      );

      return reversalId;
    });
  }
}
