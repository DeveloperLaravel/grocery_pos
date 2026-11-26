
import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../tables/sales_inventory/purchases/purchase_receipt_items_table.dart';
import '../../../tables/sales_inventory/purchases/purchase_receipts_table.dart';

part 'purchase_receipts_dao.g.dart';

@DriftAccessor(
  tables: [
    PurchaseReceipts,
    PurchaseReceiptItems,
  ],
)
class PurchaseReceiptsDao extends DatabaseAccessor<AppDatabase>
    with _$PurchaseReceiptsDaoMixin {
  PurchaseReceiptsDao(super.db);

  // =====================================================
  // INSERT RECEIPT
  // =====================================================

  Future<int> insertReceipt(
    PurchaseReceiptsCompanion receipt,
  ) {
    return into(purchaseReceipts).insert(receipt);
  }

  // =====================================================
  // INSERT RECEIPT WITH ITEMS
  // =====================================================

  Future<int> createReceiptWithItems({
    required PurchaseReceiptsCompanion receipt,
    required List<PurchaseReceiptItemsCompanion> items,
  }) {
    return attachedDatabase.transaction(() async {
      final receiptId = await into(purchaseReceipts).insert(receipt);

      for (final item in items) {
        await into(purchaseReceiptItems).insert(
          item.copyWith(
            purchaseReceiptId: Value(receiptId),
          ),
        );
      }

      return receiptId;
    });
  }

  // =====================================================
  // UPDATE RECEIPT
  // =====================================================

  Future<bool> updateReceipt(
    int id,
    PurchaseReceiptsCompanion receipt,
  ) async {
    final updated = await (update(purchaseReceipts)
          ..where((t) => t.id.equals(id)))
        .write(
      receipt.copyWith(
        updatedAt: Value(DateTime.now()),
      ),
    );

    return updated > 0;
  }

  // =====================================================
  // CANCEL RECEIPT
  // =====================================================

  Future<bool> cancelReceipt(int id) async {
    final updated = await (update(purchaseReceipts)
          ..where((t) => t.id.equals(id))
          ..where((t) => t.status.equals('draft')))
        .write(
      PurchaseReceiptsCompanion(
        status: const Value('cancelled'),
        updatedAt: Value(DateTime.now()),
      ),
    );

    return updated > 0;
  }

  // =====================================================
  // GET RECEIPT
  // =====================================================

  Future<PurchaseReceiptDb?> getReceiptById(int id) {
    return (select(purchaseReceipts)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  // =====================================================
  // GET ALL
  // =====================================================

  Future<List<PurchaseReceiptDb>> getAllReceipts() {
    return (select(purchaseReceipts)
          ..orderBy([
            (t) => OrderingTerm.desc(t.receivedAt),
          ]))
        .get();
  }

  // =====================================================
  // WATCH ALL
  // =====================================================

  Stream<List<PurchaseReceiptDb>> watchAllReceipts() {
    return (select(purchaseReceipts)
          ..orderBy([
            (t) => OrderingTerm.desc(t.receivedAt),
          ]))
        .watch();
  }

  // =====================================================
  // GET BY PURCHASE ORDER
  // =====================================================

  Future<List<PurchaseReceiptDb>> getReceiptsByOrder(
    int orderId,
  ) {
    return (select(purchaseReceipts)
          ..where((t) => t.purchaseOrderId.equals(orderId))
          ..orderBy([
            (t) => OrderingTerm.desc(t.receivedAt),
          ]))
        .get();
  }

  // =====================================================
  // WATCH BY PURCHASE ORDER
  // =====================================================

  Stream<List<PurchaseReceiptDb>> watchReceiptsByOrder(
    int orderId,
  ) {
    return (select(purchaseReceipts)
          ..where((t) => t.purchaseOrderId.equals(orderId)))
        .watch();
  }

  // =====================================================
  // GET RECEIPT ITEMS
  // =====================================================

  Future<List<PurchaseReceiptItemDb>> getReceiptItems(
    int receiptId,
  ) {
    return (select(purchaseReceiptItems)
          ..where((t) => t.purchaseReceiptId.equals(receiptId)))
        .get();
  }

  // =====================================================
  // WATCH RECEIPT ITEMS
  // =====================================================

  Stream<List<PurchaseReceiptItemDb>> watchReceiptItems(
    int receiptId,
  ) {
    return (select(purchaseReceiptItems)
          ..where((t) => t.purchaseReceiptId.equals(receiptId)))
        .watch();
  }

  // =====================================================
  // GET RECEIVED QUANTITY FOR PURCHASE ITEM
  // =====================================================

  Future<double> getReceivedQuantity(int purchaseItemId) async {
    final query = selectOnly(purchaseReceiptItems)
      ..addColumns([
        purchaseReceiptItems.quantity.sum(),
      ])
      ..where(
        purchaseReceiptItems.purchaseItemId.equals(purchaseItemId),
      );

    final result = await query.getSingle();

    return result.read(purchaseReceiptItems.quantity.sum()) ?? 0.0;
  }

  // =====================================================
  // INSERT RECEIPT ITEM
  // =====================================================

  Future<int> insertReceiptItem(
    PurchaseReceiptItemsCompanion item,
  ) {
    return into(purchaseReceiptItems).insert(item);
  }
}
