
import 'package:drift/drift.dart';

import 'stores_table.dart';

@DataClassName('StockTransferDb')
class StockTransfers extends Table {
  // Primary Key
  IntColumn get id => integer().autoIncrement()();

  // Transfer Number: TRF-000001
  TextColumn get transferNumber => text()
      .withLength(min: 1, max: 50)
      .unique()();

  // Source Store
  IntColumn get fromStoreId => integer().references(
        Stores,
        #id,
        onDelete: KeyAction.restrict,
      )();

  // Destination Store
  IntColumn get toStoreId => integer().references(
        Stores,
        #id,
        onDelete: KeyAction.restrict,
      )();

  // draft / approved / shipped /
  // partially_received / received / cancelled
  TextColumn get status => text()
      .withDefault(const Constant('draft'))
      .withLength(min: 3, max: 30)();

  // Transfer Information
  DateTimeColumn get transferDate =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get expectedArrivalDate => dateTime().nullable()();

  DateTimeColumn get shippedAt => dateTime().nullable()();

  DateTimeColumn get receivedAt => dateTime().nullable()();

  // Notes
  TextColumn get note => text().nullable()();

  // Users
  TextColumn get createdBy => text().nullable()();

  TextColumn get approvedBy => text().nullable()();

  TextColumn get shippedBy => text().nullable()();

  TextColumn get receivedBy => text().nullable()();

  // Timestamps
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  List<String> get customConstraints => [
        'CHECK (from_store_id != to_store_id)',

        '''
        CHECK (
          status IN (
            'draft',
            'approved',
            'shipped',
            'partially_received',
            'received',
            'cancelled'
          )
        )
        ''',
      ];
}
