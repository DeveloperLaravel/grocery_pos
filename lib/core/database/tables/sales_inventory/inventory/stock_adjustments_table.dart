
import 'package:drift/drift.dart';

import 'stores_table.dart';

@DataClassName('StockAdjustmentDb')
class StockAdjustments extends Table {
  // Primary Key
  IntColumn get id => integer().autoIncrement()();

  // Adjustment Number: ADJ-000001
  TextColumn get adjustmentNumber => text()
      .withLength(min: 1, max: 50)
      .unique()();

  // Store Relationship
  IntColumn get storeId => integer().references(
        Stores,
        #id,
        onDelete: KeyAction.restrict,
      )();

  // increase / decrease
  TextColumn get adjustmentType => text().withLength(
        min: 3,
        max: 20,
      )();

  // draft / approved / applied / cancelled
  TextColumn get status => text()
      .withDefault(const Constant('draft'))
      .withLength(min: 3, max: 20)();

  // Adjustment Reason
  // damage / loss / found / correction / expired / other
  TextColumn get reasonType => text().withLength(
        min: 2,
        max: 30,
      )();

  // Dates
  DateTimeColumn get adjustmentDate =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get approvedAt => dateTime().nullable()();

  DateTimeColumn get appliedAt => dateTime().nullable()();

  // Notes
  TextColumn get note => text().nullable()();

  // Users
  TextColumn get createdBy => text().nullable()();

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
          adjustment_type IN (
            'increase',
            'decrease'
          )
        )
        ''',

        '''
        CHECK (
          status IN (
            'draft',
            'approved',
            'applied',
            'cancelled'
          )
        )
        ''',

        '''
        CHECK (
          reason_type IN (
            'damage',
            'loss',
            'found',
            'correction',
            'expired',
            'other'
          )
        )
        ''',
      ];
}
