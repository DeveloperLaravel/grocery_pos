
import 'package:drift/drift.dart';

import 'purchase_receipts_table.dart';
import 'purchase_items_table.dart';

@DataClassName('PurchaseReceiptItemDb')
class PurchaseReceiptItems extends Table {
  // =====================================================
  // 1. Primary Key
  // =====================================================

  IntColumn get id => integer().autoIncrement()();

  // =====================================================
  // 2. Relationships
  // =====================================================

  IntColumn get purchaseReceiptId => integer().references(
        PurchaseReceipts,
        #id,
        onDelete: KeyAction.restrict,
      )();

  IntColumn get purchaseItemId => integer().references(
        PurchaseItems,
        #id,
        onDelete: KeyAction.restrict,
      )();

  // =====================================================
  // 3. Product Snapshot
  // =====================================================

  TextColumn get productName => text()
      .withLength(min: 1, max: 200)();

  TextColumn get unitName => text()
      .withDefault(const Constant('piece'))
      .withLength(min: 1, max: 50)();

  // =====================================================
  // 4. Received Quantity
  // =====================================================

  // Total received quantity, including rejected quantity.

  RealColumn get quantity => real()();

  // Conversion to base product unit.

  RealColumn get conversionFactor =>
      real().withDefault(const Constant(1.0))();

  // Rejected quantity in purchase unit.

  RealColumn get rejectedQuantity =>
      real().withDefault(const Constant(0.0))();

  // =====================================================
  // 5. Additional Information
  // =====================================================

  TextColumn get notes => text().nullable()();

  // =====================================================
  // 6. Constraints
  // =====================================================

  @override
  List<String> get customConstraints => [
        'CHECK (quantity > 0)',
        'CHECK (conversion_factor > 0)',
        'CHECK (rejected_quantity >= 0)',
        'CHECK (rejected_quantity <= quantity)',
      ];

  // =====================================================
  // 7. Unique Relationship
  // =====================================================

  @override
  List<Set<Column>> get uniqueKeys => [
        {purchaseReceiptId, purchaseItemId},
      ];
}
