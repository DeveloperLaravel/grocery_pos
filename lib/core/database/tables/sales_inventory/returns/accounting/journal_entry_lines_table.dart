
import 'package:drift/drift.dart';

import 'accounts_table.dart';
import 'journal_entries_table.dart';

@DataClassName('JournalEntryLineDb')
class JournalEntryLines extends Table {
  // Primary Key
  IntColumn get id => integer().autoIncrement()();

  // Relations
  IntColumn get journalEntryId => integer()
      .references(
        JournalEntries,
        #id,
        onDelete: KeyAction.cascade,
      )();

  IntColumn get accountId => integer()
      .references(
        Accounts,
        #id,
        onDelete: KeyAction.restrict,
      )();

  // Line Information
  IntColumn get lineNumber => integer().withDefault(
        const Constant(1),
      )();

  TextColumn get description => text().nullable()();

  // Amounts in millimes
  // 5000 LYD = 5000000 millimes
  IntColumn get debitAmount => integer().withDefault(
        const Constant(0),
      )();

  IntColumn get creditAmount => integer().withDefault(
        const Constant(0),
      )();

  // Optional Party Reference
  // customer / supplier
  TextColumn get partyType => text().nullable()();

  IntColumn get partyId => integer().nullable()();

  // Cost Center (optional future integration)
  IntColumn get costCenterId => integer().nullable()();

  // Audit
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  List<String> get customConstraints => [
        'CHECK (lineNumber >= 1)',
        'CHECK (debitAmount >= 0)',
        'CHECK (creditAmount >= 0)',
        'CHECK (NOT (debitAmount > 0 AND creditAmount > 0))',
        'CHECK (debitAmount > 0 OR creditAmount > 0)',
        "CHECK (partyType IS NULL OR partyType IN ('customer', 'supplier'))",
        'UNIQUE(journal_entry_id, line_number)',
      ];
}
