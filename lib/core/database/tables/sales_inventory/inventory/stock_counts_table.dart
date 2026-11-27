
import 'package:drift/drift.dart';

import 'stores_table.dart';

@DataClassName('StockCountDb')
class StockCounts extends Table {
  // Primary Key
  IntColumn get id => integer().autoIncrement()();

  // Count Number: CNT-000001
  TextColumn get countNumber => text()
      .withLength(min: 1, max: 50)
      .unique()();

  // Store Relationship
  IntColumn get storeId => integer().references(
        Stores,
        #id,
        onDelete: KeyAction.restrict,
      )();

  // draft / in_progress / completed /
  // approved / applied / cancelled
  TextColumn get status => text()
      .withDefault(const Constant('draft'))
      .withLength(min: 3, max: 30)();

  // Count Dates
  DateTimeColumn get countDate =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get startedAt => dateTime().nullable()();

  DateTimeColumn get completedAt => dateTime().nullable()();

  DateTimeColumn get approvedAt => dateTime().nullable()();

  DateTimeColumn get appliedAt => dateTime().nullable()();

  // Count Settings
  BoolColumn get isBlindCount =>
      boolean().withDefault(const Constant(false))();

  BoolColumn get freezeStock =>
      boolean().withDefault(const Constant(false))();

  // Notes
  TextColumn get note => text().nullable()();

  // Users
  TextColumn get createdBy => text().nullable()();

  TextColumn get countedBy => text().nullable()();

  TextColumn get approvedBy => text().nullable()();

  TextColumn get appliedBy => text().nullable()();

  // Timestamps
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  List<String> get customConstraints => [
        '''
        CHECK (
          status IN (
            'draft',
            'in_progress',
            'completed',
            'approved',
            'applied',
            'cancelled'
          )
        )
        ''',
      ];
}
