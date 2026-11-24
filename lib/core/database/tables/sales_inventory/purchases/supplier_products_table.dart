
import 'package:drift/drift.dart';

import '../../master_data/parties/suppliers_table.dart';
import '../../master_data/products/products_table.dart';
import '../../master_data/products/product_units_table.dart';

@DataClassName('SupplierProductDb')
class SupplierProducts extends Table {
  IntColumn get id => integer().autoIncrement()();

  // Relationships
  IntColumn get supplierId => integer().references(
        Suppliers,
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
        onDelete: KeyAction.setNull,
      )();

  // Supplier Product Information
  TextColumn get supplierProductCode =>
      text().nullable().withLength(max: 100)();

  TextColumn get supplierBarcode =>
      text().nullable().withLength(max: 100)();

  // Pricing
  RealColumn get purchasePrice =>
      real().withDefault(const Constant(0.0))();

  RealColumn get minimumOrderQuantity =>
      real().withDefault(const Constant(1.0))();

  RealColumn get maximumOrderQuantity =>
      real().withDefault(const Constant(0.0))();

  // Delivery
  IntColumn get deliveryDays =>
      integer().withDefault(const Constant(0))();

  // Preferences
  BoolColumn get isPreferred =>
      boolean().withDefault(const Constant(false))();

  BoolColumn get isActive =>
      boolean().withDefault(const Constant(true))();

  // Purchase History
  DateTimeColumn get lastPurchaseAt => dateTime().nullable()();

  RealColumn get lastPurchasedPrice =>
      real().withDefault(const Constant(0.0))();

  // Notes
  TextColumn get notes => text().nullable()();

  // Timestamps
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  // Prevent duplicate supplier-product-unit combinations.
  @override
  List<Set<Column>> get uniqueKeys => [
        {supplierId, productId, productUnitId},
      ];
}
