
import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../tables/sales_inventory/purchases/purchase_items_table.dart';

part 'purchase_items_dao.g.dart';

@DriftAccessor(
  tables: [PurchaseItems],
)
class PurchaseItemsDao extends DatabaseAccessor<AppDatabase>
    with _$PurchaseItemsDaoMixin {
  PurchaseItemsDao(super.db);

  // =========================================================
  // GET ALL PURCHASE ITEMS
  // =========================================================

  Future<List<PurchaseItemDb>> getAllPurchaseItems() {
    return (select(purchaseItems)
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

  Future<PurchaseItemDb?> getPurchaseItemById(int id) {
    return (select(purchaseItems)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  // =========================================================
  // GET BY PURCHASE ORDER ID
  // =========================================================

  Future<List<PurchaseItemDb>> getItemsByPurchaseOrderId(
    int purchaseOrderId,
  ) {
    return (select(purchaseItems)
          ..where(
            (t) => t.purchaseOrderId.equals(purchaseOrderId),
          )
          ..orderBy([
            (t) => OrderingTerm(expression: t.id),
          ]))
        .get();
  }

  // =========================================================
  // WATCH BY PURCHASE ORDER ID
  // =========================================================

  Stream<List<PurchaseItemDb>> watchItemsByPurchaseOrderId(
    int purchaseOrderId,
  ) {
    return (select(purchaseItems)
          ..where(
            (t) => t.purchaseOrderId.equals(purchaseOrderId),
          )
          ..orderBy([
            (t) => OrderingTerm(expression: t.id),
          ]))
        .watch();
  }

  // =========================================================
  // GET BY PRODUCT ID
  // =========================================================

  Future<List<PurchaseItemDb>> getItemsByProductId(
    int productId,
  ) {
    return (select(purchaseItems)
          ..where((t) => t.productId.equals(productId))
          ..orderBy([
            (t) => OrderingTerm(
                  expression: t.id,
                  mode: OrderingMode.desc,
                ),
          ]))
        .get();
  }

  // =========================================================
  // WATCH BY PRODUCT ID
  // =========================================================

  Stream<List<PurchaseItemDb>> watchItemsByProductId(
    int productId,
  ) {
    return (select(purchaseItems)
          ..where((t) => t.productId.equals(productId)))
        .watch();
  }

  // =========================================================
  // INSERT
  // =========================================================

  Future<int> insertPurchaseItem(
    PurchaseItemsCompanion entry,
  ) {
    return into(purchaseItems).insert(entry);
  }

  // =========================================================
  // INSERT MANY
  // =========================================================

  Future<void> insertPurchaseItems(
    List<PurchaseItemsCompanion> entries,
  ) async {
    if (entries.isEmpty) return;

    await transaction(() async {
      await batch((batch) {
        batch.insertAll(
          purchaseItems,
          entries,
        );
      });
    });
  }

  // =========================================================
  // UPDATE
  // =========================================================

  Future<bool> updatePurchaseItem(
    int id,
    PurchaseItemsCompanion entry,
  ) async {
    final rows = await (update(purchaseItems)
          ..where((t) => t.id.equals(id)))
        .write(entry);

    return rows > 0;
  }

  // =========================================================
  // DELETE
  // =========================================================

  Future<int> deletePurchaseItem(int id) {
    return (delete(purchaseItems)
          ..where((t) => t.id.equals(id)))
        .go();
  }

  // =========================================================
  // DELETE BY PURCHASE ORDER ID
  // =========================================================

  Future<int> deleteItemsByPurchaseOrderId(
    int purchaseOrderId,
  ) {
    return (delete(purchaseItems)
          ..where(
            (t) => t.purchaseOrderId.equals(purchaseOrderId),
          ))
        .go();
  }

  // =========================================================
  // DELETE BY PRODUCT ID
  // =========================================================

  Future<int> deleteItemsByProductId(int productId) {
    return (delete(purchaseItems)
          ..where((t) => t.productId.equals(productId)))
        .go();
  }

  // =========================================================
  // GET ITEMS COUNT
  // =========================================================

  Future<int> getPurchaseItemsCount(int purchaseOrderId) async {
    final count = purchaseItems.id.count();

    final query = selectOnly(purchaseItems)
      ..addColumns([count])
      ..where(
        purchaseItems.purchaseOrderId.equals(purchaseOrderId),
      );

    return await query
        .map((row) => row.read(count) ?? 0)
        .getSingle();
  }

  // =========================================================
  // GET TOTAL QUANTITY
  // =========================================================

  Future<double> getTotalQuantity(int purchaseOrderId) async {
    final total = purchaseItems.quantity.sum();

    final query = selectOnly(purchaseItems)
      ..addColumns([total])
      ..where(
        purchaseItems.purchaseOrderId.equals(purchaseOrderId),
      );

    return await query
        .map((row) => row.read(total) ?? 0.0)
        .getSingle();
  }

  // =========================================================
  // GET TOTAL BASE QUANTITY
  // =========================================================

  Future<double> getTotalBaseQuantity(int purchaseOrderId) async {
    final total = purchaseItems.baseQuantity.sum();

    final query = selectOnly(purchaseItems)
      ..addColumns([total])
      ..where(
        purchaseItems.purchaseOrderId.equals(purchaseOrderId),
      );

    return await query
        .map((row) => row.read(total) ?? 0.0)
        .getSingle();
  }

  // =========================================================
  // GET TOTAL AMOUNT
  // =========================================================

  Future<double> getPurchaseOrderItemsTotal(
    int purchaseOrderId,
  ) async {
    final total = purchaseItems.total.sum();

    final query = selectOnly(purchaseItems)
      ..addColumns([total])
      ..where(
        purchaseItems.purchaseOrderId.equals(purchaseOrderId),
      );

    return await query
        .map((row) => row.read(total) ?? 0.0)
        .getSingle();
  }

  // =========================================================
  // GET PRODUCT COUNT
  // =========================================================

  Future<int> getProductPurchaseCount(int productId) async {
    final count = purchaseItems.id.count();

    final query = selectOnly(purchaseItems)
      ..addColumns([count])
      ..where(
        purchaseItems.productId.equals(productId),
      );

    return await query
        .map((row) => row.read(count) ?? 0)
        .getSingle();
  }

  // =========================================================
  // CHECK PRODUCT EXISTS IN PURCHASE ORDER
  // =========================================================

  Future<bool> isProductInPurchaseOrder({
    required int purchaseOrderId,
    required int productId,
  }) async {
    final item = await (select(purchaseItems)
          ..where(
            (t) =>
                t.purchaseOrderId.equals(purchaseOrderId) &
                t.productId.equals(productId),
          )
          ..limit(1))
        .getSingleOrNull();

    return item != null;
  }
}
