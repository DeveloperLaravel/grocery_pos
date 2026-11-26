
import 'package:drift/drift.dart';

import '../../master_data/parties/suppliers_table.dart';
import '../../master_data/products/products_table.dart';
import '../../master_data/products/product_units_table.dart';

@DataClassName('SupplierProductDb')
class SupplierProducts extends Table {
  // =====================================================
  // 1. Primary Key
  // =====================================================

  IntColumn get id => integer().autoIncrement()();

  // =====================================================
  // 2. Relationships
  // =====================================================

  IntColumn get supplierId => integer().references(
        Suppliers,
        #id,
        onDelete: KeyAction.restrict,
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

  // =====================================================
  // 3. Supplier Product Information
  // =====================================================

  TextColumn get supplierProductCode =>
      text().nullable().withLength(max: 100)();

  TextColumn get supplierBarcode =>
      text().nullable().withLength(max: 100)();

  // =====================================================
  // 4. Pricing
  // =====================================================

  RealColumn get purchasePrice =>
      real().withDefault(const Constant(0.0))();

  // Minimum quantity accepted by supplier

  RealColumn get minimumOrderQuantity =>
      real().withDefault(const Constant(1.0))();

  // 0 = unlimited

  RealColumn get maximumOrderQuantity =>
      real().withDefault(const Constant(0.0))();

  // =====================================================
  // 5. Delivery Information
  // =====================================================

  IntColumn get deliveryDays =>
      integer().withDefault(const Constant(0))();

  // =====================================================
  // 6. Preferences
  // =====================================================

  BoolColumn get isPreferred =>
      boolean().withDefault(const Constant(false))();

  BoolColumn get isActive =>
      boolean().withDefault(const Constant(true))();

  // =====================================================
  // 7. Purchase History
  // =====================================================

  DateTimeColumn get lastPurchaseAt =>
      dateTime().nullable()();

  RealColumn get lastPurchasedPrice =>
      real().withDefault(const Constant(0.0))();

  // =====================================================
  // 8. Additional Information
  // =====================================================

  TextColumn get notes => text().nullable()();

  // =====================================================
  // 9. Audit
  // =====================================================

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  // =====================================================
  // 10. Unique Relationship
  // =====================================================

  @override
  List<Set<Column>> get uniqueKeys => [
        {supplierId, productId},
      ];

  // =====================================================
  // 11. Constraints
  // =====================================================

  @override
  List<String> get customConstraints => [
        'CHECK (purchase_price >= 0)',
        'CHECK (minimum_order_quantity > 0)',
        'CHECK (maximum_order_quantity >= 0)',
        'CHECK (maximum_order_quantity = 0 OR '
            'maximum_order_quantity >= minimum_order_quantity)',
        'CHECK (delivery_days >= 0)',
        'CHECK (last_purchased_price >= 0)',
      ];
}
