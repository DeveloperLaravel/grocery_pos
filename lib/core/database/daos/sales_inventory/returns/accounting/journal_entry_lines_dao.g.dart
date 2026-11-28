// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal_entry_lines_dao.dart';

// ignore_for_file: type=lint
mixin _$JournalEntryLinesDaoMixin on DatabaseAccessor<AppDatabase> {
  $JournalEntriesTable get journalEntries => attachedDatabase.journalEntries;
  $JournalEntryLinesTable get journalEntryLines =>
      attachedDatabase.journalEntryLines;
  JournalEntryLinesDaoManager get managers => JournalEntryLinesDaoManager(this);
}

class JournalEntryLinesDaoManager {
  final _$JournalEntryLinesDaoMixin _db;
  JournalEntryLinesDaoManager(this._db);
  $$JournalEntriesTableTableManager get journalEntries =>
      $$JournalEntriesTableTableManager(
          _db.attachedDatabase, _db.journalEntries);
  $$JournalEntryLinesTableTableManager get journalEntryLines =>
      $$JournalEntryLinesTableTableManager(
          _db.attachedDatabase, _db.journalEntryLines);
}
