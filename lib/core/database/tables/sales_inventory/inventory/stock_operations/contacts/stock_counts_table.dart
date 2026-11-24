
import 'package:drift/drift.dart';

import '../../../../inventory/stores_table.dart';

@DataClassName('StockCountDb')
class StockCounts extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get countNumber =>
      text().withLength(min: 1, max: 50)();

  IntColumn get storeId => integer()
      .references(Stores, #id)();

  DateTimeColumn get countDate => dateTime()();

  // full / partial
  TextColumn get countType =>
      text().withDefault(const Constant('full'))();

  // draft / counting / completed / posted / cancelled
  TextColumn get status =>
      text().withDefault(const Constant('draft'))();

  // Whether the store is frozen during counting
  BoolColumn get isStockFrozen =>
      boolean().withDefault(const Constant(false))();

  IntColumn get createdBy => integer().nullable()();

  IntColumn get countedBy => integer().nullable()();

  IntColumn get approvedBy => integer().nullable()();

  IntColumn get postedBy => integer().nullable()();

  DateTimeColumn get startedAt => dateTime().nullable()();

  DateTimeColumn get completedAt => dateTime().nullable()();

  DateTimeColumn get postedAt => dateTime().nullable()();

  TextColumn get notes => text().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  List<String> get customConstraints => [
    'CHECK (countType IN (\'full\', \'partial\'))',
    'CHECK (status IN (\'draft\', \'counting\', \'completed\', \'posted\', \'cancelled\'))',
  ];
}
