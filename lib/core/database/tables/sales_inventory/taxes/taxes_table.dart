
import 'package:drift/drift.dart';

@DataClassName('TaxDb')
class Taxes extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get code => text().unique()();

  TextColumn get name => text()();

  RealColumn get rate => real()();

  TextColumn get taxType =>
      text().withDefault(const Constant('percentage'))();

  BoolColumn get isInclusive =>
      boolean().withDefault(const Constant(false))();

  BoolColumn get isActive =>
      boolean().withDefault(const Constant(true))();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  List<String> get customConstraints => [
        'CHECK (rate >= 0)',
      ];
}
