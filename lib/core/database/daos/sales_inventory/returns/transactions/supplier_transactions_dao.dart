
import 'package:drift/drift.dart';

import '../../../../app_database.dart';
import '../../../../tables/sales_inventory/returns/transactions/supplier_transactions_table.dart';


part 'supplier_transactions_dao.g.dart';

@DriftAccessor(
  tables: [
    SupplierTransactions,
  ],
)
class SupplierTransactionsDao
    extends DatabaseAccessor<AppDatabase>
    with _$SupplierTransactionsDaoMixin {
  SupplierTransactionsDao(super.db);

  // =====================================================
  // 1. Insert Transaction
  // =====================================================

  Future<int> insertTransaction(
    SupplierTransactionsCompanion transaction,
  ) {
    return db.transaction(() async {
      final id = await into(supplierTransactions).insert(
        transaction,
      );

      await _recalculateSupplierBalances(
        transaction.supplierId.value,
      );

      return id;
    });
  }

  // =====================================================
  // 2. Insert Multiple Transactions
  // =====================================================

  Future<List<int>> insertTransactions(
    List<SupplierTransactionsCompanion> transactions,
  ) {
    return db.transaction(() async {
      final ids = <int>[];

      for (final transaction in transactions) {
        final id = await into(supplierTransactions).insert(
          transaction,
        );

        ids.add(id);
      }

      final supplierIds = transactions
          .map((e) => e.supplierId.value)
          .toSet();

      for (final supplierId in supplierIds) {
        await _recalculateSupplierBalances(supplierId);
      }

      return ids;
    });
  }

  // =====================================================
  // 3. Get All Transactions
  // =====================================================

  Future<List<SupplierTransactionDb>> getAllTransactions() {
    return (select(supplierTransactions)
          ..orderBy([
            (t) => OrderingTerm.desc(t.transactionDate),
            (t) => OrderingTerm.desc(t.id),
          ]))
        .get();
  }

  // =====================================================
  // 4. Watch All Transactions
  // =====================================================

  Stream<List<SupplierTransactionDb>> watchAllTransactions() {
    return (select(supplierTransactions)
          ..orderBy([
            (t) => OrderingTerm.desc(t.transactionDate),
            (t) => OrderingTerm.desc(t.id),
          ]))
        .watch();
  }

  // =====================================================
  // 5. Get Transaction By ID
  // =====================================================

  Future<SupplierTransactionDb?> getTransactionById(
    int id,
  ) {
    return (select(supplierTransactions)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  // =====================================================
  // 6. Get Transaction By Number
  // =====================================================

  Future<SupplierTransactionDb?> getTransactionByNumber(
    String number,
  ) {
    return (select(supplierTransactions)
          ..where(
            (t) => t.transactionNumber.equals(number),
          ))
        .getSingleOrNull();
  }

  // =====================================================
  // 7. Get Supplier Transactions
  // =====================================================

  Future<List<SupplierTransactionDb>> getBySupplier(
    int supplierId,
  ) {
    return (select(supplierTransactions)
          ..where(
            (t) => t.supplierId.equals(supplierId),
          )
          ..orderBy([
            (t) => OrderingTerm.desc(t.transactionDate),
            (t) => OrderingTerm.desc(t.id),
          ]))
        .get();
  }

  // =====================================================
  // 8. Watch Supplier Transactions
  // =====================================================

  Stream<List<SupplierTransactionDb>> watchBySupplier(
    int supplierId,
  ) {
    return (select(supplierTransactions)
          ..where(
            (t) => t.supplierId.equals(supplierId),
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

  Future<List<SupplierTransactionDb>> getByType(
    String transactionType,
  ) {
    return (select(supplierTransactions)
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

  Future<List<SupplierTransactionDb>> getBySource(
    String sourceType,
    int sourceId,
  ) {
    return (select(supplierTransactions)
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

  Future<List<SupplierTransactionDb>> getByDateRange({
    required DateTime from,
    required DateTime to,
    int? supplierId,
  }) {
    final query = select(supplierTransactions);

    query.where((t) {
      Expression<bool> condition =
          t.transactionDate.isBiggerOrEqualValue(from) &
          t.transactionDate.isSmallerOrEqualValue(to);

      if (supplierId != null) {
        condition = condition & t.supplierId.equals(supplierId);
      }

      return condition;
    });

    query.orderBy([
      (t) => OrderingTerm.desc(t.transactionDate),
    ]);

    return query.get();
  }

  // =====================================================
  // 12. Search Transactions
  // =====================================================

  Future<List<SupplierTransactionDb>> searchTransactions(
    String keyword, {
    int? supplierId,
  }) {
    final query = select(supplierTransactions);

    query.where((t) {
      Expression<bool> condition =
          t.transactionNumber.contains(keyword) |
          t.referenceNumber.contains(keyword) |
          t.description.contains(keyword);

      if (supplierId != null) {
        condition = condition & t.supplierId.equals(supplierId);
      }

      return condition;
    });

    query.orderBy([
      (t) => OrderingTerm.desc(t.transactionDate),
    ]);

    return query.get();
  }

  // =====================================================
  // 13. Get Supplier Balance
  // =====================================================

  Future<int> getSupplierBalance(int supplierId) {
    return _calculateBalance(supplierId);
  }

  // =====================================================
  // 14. Get Supplier Totals
  // =====================================================

  Future<({int debit, int credit, int balance})>
      getSupplierTotals(int supplierId) async {
    final query = selectOnly(supplierTransactions)
      ..addColumns([
        supplierTransactions.debitAmount.sum(),
        supplierTransactions.creditAmount.sum(),
      ])
      ..where(
        supplierTransactions.supplierId.equals(supplierId) &
            supplierTransactions.status.equals('posted'),
      );

    final result = await query.getSingle();

    final debit = result.read(
          supplierTransactions.debitAmount.sum(),
        ) ??
        0;

    final credit = result.read(
          supplierTransactions.creditAmount.sum(),
        ) ??
        0;

    return (
      debit: debit,
      credit: credit,
      balance: credit - debit,
    );
  }

  // =====================================================
  // 15. Watch Supplier Balance
  // =====================================================

  Stream<int> watchSupplierBalance(int supplierId) {
    final query = selectOnly(supplierTransactions)
      ..addColumns([
        supplierTransactions.debitAmount.sum(),
        supplierTransactions.creditAmount.sum(),
      ])
      ..where(
        supplierTransactions.supplierId.equals(supplierId) &
            supplierTransactions.status.equals('posted'),
      );

    return query.watchSingle().map((result) {
      final debit = result.read(
            supplierTransactions.debitAmount.sum(),
          ) ??
          0;

      final credit = result.read(
            supplierTransactions.creditAmount.sum(),
          ) ??
          0;

      return credit - debit;
    });
  }

  // =====================================================
  // 16. Get Transactions Count
  // =====================================================

  Future<int> getSupplierTransactionsCount(
    int supplierId,
  ) async {
    final count = supplierTransactions.id.count();

    final query = selectOnly(supplierTransactions)
      ..addColumns([count])
      ..where(
        supplierTransactions.supplierId.equals(supplierId),
      );

    final result = await query.getSingle();

    return result.read(count) ?? 0;
  }

  // =====================================================
  // 17. Recalculate Supplier Balances
  // =====================================================

  Future<void> _recalculateSupplierBalances(
    int supplierId,
  ) async {
    final rows = await (select(supplierTransactions)
          ..where(
            (t) => t.supplierId.equals(supplierId),
          )
          ..orderBy([
            (t) => OrderingTerm.asc(t.transactionDate),
            (t) => OrderingTerm.asc(t.id),
          ]))
        .get();

    var balance = 0;

    for (final row in rows) {
      if (row.status == 'posted') {
        balance += row.creditAmount - row.debitAmount;
      }

      await (update(supplierTransactions)
            ..where((t) => t.id.equals(row.id)))
          .write(
        SupplierTransactionsCompanion(
          balanceAfter: Value(balance),
        ),
      );
    }
  }

  // =====================================================
  // 18. Calculate Balance
  // =====================================================

  Future<int> _calculateBalance(int supplierId) async {
    final totals = await getSupplierTotals(supplierId);
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
      final original = await (select(supplierTransactions)
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

      final alreadyReversed = await (select(supplierTransactions)
            ..where(
              (t) =>
                  t.reversedTransactionId.equals(transactionId),
            ))
          .getSingleOrNull();

      if (alreadyReversed != null) {
        throw StateError('تم عكس هذه الحركة مسبقاً');
      }

      await (update(supplierTransactions)
            ..where((t) => t.id.equals(transactionId)))
          .write(
        const SupplierTransactionsCompanion(
          status: Value('reversed'),
        ),
      );

      final reversalId = await into(supplierTransactions).insert(
        SupplierTransactionsCompanion.insert(
          transactionNumber: reversalNumber,
          supplierId: original.supplierId,
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

      await _recalculateSupplierBalances(
        original.supplierId,
      );

      return reversalId;
    });
  }
}
