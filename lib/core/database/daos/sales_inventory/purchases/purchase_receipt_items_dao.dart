
import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../tables/sales_inventory/purchases/purchase_receipt_items_table.dart';

part 'purchase_receipt_items_dao.g.dart';

@DriftAccessor(
  tables: [PurchaseReceiptItems],
)
class PurchaseReceiptItemsDao extends DatabaseAccessor<AppDatabase>
    with _$PurchaseReceiptItemsDaoMixin {
  PurchaseReceiptItemsDao(super.db);

  // =========================================================
  // GET ALL
  // =========================================================

  Future<List<PurchaseReceiptItemDb>> getAllReceiptItems() {
    return (select(purchaseReceiptItems)
          ..orderBy([
            (t) => OrderingTerm(
                  expression: t.id,
                  mode: OrderingMode.desc,
                ),
          ]))
        .get();
  }

  // =========================================================
  // GET BY ID
  // =========================================================

  Future<PurchaseReceiptItemDb?> getReceiptItemById(int id) {
    return (select(purchaseReceiptItems)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  // =========================================================
  // GET BY RECEIPT ID
  // =========================================================

  Future<List<PurchaseReceiptItemDb>> getItemsByReceiptId(
    int receiptId,
  ) {
    return (select(purchaseReceiptItems)
          ..where((t) => t.purchaseReceiptId.equals(receiptId))
          ..orderBy([
            (t) => OrderingTerm(expression: t.id),
          ]))
        .get();
  }

  Stream<List<PurchaseReceiptItemDb>> watchItemsByReceiptId(
    int receiptId,
  ) {
    return (select(purchaseReceiptItems)
          ..where((t) => t.purchaseReceiptId.equals(receiptId))
          ..orderBy([
            (t) => OrderingTerm(expression: t.id),
          ]))
        .watch();
  }

  // =========================================================
  // GET BY PURCHASE ITEM ID
  // =========================================================

  Future<List<PurchaseReceiptItemDb>> getItemsByPurchaseItemId(
    int purchaseItemId,
  ) {
    return (select(purchaseReceiptItems)
          ..where((t) => t.purchaseItemId.equals(purchaseItemId))
          ..orderBy([
            (t) => OrderingTerm(expression: t.id),
          ]))
        .get();
  }

  Stream<List<PurchaseReceiptItemDb>> watchItemsByPurchaseItemId(
    int purchaseItemId,
  ) {
    return (select(purchaseReceiptItems)
          ..where((t) => t.purchaseItemId.equals(purchaseItemId))
          ..orderBy([
            (t) => OrderingTerm(expression: t.id),
          ]))
        .watch();
  }

  // =========================================================
  // INSERT
  // =========================================================

  Future<int> insertReceiptItem(
    PurchaseReceiptItemsCompanion entry,
  ) {
    return into(purchaseReceiptItems).insert(entry);
  }

  // =========================================================
  // INSERT MANY
  // =========================================================

  Future<void> insertReceiptItems(
    List<PurchaseReceiptItemsCompanion> entries,
  ) async {
    if (entries.isEmpty) return;

    await transaction(() async {
      await batch((batch) {
        batch.insertAll(purchaseReceiptItems, entries);
      });
    });
  }

  // =========================================================
  // UPDATE
  // =========================================================

  Future<bool> updateReceiptItem(
    int id,
    PurchaseReceiptItemsCompanion entry,
  ) async {
    final rows = await (update(purchaseReceiptItems)
          ..where((t) => t.id.equals(id)))
        .write(entry);

    return rows > 0;
  }

  // =========================================================
  // UPDATE REJECTED QUANTITY
  // =========================================================

  Future<bool> updateRejectedQuantity({
    required int id,
    required double quantity,
  }) async {
    if (!quantity.isFinite || quantity < 0) {
      throw ArgumentError(
        'Rejected quantity must be a finite non-negative number.',
      );
    }

    return transaction(() async {
      final item = await getReceiptItemById(id);

      if (item == null) return false;

      if (quantity > item.quantity) {
        throw ArgumentError(
          'Rejected quantity cannot exceed received quantity.',
        );
      }

      final rows = await (update(purchaseReceiptItems)
            ..where((t) => t.id.equals(id)))
          .write(
        PurchaseReceiptItemsCompanion(
          rejectedQuantity: Value(quantity),
        ),
      );

      return rows > 0;
    });
  }

  // =========================================================
  // DELETE
  // =========================================================

  Future<int> deleteReceiptItem(int id) {
    return (delete(purchaseReceiptItems)
          ..where((t) => t.id.equals(id)))
        .go();
  }

  // =========================================================
  // DELETE BY RECEIPT ID
  // =========================================================

  Future<int> deleteItemsByReceiptId(int receiptId) {
    return (delete(purchaseReceiptItems)
          ..where(
            (t) => t.purchaseReceiptId.equals(receiptId),
          ))
        .go();
  }

  // =========================================================
  // TOTAL RECEIVED QUANTITY
  // =========================================================

  Future<double> getTotalReceivedQuantity(
    int purchaseItemId,
  ) async {
    final total = purchaseReceiptItems.quantity.sum();

    final query = selectOnly(purchaseReceiptItems)
      ..addColumns([total])
      ..where(
        purchaseReceiptItems.purchaseItemId.equals(purchaseItemId),
      );

    return await query
        .map((row) => row.read(total) ?? 0.0)
        .getSingle();
  }

  // =========================================================
  // TOTAL REJECTED QUANTITY
  // =========================================================

  Future<double> getTotalRejectedQuantity(
    int purchaseItemId,
  ) async {
    final total = purchaseReceiptItems.rejectedQuantity.sum();

    final query = selectOnly(purchaseReceiptItems)
      ..addColumns([total])
      ..where(
        purchaseReceiptItems.purchaseItemId.equals(purchaseItemId),
      );

    return await query
        .map((row) => row.read(total) ?? 0.0)
        .getSingle();
  }

  // =========================================================
  // TOTAL ACCEPTED QUANTITY
  // =========================================================

  Future<double> getTotalAcceptedQuantity(
    int purchaseItemId,
  ) async {
    final received = await getTotalReceivedQuantity(
      purchaseItemId,
    );

    final rejected = await getTotalRejectedQuantity(
      purchaseItemId,
    );

    return received - rejected;
  }

  // =========================================================
  // COUNT
  // =========================================================

  Future<int> getReceiptItemsCount(int receiptId) async {
    final count = purchaseReceiptItems.id.count();

    final query = selectOnly(purchaseReceiptItems)
      ..addColumns([count])
      ..where(
        purchaseReceiptItems.purchaseReceiptId.equals(receiptId),
      );

    return await query
        .map((row) => row.read(count) ?? 0)
        .getSingle();
  }
}
