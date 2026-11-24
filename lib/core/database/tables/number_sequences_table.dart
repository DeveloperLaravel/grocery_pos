
import 'package:drift/drift.dart';

@DataClassName('NumberSequenceDb')
class NumberSequences extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get sequenceType => text()();

  TextColumn get prefix =>
      text().withDefault(const Constant(''))();

  IntColumn get currentValue =>
      integer().withDefault(const Constant(0))();

  IntColumn get paddingLength =>
      integer().withDefault(const Constant(6))();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  List<Set<Column>> get uniqueKeys => [
        {sequenceType},
      ];
}
