
import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../tables/sales_inventory/purchases/purchase_receipts_table.dart';
import '../../../tables/sales_inventory/purchases/purchase_receipt_items_table.dart';

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

  // =========================
  // RECEIPTS - READ
  // =========================

  Future<List<PurchaseReceiptDb>> getAllReceipts() {
    return (select(purchaseReceipts)
          ..orderBy([
            (t) => OrderingTerm.desc(t.receivedAt),
          ]))
        .get();
  }

  Stream<List<PurchaseReceiptDb>> watchAllReceipts() {
    return (select(purchaseReceipts)
          ..orderBy([
            (t) => OrderingTerm.desc(t.receivedAt),
          ]))
        .watch();
  }

  Future<PurchaseReceiptDb?> getReceiptById(int id) {
    return (select(purchaseReceipts)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Stream<PurchaseReceiptDb?> watchReceiptById(int id) {
    return (select(purchaseReceipts)
          ..where((t) => t.id.equals(id)))
        .watchSingleOrNull();
  }

  Future<List<PurchaseReceiptDb>> getReceiptsByOrderId(
    int purchaseOrderId,
  ) {
    return (select(purchaseReceipts)
          ..where(
            (t) => t.purchaseOrderId.equals(purchaseOrderId),
          )
          ..orderBy([
            (t) => OrderingTerm.desc(t.receivedAt),
          ]))
        .get();
  }

  Future<PurchaseReceiptDb?> getByReceiptNumber(
    String receiptNumber,
  ) {
    return (select(purchaseReceipts)
          ..where(
            (t) => t.receiptNumber.equals(receiptNumber.trim()),
          ))
        .getSingleOrNull();
  }

  // =========================
  // RECEIPT ITEMS - READ
  // =========================

  Future<List<PurchaseReceiptItemDb>> getAllReceiptItems() {
    return select(purchaseReceiptItems).get();
  }

  Future<List<PurchaseReceiptItemDb>> getItemsByReceiptId(
    int receiptId,
  ) {
    return (select(purchaseReceiptItems)
          ..where(
            (t) => t.receiptId.equals(receiptId),
          )
          ..orderBy([
            (t) => OrderingTerm.asc(t.id),
          ]))
        .get();
  }

  Stream<List<PurchaseReceiptItemDb>> watchItemsByReceiptId(
    int receiptId,
  ) {
    return (select(purchaseReceiptItems)
          ..where(
            (t) => t.receiptId.equals(receiptId),
          )
          ..orderBy([
            (t) => OrderingTerm.asc(t.id),
          ]))
        .watch();
  }

  Future<PurchaseReceiptItemDb?> getItemById(int id) {
    return (select(purchaseReceiptItems)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  // =========================
  // CREATE
  // =========================

  Future<int> createReceipt(
    PurchaseReceiptsCompanion receipt,
  ) {
    return into(purchaseReceipts).insert(receipt);
  }

  /// إنشاء إيصال وبنوده داخل Transaction واحدة.
  Future<int> createReceiptWithItems({
    required PurchaseReceiptsCompanion receipt,
    required List<PurchaseReceiptItemsCompanion> items,
  }) {
    return transaction(() async {
      final receiptId = await into(purchaseReceipts).insert(
        receipt,
      );

      if (items.isNotEmpty) {
        final receiptItems = items.map(
          (item) => item.copyWith(
            receiptId: Value(receiptId),
          ),
        ).toList();

        await batch((batch) {
          batch.insertAll(
            purchaseReceiptItems,
            receiptItems,
          );
        });
      }

      return receiptId;
    });
  }

  // =========================
  // UPDATE
  // =========================

  Future<int> updateReceipt({
    required int id,
    required PurchaseReceiptsCompanion receipt,
  }) {
    return (update(purchaseReceipts)
          ..where((t) => t.id.equals(id)))
        .write(
      receipt.copyWith(
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<int> updateReceiptItem({
    required int id,
    required PurchaseReceiptItemsCompanion item,
  }) {
    return (update(purchaseReceiptItems)
          ..where((t) => t.id.equals(id)))
        .write(
      item.copyWith(
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  // =========================
  // ADD / DELETE ITEMS
  // =========================

  Future<int> addReceiptItem(
    PurchaseReceiptItemsCompanion item,
  ) {
    return into(purchaseReceiptItems).insert(item);
  }

  Future<int> deleteReceiptItem(int itemId) {
    return (delete(purchaseReceiptItems)
          ..where((t) => t.id.equals(itemId)))
        .go();
  }

  // =========================
  // DELETE RECEIPT
  // =========================

  /// حذف الإيصال وبنوده.
  /// يجب استدعاؤها فقط بعد التأكد أنه لم يؤثر
  /// على المخزون أو الحسابات.
  Future<void> deleteReceiptWithItems(int receiptId) {
    return transaction(() async {
      final receipt = await getReceiptById(receiptId);

      if (receipt == null) {
        throw StateError('Purchase receipt not found');
      }

      await (delete(purchaseReceiptItems)
            ..where(
              (t) => t.receiptId.equals(receiptId),
            ))
          .go();

      await (delete(purchaseReceipts)
            ..where(
              (t) => t.id.equals(receiptId),
            ))
          .go();
    });
  }

  // =========================
  // COUNTS
  // =========================

  Future<int> getReceiptsCount({
    int? purchaseOrderId,
  }) async {
    final count = purchaseReceipts.id.count();

    final query = selectOnly(purchaseReceipts)
      ..addColumns([count]);

    if (purchaseOrderId != null) {
      query.where(
        purchaseReceipts.purchaseOrderId.equals(
          purchaseOrderId,
        ),
      );
    }

    final result = await query.getSingle();

    return result.read(count) ?? 0;
  }

  Future<int> getReceiptItemsCount(int receiptId) async {
    final count = purchaseReceiptItems.id.count();

    final query = selectOnly(purchaseReceiptItems)
      ..addColumns([count])
      ..where(
        purchaseReceiptItems.receiptId.equals(receiptId),
      );

    final result = await query.getSingle();

    return result.read(count) ?? 0;
  }
}
