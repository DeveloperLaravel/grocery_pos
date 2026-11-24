
import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../tables/sales_inventory/purchases/purchase_items_table.dart';
import '../../../tables/sales_inventory/purchases/purchase_orders_table.dart';

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

  // =========================
  // READ
  // =========================

  /// جميع أوامر الشراء.
  Future<List<PurchaseOrderDb>> getAllOrders() {
    return (select(purchaseOrders)
          ..orderBy([
            (t) => OrderingTerm.desc(t.id),
          ]))
        .get();
  }

  /// مراقبة جميع أوامر الشراء.
  Stream<List<PurchaseOrderDb>> watchAllOrders() {
    return (select(purchaseOrders)
          ..orderBy([
            (t) => OrderingTerm.desc(t.id),
          ]))
        .watch();
  }

  /// أمر شراء بواسطة ID.
  Future<PurchaseOrderDb?> getOrderById(int id) {
    return (select(purchaseOrders)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  /// بنود أمر الشراء.
  Future<List<PurchaseItemDb>> getItemsByOrderId(int orderId) {
    return (select(purchaseItems)
          ..where((t) => t.purchaseOrderId.equals(orderId)))
        .get();
  }

  /// مراقبة بنود أمر الشراء.
  Stream<List<PurchaseItemDb>> watchItemsByOrderId(int orderId) {
    return (select(purchaseItems)
          ..where((t) => t.purchaseOrderId.equals(orderId)))
        .watch();
  }

  // =========================
  // DELETE
  // =========================

  /// حذف مسودة أمر الشراء فقط.
  Future<void> deleteDraftOrder(int id) async {
    await transaction(() async {
      final order = await getOrderById(id);

      if (order == null) {
        throw StateError('Purchase order not found');
      }

      if (order.status != 'draft') {
        throw StateError(
          'Only draft orders can be deleted',
        );
      }

      await (delete(purchaseItems)
            ..where((t) => t.purchaseOrderId.equals(id)))
          .go();

      await (delete(purchaseOrders)
            ..where((t) => t.id.equals(id)))
          .go();
    });
  }
}
