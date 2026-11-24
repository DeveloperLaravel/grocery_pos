
import 'package:drift/drift.dart';

import 'purchase_receipts_table.dart';
import '../../master_data/products/products_table.dart';
import '../../master_data/products/product_units_table.dart';

@DataClassName('PurchaseReceiptItemDb')
class PurchaseReceiptItems extends Table {
  IntColumn get id => integer().autoIncrement()();

  // Receipt Relationship
  IntColumn get receiptId => integer().references(
        PurchaseReceipts,
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
        onDelete: KeyAction.restrict,
      )();

  // Received Quantity
  RealColumn get receivedQuantity =>
      real().withDefault(const Constant(0.0))();

  // Unit Purchase Price
  RealColumn get unitCost =>
      real().withDefault(const Constant(0.0))();

  // Notes
  TextColumn get notes => text().nullable()();

  // Timestamps
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();
}
