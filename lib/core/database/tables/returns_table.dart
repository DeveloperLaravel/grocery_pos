
import 'package:drift/drift.dart';

import 'sales_table.dart';

@DataClassName('ReturnDb')
class Returns extends Table {
  // Primary Key
  IntColumn get id => integer().autoIncrement()();

  // Sale Relationship
  IntColumn get saleId => integer().references(
        Sales,
        #id,
        onDelete: KeyAction.cascade,
      )();

  // Return Total
  RealColumn get total => real()();

  // Return Date
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
}
