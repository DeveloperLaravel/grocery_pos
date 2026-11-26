
import 'package:drift/drift.dart';

import '../../../tables/sales_inventory/purchases/purchase_receipt_items_table.dart';


part 'purchase_receipt_items_dao.g.dart';

@DriftAccessor(tables: [PurchaseReceiptItems])
class PurchaseReceiptItemsDao extends DatabaseAccessor<AppDatabase>
    with _$PurchaseReceiptItemsDaoMixin {
  PurchaseReceiptItemsDao(super.db);

  // Insert
  Future<int> insertItem(
    PurchaseReceiptItemsCompanion item,
  ) {
    return into(purchaseReceiptItems).insert(item);
  }

  // Insert Multiple
  Future<void> insertItems(
    List<PurchaseReceiptItemsCompanion> items,
  ) async {
    await batch((batch) {
      batch.insertAll(purchaseReceiptItems, items);
    });
  }

  // Update
  Future<bool> updateItem(
    PurchaseReceiptItemsCompanion item,
  ) {
    return update(purchaseReceiptItems).replace(item);
  }

  // Get By ID
  Future<PurchaseReceiptItemDb?> getById(int id) {
    return (select(purchaseReceiptItems)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  // Get By Receipt
  Future<List<PurchaseReceiptItemDb>> getByReceipt(
    int receiptId,
  ) {
    return (select(purchaseReceiptItems)
          ..where(
            (t) => t.purchaseReceiptId.equals(receiptId),
          )
          ..orderBy([
            (t) => OrderingTerm.asc(t.id),
          ]))
        .get();
  }

  // Watch By Receipt
  Stream<List<PurchaseReceiptItemDb>> watchByReceipt(
    int receiptId,
  ) {
    return (select(purchaseReceiptItems)
          ..where(
            (t) => t.purchaseReceiptId.equals(receiptId),
          )
          ..orderBy([
            (t) => OrderingTerm.asc(t.id),
          ]))
        .watch();
  }

  // Get Receipts By Purchase Item
  Future<List<PurchaseReceiptItemDb>> getByPurchaseItem(
    int purchaseItemId,
  ) {
    return (select(purchaseReceiptItems)
          ..where(
            (t) => t.purchaseItemId.equals(purchaseItemId),
          ))
        .get();
  }

  // Delete Item - Draft receipt only through business validation.
  Future<int> deleteItem(int id) {
    return (delete(purchaseReceiptItems)
          ..where((t) => t.id.equals(id)))
        .go();
  }

  // Delete All Items Of Receipt
  Future<int> deleteByReceipt(int receiptId) {
    return (delete(purchaseReceiptItems)
          ..where(
            (t) => t.purchaseReceiptId.equals(receiptId),
          ))
        .go();
  }
}
