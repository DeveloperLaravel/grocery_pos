import 'package:drift/drift.dart';

import '../../../../app_database.dart';
import '../../../../tables/sales_inventory/returns/accounting/journal_entries_table.dart';


part 'journal_entries_dao.g.dart';

@DriftAccessor(tables: [JournalEntries])
class JournalEntriesDao extends DatabaseAccessor<AppDatabase>
    with _$JournalEntriesDaoMixin {
  JournalEntriesDao(super.db);

  // Insert Draft
  Future<int> insertEntry(JournalEntriesCompanion entry) {
    return into(journalEntries).insert(entry);
  }

  // Update Draft
  Future<bool> updateEntry(
    int id,
    JournalEntriesCompanion entry,
  ) async {
    return (update(journalEntries)
          ..where(
            (t) =>
                t.id.equals(id) &
                t.status.equals('draft'),
          ))
        .write(
      entry.copyWith(
        updatedAt: Value(DateTime.now()),
      ),
    ).then((rows) => rows > 0);
  }

  // Get All
  Future<List<JournalEntryDb>> getAllEntries() {
    return (select(journalEntries)
          ..orderBy([
            (t) => OrderingTerm.desc(t.entryDate),
          ]))
        .get();
  }

  // Watch All
  Stream<List<JournalEntryDb>> watchAllEntries() {
    return (select(journalEntries)
          ..orderBy([
            (t) => OrderingTerm.desc(t.entryDate),
          ]))
        .watch();
  }

  // Get By ID
  Future<JournalEntryDb?> getEntryById(int id) {
    return (select(journalEntries)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  // Get By Number
  Future<JournalEntryDb?> getEntryByNumber(String number) {
    return (select(journalEntries)
          ..where((t) => t.entryNumber.equals(number)))
        .getSingleOrNull();
  }

  // Get By Status
  Future<List<JournalEntryDb>> getEntriesByStatus(
    String status,
  ) {
    return (select(journalEntries)
          ..where((t) => t.status.equals(status))
          ..orderBy([
            (t) => OrderingTerm.desc(t.entryDate),
          ]))
        .get();
  }

  // Get By Date Range
  Future<List<JournalEntryDb>> getEntriesByDateRange(
    DateTime from,
    DateTime to,
  ) {
    return (select(journalEntries)
          ..where(
            (t) =>
                t.entryDate.isBiggerOrEqualValue(from) &
                t.entryDate.isSmallerOrEqualValue(to),
          )
          ..orderBy([
            (t) => OrderingTerm.desc(t.entryDate),
          ]))
        .get();
  }

  // Delete Draft Only
  Future<int> deleteDraft(int id) {
    return (delete(journalEntries)
          ..where(
            (t) =>
                t.id.equals(id) &
                t.status.equals('draft'),
          ))
        .go();
  }
}