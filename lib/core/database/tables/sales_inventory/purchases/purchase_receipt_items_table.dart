
import 'package:drift/drift.dart';

import 'purchase_receipts_table.dart';
import 'purchase_items_table.dart';

@DataClassName('PurchaseReceiptItemDb')
class PurchaseReceiptItems extends Table {
  IntColumn get id => integer().autoIncrement()();

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

  // Product snapshot
  TextColumn get productName =>
      text().withLength(min: 1, max: 200)();

  TextColumn get unitName =>
      text().withDefault(const Constant('piece'))
          .withLength(min: 1, max: 50)();

  // Total received quantity
  RealColumn get quantity => real()();

  // Conversion to base unit
  RealColumn get conversionFactor =>
      real().withDefault(const Constant(1.0))();

  // Rejected quantity in purchase unit
  RealColumn get rejectedQuantity =>
      real().withDefault(const Constant(0.0))();

  TextColumn get notes => text().nullable()();

  @override
  List<String> get customConstraints => [
        'CHECK (quantity > 0)',
        'CHECK (conversion_factor > 0)',
        'CHECK (rejected_quantity >= 0)',
        'CHECK (rejected_quantity <= quantity)',
      ];

  @override
  List<Set<Column>> get uniqueKeys => [
        {purchaseReceiptId, purchaseItemId},
      ];
}
