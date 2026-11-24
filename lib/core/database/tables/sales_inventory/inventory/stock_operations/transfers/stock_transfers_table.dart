
import 'package:drift/drift.dart';

import '../../../../inventory/stores_table.dart';

@DataClassName('StockTransferDb')
class StockTransfers extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get transferNumber =>
      text().withLength(min: 1, max: 50)();

  IntColumn get sourceStoreId => integer()
      .references(Stores, #id)();

  IntColumn get destinationStoreId => integer()
      .references(Stores, #id)();

  DateTimeColumn get transferDate => dateTime()();

  // draft / posted / cancelled
  TextColumn get status =>
      text().withDefault(const Constant('draft'))();

  TextColumn get notes => text().nullable()();

  IntColumn get createdBy => integer().nullable()();

  IntColumn get postedBy => integer().nullable()();

  DateTimeColumn get postedAt => dateTime().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  List<String> get customConstraints => [
    'CHECK (sourceStoreId != destinationStoreId)',
    'CHECK (status IN (\'draft\', \'posted\', \'cancelled\'))',
  ];
}
