
import 'package:drift/drift.dart';

@DataClassName('StoreDb')
class Stores extends Table {
  // Primary Key
  IntColumn get id => integer().autoIncrement()();

  // Store Information
  TextColumn get storeCode => text()
      .nullable()
      .unique()
      .withLength(max: 30)();

  TextColumn get name => text().withLength(
        min: 2,
        max: 150,
      )();

  TextColumn get description => text().nullable()();

  // Contact Information
  TextColumn get phone => text().nullable().withLength(max: 30)();

  TextColumn get email => text().nullable().withLength(max: 150)();

  TextColumn get address => text().nullable()();

  TextColumn get city => text().nullable().withLength(max: 100)();

  // Store Settings
  BoolColumn get isMain => boolean().withDefault(const Constant(false))();

  BoolColumn get isActive => boolean().withDefault(const Constant(true))();

  // Notes
  TextColumn get notes => text().nullable()();

  // Timestamps
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().nullable()();

  @override
  List<Set<Column>> get uniqueKeys => [
        {name},
      ];
}
