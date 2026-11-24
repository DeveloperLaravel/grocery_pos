
import 'package:drift/drift.dart';

import 'journal_entries_table.dart';
import 'accounts_table.dart';

@DataClassName('JournalEntryLineDb')
class JournalEntryLines extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get journalEntryId => integer().references(
        JournalEntries,
        #id,
        onDelete: KeyAction.cascade,
      )();

  IntColumn get accountId => integer().references(
        Accounts,
        #id,
        onDelete: KeyAction.restrict,
      )();

  RealColumn get debit =>
      real().withDefault(const Constant(0.0))();

  RealColumn get credit =>
      real().withDefault(const Constant(0.0))();

  TextColumn get description => text().nullable()();

  @override
  List<String> get customConstraints => [
        'CHECK (debit >= 0)',
        'CHECK (credit >= 0)',
        'CHECK (NOT (debit > 0 AND credit > 0))',
      ];
}
