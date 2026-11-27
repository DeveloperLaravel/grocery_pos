import 'package:drift/drift.dart';

import '../../../tables/master_data/products/product_units_table.dart';
import '../../../tables/master_data/products/products_table.dart';
import 'pos_held_sales_table.dart';

@DataClassName('PosHeldSaleItemDb')
class PosHeldSaleItems extends Table {
  // Primary Key
  IntColumn get id => integer().autoIncrement()();

  // Held Sale Relationship
  IntColumn get heldSaleId => integer().references(
        PosHeldSales,
        #id,
        onDelete: KeyAction.cascade,
      )();

  // Product Relationship
  IntColumn get productId => integer().references(
        Products,
        #id,
        onDelete: KeyAction.restrict,
      )();

  // Product Unit
  IntColumn get productUnitId => integer()
      .nullable()
      .references(
        ProductUnits,
        #id,
        onDelete: KeyAction.setNull,
      )();

  // Product Snapshot
  TextColumn get productName => text()
      .withLength(min: 1, max: 150)();

  TextColumn get productCode => text().nullable()();

  TextColumn get barcode => text().nullable()();

  TextColumn get unitName => text()
      .withLength(min: 1, max: 50)();

  // Quantity
  RealColumn get quantity =>
      real()();

  // Conversion to Base Unit
  RealColumn get conversionFactor =>
      real().withDefault(const Constant(1))();

  RealColumn get baseQuantity =>
      real()();

  // Pricing
  RealColumn get unitPrice =>
      real()();

  RealColumn get baseUnitPrice =>
      real().withDefault(const Constant(0))();

  // Discount
  RealColumn get discountPercent =>
      real().withDefault(const Constant(0))();

  RealColumn get discountAmount =>
      real().withDefault(const Constant(0))();

  // Tax
  RealColumn get taxPercent =>
      real().withDefault(const Constant(0))();

  RealColumn get taxAmount =>
      real().withDefault(const Constant(0))();

  // Totals
  RealColumn get subtotal =>
      real().withDefault(const Constant(0))();

  RealColumn get total =>
      real().withDefault(const Constant(0))();

  // Item Ordering
  IntColumn get sortOrder =>
      integer().withDefault(const Constant(0))();

  // Notes
  TextColumn get notes => text().nullable()();

  // Audit
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().nullable()();
}