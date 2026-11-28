
import 'package:drift/drift.dart';

@DataClassName('NumberSequenceDb')
@TableIndex(
  name: 'idx_number_sequences_key',
  columns: {#sequenceKey},
  unique: true,
)
class NumberSequences extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get sequenceKey =>
      text().withLength(min: 1, max: 100)();

  TextColumn get name =>
      text().withLength(min: 1, max: 150)();

  TextColumn get prefix =>
      text().nullable()();

  TextColumn get suffix =>
      text().nullable()();

  IntColumn get currentValue =>
      integer().withDefault(const Constant(0))();

  IntColumn get paddingLength =>
      integer().withDefault(const Constant(6))();

  IntColumn get startValue =>
      integer().withDefault(const Constant(1))();

  IntColumn get incrementBy =>
      integer().withDefault(const Constant(1))();

  BoolColumn get isActive =>
      boolean().withDefault(const Constant(true))();

  DateTimeColumn get lastGeneratedAt =>
      dateTime().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();
}
