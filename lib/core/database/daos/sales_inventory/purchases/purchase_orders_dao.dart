
import 'package:drift/drift.dart';

import '../../app_database.dart';
import '../../tables/purchases/purchase_orders_table.dart';
import 'purchase_orders_table.dart';

part 'purchase_orders_dao.g.dart';

@DriftAccessor(tables: [PurchaseOrders])
class PurchaseOrdersDao extends DatabaseAccessor<AppDatabase>
    with _$PurchaseOrdersDaoMixin {
  PurchaseOrdersDao(super.db);

  // Insert
  Future<int> insertOrder(PurchaseOrdersCompanion order) {
    return into(purchaseOrders).insert(order);
  }

  // Update
  Future<bool> updateOrder(PurchaseOrdersCompanion order) {
    return update(purchaseOrders).replace(order);
  }

  // Get By ID
  Future<PurchaseOrderDb?> getById(int id) {
    return (select(purchaseOrders)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  // Get By Invoice Number
  Future<PurchaseOrderDb?> getByInvoiceNumber(String number) {
    return (select(purchaseOrders)
          ..where((t) => t.invoiceNumber.equals(number)))
        .getSingleOrNull();
  }

  // Get By Supplier
  Future<List<PurchaseOrderDb>> getBySupplier(int supplierId) {
    return (select(purchaseOrders)
          ..where((t) => t.supplierId.equals(supplierId))
          ..orderBy([
            (t) => OrderingTerm.desc(t.purchaseDate),
          ]))
        .get();
  }

  // Get All
  Future<List<PurchaseOrderDb>> getAll() {
    return (select(purchaseOrders)
          ..orderBy([
            (t) => OrderingTerm.desc(t.id),
          ]))
        .get();
  }

  // Watch All
  Stream<List<PurchaseOrderDb>> watchAll() {
    return (select(purchaseOrders)
          ..orderBy([
            (t) => OrderingTerm.desc(t.id),
          ]))
        .watch();
  }

  // Watch By Supplier
  Stream<List<PurchaseOrderDb>> watchBySupplier(int supplierId) {
    return (select(purchaseOrders)
          ..where((t) => t.supplierId.equals(supplierId))
          ..orderBy([
            (t) => OrderingTerm.desc(t.purchaseDate),
          ]))
        .watch();
  }

  // Watch By Status
  Stream<List<PurchaseOrderDb>> watchByStatus(String status) {
    return (select(purchaseOrders)
          ..where((t) => t.status.equals(status))
          ..orderBy([
            (t) => OrderingTerm.desc(t.id),
          ]))
        .watch();
  }

  // Search
  Future<List<PurchaseOrderDb>> search(String query) {
    return (select(purchaseOrders)
          ..where(
            (t) => t.invoiceNumber.contains(query),
          )
          ..orderBy([
            (t) => OrderingTerm.desc(t.id),
          ]))
        .get();
  }

  // Delete - Only use for eligible draft orders.
  Future<int> deleteDraft(int id) {
    return (delete(purchaseOrders)
          ..where(
            (t) =>
                t.id.equals(id) &
                t.status.equals('draft'),
          ))
        .go();
  }
}
