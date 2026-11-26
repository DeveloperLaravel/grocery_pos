
import 'package:drift/drift.dart';
import 'package:grocery_pos/core/database/tables/sales_inventory/purchases/purchase_orders_table.dart';

import '../../../app_database.dart';
import '../../../tables/sales_inventory/purchases/purchase_items_table.dart';

part 'purchase_orders_dao.g.dart';

@DriftAccessor(
  tables: [
    PurchaseOrders,
    PurchaseItems,
  ],
)
class PurchaseOrdersDao extends DatabaseAccessor<AppDatabase>
    with _$PurchaseOrdersDaoMixin {
  PurchaseOrdersDao(super.db);

  // =====================================================
  // INSERT
  // =====================================================

  Future<int> insertOrder(PurchaseOrdersCompanion order) {
    return into(purchaseOrders).insert(order);
  }

  // =====================================================
  // INSERT ORDER WITH ITEMS
  // =====================================================

  Future<int> insertOrderWithItems({
    required PurchaseOrdersCompanion order,
    required List<PurchaseItemsCompanion> items,
  }) {
    return attachedDatabase.transaction(() async {
      final orderId = await into(purchaseOrders).insert(order);

      for (final item in items) {
        await into(purchaseItems).insert(
          item.copyWith(
            purchaseOrderId: Value(orderId),
          ),
        );
      }

      return orderId;
    });
  }

  // =====================================================
  // UPDATE
  // =====================================================

  Future<bool> updateOrder(
    int id,
    PurchaseOrdersCompanion order,
  ) async {
    final updated = await (update(purchaseOrders)
          ..where((t) => t.id.equals(id)))
        .write(
      order.copyWith(
        updatedAt: Value(DateTime.now()),
      ),
    );

    return updated > 0;
  }

  // =====================================================
  // DELETE
  // =====================================================

  Future<int> deleteOrder(int id) {
    return (delete(purchaseOrders)
          ..where((t) => t.id.equals(id)))
        .go();
  }

  // =====================================================
  // GET BY ID
  // =====================================================

  Future<PurchaseOrderDb?> getOrderById(int id) {
    return (select(purchaseOrders)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  // =====================================================
  // GET ALL
  // =====================================================

  Future<List<PurchaseOrderDb>> getAllOrders() {
    return (select(purchaseOrders)
          ..orderBy([
            (t) => OrderingTerm.desc(t.purchaseDate),
          ]))
        .get();
  }

  // =====================================================
  // WATCH ALL
  // =====================================================

  Stream<List<PurchaseOrderDb>> watchAllOrders() {
    return (select(purchaseOrders)
          ..orderBy([
            (t) => OrderingTerm.desc(t.purchaseDate),
          ]))
        .watch();
  }

  // =====================================================
  // GET BY SUPPLIER
  // =====================================================

  Future<List<PurchaseOrderDb>> getOrdersBySupplier(
    int supplierId,
  ) {
    return (select(purchaseOrders)
          ..where((t) => t.supplierId.equals(supplierId))
          ..orderBy([
            (t) => OrderingTerm.desc(t.purchaseDate),
          ]))
        .get();
  }

  // =====================================================
  // WATCH BY SUPPLIER
  // =====================================================

  Stream<List<PurchaseOrderDb>> watchOrdersBySupplier(
    int supplierId,
  ) {
    return (select(purchaseOrders)
          ..where((t) => t.supplierId.equals(supplierId))
          ..orderBy([
            (t) => OrderingTerm.desc(t.purchaseDate),
          ]))
        .watch();
  }

  // =====================================================
  // GET BY STATUS
  // =====================================================

  Future<List<PurchaseOrderDb>> getOrdersByStatus(
    String status,
  ) {
    return (select(purchaseOrders)
          ..where((t) => t.status.equals(status))
          ..orderBy([
            (t) => OrderingTerm.desc(t.purchaseDate),
          ]))
        .get();
  }

  // =====================================================
  // GET PURCHASE ITEMS
  // =====================================================

  Future<List<PurchaseItemDb>> getOrderItems(
    int orderId,
  ) {
    return (select(purchaseItems)
          ..where((t) => t.purchaseOrderId.equals(orderId)))
        .get();
  }

  // =====================================================
  // WATCH PURCHASE ITEMS
  // =====================================================

  Stream<List<PurchaseItemDb>> watchOrderItems(
    int orderId,
  ) {
    return (select(purchaseItems)
          ..where((t) => t.purchaseOrderId.equals(orderId)))
        .watch();
  }

  // =====================================================
  // UPDATE ITEM
  // =====================================================

  Future<bool> updateOrderItem(
    int id,
    PurchaseItemsCompanion item,
  ) async {
    final updated = await (update(purchaseItems)
          ..where((t) => t.id.equals(id)))
        .write(item);

    return updated > 0;
  }

  // =====================================================
  // DELETE ITEM
  // =====================================================

  Future<int> deleteOrderItem(int id) {
    return (delete(purchaseItems)
          ..where((t) => t.id.equals(id)))
        .go();
  }
}
