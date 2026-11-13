
import 'package:drift/drift.dart';

import 'sales_table.dart';

@DataClassName('ReturnDb')
class Returns extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get saleId => integer().references(
        Sales,
        #id,
        onDelete: KeyAction.cascade,
      )();

  RealColumn get total => real()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
}
