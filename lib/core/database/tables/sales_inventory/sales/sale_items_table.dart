
import 'package:drift/drift.dart';

import '../../master_data/products/products_table.dart';
import '../../master_data/products/product_units_table.dart';
import 'sales_table.dart';

@DataClassName('SaleItemDb')
class SaleItems extends Table {
  // =========================================
  // 1. Primary Key
  // =========================================

  IntColumn get id => integer().autoIncrement()();

  // =========================================
  // 2. Relationships
  // =========================================

  IntColumn get saleId => integer().references(
        Sales,
        #id,
        onDelete: KeyAction.cascade,
      )();

  IntColumn get productId => integer().references(
        Products,
        #id,
        onDelete: KeyAction.restrict,
      )();

  IntColumn get productUnitId => integer()
      .nullable()
      .references(
        ProductUnits,
        #id,
        onDelete: KeyAction.restrict,
      )();

  // =========================================
  // 3. Product Snapshot
  // =========================================

  TextColumn get productName =>
      text().withLength(min: 1, max: 200)();

  TextColumn get barcode => text().nullable()();

  TextColumn get unitName =>
      text().withLength(min: 1, max: 100)();

  // =========================================
  // 4. Quantity & Conversion
  // =========================================

  // Quantity entered by cashier.
  RealColumn get quantity =>
      real().withDefault(const Constant(1.0))();

  // Conversion to base unit.
  RealColumn get conversionFactor =>
      real().withDefault(const Constant(1.0))();

  // Quantity converted to base unit.
  RealColumn get baseQuantity =>
      real().withDefault(const Constant(1.0))();

  // =========================================
  // 5. Prices
  // =========================================

  // Selling price per selected unit.
  RealColumn get unitPrice =>
      real().withDefault(const Constant(0.0))();

  // Cost price at time of sale.
  RealColumn get costPrice =>
      real().withDefault(const Constant(0.0))();

  // =========================================
  // 6. Discounts & Taxes
  // =========================================

  RealColumn get discountPercentage =>
      real().withDefault(const Constant(0.0))();

  RealColumn get discountAmount =>
      real().withDefault(const Constant(0.0))();

  RealColumn get taxPercentage =>
      real().withDefault(const Constant(0.0))();

  RealColumn get taxAmount =>
      real().withDefault(const Constant(0.0))();

  // =========================================
  // 7. Totals
  // =========================================

  // quantity * unitPrice before discount and tax.
  RealColumn get subtotal =>
      real().withDefault(const Constant(0.0))();

  // Final line amount.
  RealColumn get total =>
      real().withDefault(const Constant(0.0))();

  // =========================================
  // 8. Additional Information
  // =========================================

  TextColumn get note => text().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
}
