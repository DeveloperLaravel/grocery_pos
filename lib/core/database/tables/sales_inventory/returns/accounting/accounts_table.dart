
import 'package:drift/drift.dart';

@DataClassName('AccountDb')
class Accounts extends Table {
  // Primary Key
  IntColumn get id => integer().autoIncrement()();

  // Account Information
  TextColumn get code => text().withLength(
        min: 1,
        max: 30,
      )();

  TextColumn get name => text().withLength(
        min: 1,
        max: 150,
      )();

  TextColumn get nameEn => text().nullable().withLength(
        max: 150,
      )();

  TextColumn get description => text().nullable()();

  // Account Classification
  TextColumn get accountType => text().withDefault(
        const Constant('asset'),
      )();

  // debit / credit
  TextColumn get normalBalance => text().withDefault(
        const Constant('debit'),
      )();

  // Parent Account (Self Relation)
  IntColumn get parentId => integer()
      .nullable()
      .references(
        Accounts,
        #id,
        onDelete: KeyAction.setNull,
      )();

  IntColumn get level => integer().withDefault(
        const Constant(1),
      )();

  // Group Account or Posting Account
  BoolColumn get isGroup => boolean().withDefault(
        const Constant(false),
      )();

  BoolColumn get allowPosting => boolean().withDefault(
        const Constant(true),
      )();

  // Status
  BoolColumn get isActive => boolean().withDefault(
        const Constant(true),
      )();

  // Audit
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().nullable()();

  @override
  List<String> get customConstraints => [
        'UNIQUE(code)',
        "CHECK (accountType IN ('asset', 'liability', 'equity', 'revenue', 'expense'))",
        "CHECK (normalBalance IN ('debit', 'credit'))",
        'CHECK (level >= 1)',
      ];
}
