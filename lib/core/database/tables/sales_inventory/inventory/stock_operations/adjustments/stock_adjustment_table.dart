
import 'package:drift/drift.dart';

import '../../../../inventory/stores_table.dart';


@DataClassName('StockAdjustmentDb')
class StockAdjustments extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get adjustmentNumber =>
      text().withLength(min: 1, max: 50)();

  IntColumn get storeId => integer()
      .references(Stores, #id)();

  DateTimeColumn get adjustmentDate => dateTime()();

  // damage / loss / surplus / correction / other
  TextColumn get adjustmentType => text().withLength(
        min: 1,
        max: 30,
      )();

  // draft / posted / cancelled
  TextColumn get status =>
      text().withDefault(const Constant('draft'))();

  TextColumn get reason => text().nullable()();

  TextColumn get notes => text().nullable()();

  RealColumn get totalIncrease =>
      real().withDefault(const Constant(0))();

  RealColumn get totalDecrease =>
      real().withDefault(const Constant(0))();

  IntColumn get createdBy => integer().nullable()();

  IntColumn get approvedBy => integer().nullable()();

  IntColumn get postedBy => integer().nullable()();

  DateTimeColumn get postedAt => dateTime().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  List<String> get customConstraints => [
    'CHECK (status IN (\'draft\', \'posted\', \'cancelled\'))',
    'CHECK (totalIncrease >= 0)',
    'CHECK (totalDecrease >= 0)',
  ];
}
