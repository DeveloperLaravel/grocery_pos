
import 'package:drift/drift.dart';

import '../../../master_data/parties/suppliers_table.dart';
import '../accounting/journal_entries_table.dart';

@DataClassName('SupplierTransactionDb')
class SupplierTransactions extends Table {
  // =====================================================
  // 1. Primary Key
  // =====================================================

  IntColumn get id => integer().autoIncrement()();

  // =====================================================
  // 2. Transaction Number
  // =====================================================

  TextColumn get transactionNumber => text().withLength(
        min: 1,
        max: 50,
      )();

  // =====================================================
  // 3. Supplier Relation
  // =====================================================

  IntColumn get supplierId => integer().references(
        Suppliers,
        #id,
        onDelete: KeyAction.restrict,
      )();

  // =====================================================
  // 4. Transaction Type
  // =====================================================

  // purchase_invoice
  // supplier_payment
  // purchase_return
  // opening_balance
  // debit_note
  // credit_note
  // adjustment

  TextColumn get transactionType => text()();

  // =====================================================
  // 5. Source Reference
  // =====================================================

  // purchase / payment / return / manual
  TextColumn get sourceType => text()
      .nullable()
      .withLength(max: 50)();

  IntColumn get sourceId => integer().nullable()();

  TextColumn get referenceNumber => text()
      .nullable()
      .withLength(max: 100)();

  // =====================================================
  // 6. Accounting Relation
  // =====================================================

  IntColumn get journalEntryId => integer()
      .nullable()
      .references(
        JournalEntries,
        #id,
        onDelete: KeyAction.restrict,
      )();

  // =====================================================
  // 7. Financial Amounts
  // Stored in millimes (1 LYD = 1000 millimes)
  // =====================================================

  IntColumn get debitAmount => integer().withDefault(
        const Constant(0),
      )();

  IntColumn get creditAmount => integer().withDefault(
        const Constant(0),
      )();

  // Supplier balance:
  // Positive = business owes the supplier.
  // Negative = supplier owes the business.

  IntColumn get balanceAfter => integer().withDefault(
        const Constant(0),
      )();

  // =====================================================
  // 8. Transaction Information
  // =====================================================

  TextColumn get description => text().nullable()();

  DateTimeColumn get transactionDate =>
      dateTime()();

  // =====================================================
  // 9. Reversal
  // =====================================================

  BoolColumn get isReversal => boolean().withDefault(
        const Constant(false),
      )();

  IntColumn get reversedTransactionId => integer()
      .nullable()
      .references(
        SupplierTransactions,
        #id,
        onDelete: KeyAction.restrict,
      )();

  // posted / reversed
  TextColumn get status => text().withDefault(
        const Constant('posted'),
      )();

  // =====================================================
  // 10. Audit
  // =====================================================

  IntColumn get createdBy => integer().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  TextColumn get notes => text().nullable()();

  // =====================================================
  // 11. Constraints
  // =====================================================

  @override
  List<String> get customConstraints => [
        'UNIQUE(transaction_number)',

        "CHECK (transaction_type IN ("
            "'purchase_invoice', "
            "'supplier_payment', "
            "'purchase_return', "
            "'opening_balance', "
            "'debit_note', "
            "'credit_note', "
            "'adjustment'"
            "))",

        "CHECK (status IN ('posted', 'reversed'))",

        'CHECK (debit_amount >= 0)',
        'CHECK (credit_amount >= 0)',

        'CHECK (NOT (debit_amount > 0 AND credit_amount > 0))',

        'CHECK (debit_amount > 0 OR credit_amount > 0)',

        'CHECK (reversed_transaction_id IS NULL OR is_reversal = 1)',

        'CHECK (reversed_transaction_id IS NULL OR reversed_transaction_id != id)',
      ];
}
