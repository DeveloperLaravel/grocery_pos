
import 'package:drift/drift.dart';

import '../parties/brands_table.dart';
import '../parties/categories_table.dart';

@DataClassName('ProductDb')
class Products extends Table {
  // =====================================================
  // 1. Primary Key
  // =====================================================

  IntColumn get id => integer().autoIncrement()();

  // =====================================================
  // 2. Basic Information
  // =====================================================

  TextColumn get name => text().withLength(
        min: 1,
        max: 150,
      )();

  TextColumn get description => text().nullable()();

  // =====================================================
  // 3. Classification
  // =====================================================

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

  // =====================================================
  // 4. Product Type
  // =====================================================

  // piece / weight / volume

  TextColumn get productType =>
      text().withDefault(const Constant('piece'))();

  // =====================================================
  // 5. Base Unit
  // =====================================================

  // piece / kg / g / liter / ml

  TextColumn get baseUnit =>
      text().withDefault(const Constant('piece'))();

  BoolColumn get allowDecimalQuantity =>
      boolean().withDefault(const Constant(false))();

  // =====================================================
  // 6. Pricing
  // =====================================================

  RealColumn get costPrice =>
      real().withDefault(const Constant(0.0))();

  RealColumn get salePrice =>
      real().withDefault(const Constant(0.0))();

  // =====================================================
  // 7. Status
  // =====================================================

  BoolColumn get isActive =>
      boolean().withDefault(const Constant(true))();

  // =====================================================
  // 8. Timestamps
  // =====================================================

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  // =====================================================
  // 9. Constraints
  // =====================================================

  @override
  List<String> get customConstraints => [
        'CHECK (costPrice >= 0)',
        'CHECK (salePrice >= 0)',
        "CHECK (productType IN ('piece', 'weight', 'volume'))",
      ];
}
