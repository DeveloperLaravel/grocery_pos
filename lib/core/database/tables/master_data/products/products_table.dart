
import 'package:drift/drift.dart';

import '../parties/brands_table.dart';
import '../parties/categories_table.dart';

@DataClassName('ProductDb')
class Products extends Table {
  // Primary Key
  IntColumn get id => integer().autoIncrement()();

  // Basic Information
  TextColumn get name => text().withLength(
        min: 1,
        max: 150,
      )();

  TextColumn get description => text().nullable()();

  // Classification
  IntColumn get categoryId => integer()
      .nullable()
      .references(
        Categories,
        #id,
        onDelete: KeyAction.setNull,
      )();

  IntColumn get brandId => integer()
      .nullable()
      .references(
        Brands,
        #id,
        onDelete: KeyAction.setNull,
      )();

  // Product Type
  TextColumn get productType =>
      text().withDefault(const Constant('piece'))();

  // Base Unit
  TextColumn get baseUnit =>
      text().withDefault(const Constant('piece'))();

  BoolColumn get allowDecimalQuantity =>
      boolean().withDefault(const Constant(false))();

  // Pricing
  RealColumn get costPrice =>
      real().withDefault(const Constant(0.0))();

  RealColumn get salePrice =>
      real().withDefault(const Constant(0.0))();

  // Inventory
  RealColumn get quantity =>
      real().withDefault(const Constant(0.0))();

  RealColumn get minStock =>
      real().withDefault(const Constant(5.0))();

  // Status
  BoolColumn get isActive =>
      boolean().withDefault(const Constant(true))();

  // Timestamps
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  List<String> get customConstraints => [
        'CHECK (costPrice >= 0)',
        'CHECK (salePrice >= 0)',
        'CHECK (quantity >= 0)',
        'CHECK (minStock >= 0)',
      ];
}
