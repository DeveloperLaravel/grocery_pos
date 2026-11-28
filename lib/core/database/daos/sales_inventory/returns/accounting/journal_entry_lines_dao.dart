import 'package:drift/drift.dart';

import '../../../../app_database.dart';
import '../../../../tables/sales_inventory/returns/accounting/journal_entries_table.dart';
import '../../../../tables/sales_inventory/returns/accounting/journal_entry_lines_table.dart';


part 'journal_entry_lines_dao.g.dart';

@DriftAccessor(tables: [JournalEntries, JournalEntryLines])
class JournalEntryLinesDao
    extends DatabaseAccessor<AppDatabase>
    with _$JournalEntryLinesDaoMixin {
  JournalEntryLinesDao(super.db);

  // Insert Line
  Future<int> insertLine(
    JournalEntryLinesCompanion line,
  ) {
    return into(journalEntryLines).insert(line);
  }

  // Insert Multiple Lines
  Future<void> insertLines(
    List<JournalEntryLinesCompanion> lines,
  ) async {
    await batch((batch) {
      batch.insertAll(journalEntryLines, lines);
    });
  }

  // Get Lines By Entry
  Future<List<JournalEntryLineDb>> getLinesByEntry(
    int entryId,
  ) {
    return (select(journalEntryLines)
          ..where(
            (t) => t.journalEntryId.equals(entryId),
          )
          ..orderBy([
            (t) => OrderingTerm.asc(t.lineNumber),
          ]))
        .get();
  }

  // Watch Lines
  Stream<List<JournalEntryLineDb>> watchLinesByEntry(
    int entryId,
  ) {
    return (select(journalEntryLines)
          ..where(
            (t) => t.journalEntryId.equals(entryId),
          )
          ..orderBy([
            (t) => OrderingTerm.asc(t.lineNumber),
          ]))
        .watch();
  }

  // Delete Lines Of Draft
  Future<int> deleteLinesByEntry(int entryId) async {
    final entry = await (select(journalEntries)
          ..where((t) => t.id.equals(entryId)))
        .getSingleOrNull();

    if (entry == null || entry.status != 'draft') {
      throw StateError(
        'لا يمكن حذف تفاصيل قيد غير موجود أو غير مسودة',
      );
    }

    return (delete(journalEntryLines)
          ..where(
            (t) => t.journalEntryId.equals(entryId),
          ))
        .go();
  }

  // Calculate Total Debit
  Future<int> getTotalDebit(int entryId) async {
    final debitTotal = journalEntryLines.debitAmount.sum();
    final query = selectOnly(journalEntryLines)
      ..addColumns([
        debitTotal,
      ])
      ..where(
        journalEntryLines.journalEntryId.equals(entryId),
      );

    final result = await query.getSingle();
    return result.read(debitTotal) ?? 0;
  }

  // Calculate Total Credit
  Future<int> getTotalCredit(int entryId) async {
    final creditTotal = journalEntryLines.creditAmount.sum();
    final query = selectOnly(journalEntryLines)
      ..addColumns([
        creditTotal,
      ])
      ..where(
        journalEntryLines.journalEntryId.equals(entryId),
      );

    final result = await query.getSingle();
    return result.read(creditTotal) ?? 0;
  }
}