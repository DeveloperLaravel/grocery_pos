
import 'package:drift/drift.dart';

@DataClassName('JournalEntryDb')
class JournalEntries extends Table {
  // Primary Key
  IntColumn get id => integer().autoIncrement()();

  // Entry Number
  TextColumn get entryNumber => text().withLength(
        min: 1,
        max: 50,
      )();

  // Entry Date
  DateTimeColumn get entryDate =>
      dateTime()();

  // Description
  TextColumn get description => text()();

  TextColumn get referenceNumber =>
      text().nullable().withLength(max: 100)();

  // Source Integration
  // sale / purchase / expense / payment / return / manual
  TextColumn get sourceType => text()
      .withDefault(const Constant('manual'))();

  IntColumn get sourceId => integer().nullable()();

  // draft / posted / reversed
  TextColumn get status => text().withDefault(
        const Constant('draft'),
      )();

  // Amounts are stored in millimes (1 LYD = 1000)
  IntColumn get totalDebit => integer().withDefault(
        const Constant(0),
      )();

  IntColumn get totalCredit => integer().withDefault(
        const Constant(0),
      )();

  // Reversal
  IntColumn get reversedEntryId => integer()
      .nullable()
      .references(
        JournalEntries,
        #id,
        onDelete: KeyAction.setNull,
      )();

  BoolColumn get isReversal => boolean().withDefault(
        const Constant(false),
      )();

  // Users
  IntColumn get createdBy => integer().nullable()();

  IntColumn get postedBy => integer().nullable()();

  DateTimeColumn get postedAt => dateTime().nullable()();

  // Notes
  TextColumn get notes => text().nullable()();

  // Timestamps
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().nullable()();

  @override
  List<String> get customConstraints => [
        'UNIQUE(entryNumber)',
        "CHECK (status IN ('draft', 'posted', 'reversed'))",
        "CHECK (sourceType IN ('manual', 'sale', 'purchase', 'expense', 'payment', 'return', 'opening_balance', 'adjustment'))",
        'CHECK (totalDebit >= 0)',
        'CHECK (totalCredit >= 0)',
      ];
}
