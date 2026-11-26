
import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../tables/sales_inventory/purchases/purchase_items_table.dart';


part 'purchase_items_dao.g.dart';

@DriftAccessor(tables: [PurchaseItems])
class PurchaseItemsDao extends DatabaseAccessor<AppDatabase>
    with _$PurchaseItemsDaoMixin {
  PurchaseItemsDao(super.db);

  // Insert
  Future<int> insertItem(PurchaseItemsCompanion item) {
    return into(purchaseItems).insert(item);
  }

  // Insert Multiple
  Future<void> insertItems(
    List<PurchaseItemsCompanion> items,
  ) async {
    await batch((batch) {
      batch.insertAll(purchaseItems, items);
    });
  }

  // Update
  Future<bool> updateItem(PurchaseItemsCompanion item) {
    return update(purchaseItems).replace(item);
  }

  // Get By ID
  Future<PurchaseItemDb?> getById(int id) {
    return (select(purchaseItems)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  // Get Items By Order
  Future<List<PurchaseItemDb>> getByOrder(int orderId) {
    return (select(purchaseItems)
          ..where(
            (t) => t.purchaseOrderId.equals(orderId),
          )
          ..orderBy([
            (t) => OrderingTerm.asc(t.id),
          ]))
        .get();
  }

  // Watch Items By Order
  Stream<List<PurchaseItemDb>> watchByOrder(int orderId) {
    return (select(purchaseItems)
          ..where(
            (t) => t.purchaseOrderId.equals(orderId),
          )
          ..orderBy([
            (t) => OrderingTerm.asc(t.id),
          ]))
        .watch();
  }

  // Get By Product
  Future<List<PurchaseItemDb>> getByProduct(int productId) {
    return (select(purchaseItems)
          ..where((t) => t.productId.equals(productId))
          ..orderBy([
            (t) => OrderingTerm.desc(t.id),
          ]))
        .get();
  }

  // Delete Item
  Future<int> deleteItem(int id) {
    return (delete(purchaseItems)
          ..where((t) => t.id.equals(id)))
        .go();
  }

  // Delete All Items Of Draft Order
  Future<int> deleteByOrder(int orderId) {
    return (delete(purchaseItems)
          ..where(
            (t) => t.purchaseOrderId.equals(orderId),
          ))
        .go();
  }
}
