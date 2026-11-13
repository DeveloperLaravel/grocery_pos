
import 'package:drift/drift.dart';

@DataClassName('ProductDb')
class Products extends Table {
  // Primary Key
  IntColumn get id => integer().autoIncrement()();

  // Product Information
  TextColumn get name => text().withLength(
        min: 1,
        max: 150,
      )();

  TextColumn get barcode => text()
      .unique()
      .withLength(
        min: 1,
        max: 100,
      )();

  // Pricing
  RealColumn get costPrice => real().withDefault(
        const Constant(0.0),
      )();

  RealColumn get salePrice => real()();

  // Inventory
  RealColumn get quantity => real().withDefault(
        const Constant(0.0),
      )();

  RealColumn get minStock => real().withDefault(
        const Constant(5.0),
      )();

  // Timestamps
  DateTimeColumn get createdAt => dateTime().withDefault(
        currentDateAndTime,
      )();

  DateTimeColumn get updatedAt => dateTime().withDefault(
        currentDateAndTime,
      )();

  @override
  Set<Column> get primaryKey => {id};
}
