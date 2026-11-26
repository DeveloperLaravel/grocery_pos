
import 'package:drift/drift.dart';

import 'purchase_receipts_table.dart';
import 'purchase_items_table.dart';

@DataClassName('PurchaseReceiptItemDb')
class PurchaseReceiptItems extends Table {
  // Primary Key
  IntColumn get id => integer().autoIncrement()();

  // Relationships
  IntColumn get purchaseReceiptId => integer().references(
        PurchaseReceipts,
        #id,
        onDelete: KeyAction.cascade,
      )();

  IntColumn get purchaseItemId => integer().references(
        PurchaseItems,
        #id,
        onDelete: KeyAction.restrict,
      )();

  // Received Quantity
  RealColumn get quantity => real()();

  // Rejected Quantity
  RealColumn get rejectedQuantity =>
      real().withDefault(const Constant(0.0))();

  // Additional
  TextColumn get notes => text().nullable()();

  @override
  List<String> get customConstraints => [
        'CHECK (quantity > 0)',
        'CHECK (rejectedQuantity >= 0)',
        'CHECK (rejectedQuantity <= quantity)',
      ];
}
