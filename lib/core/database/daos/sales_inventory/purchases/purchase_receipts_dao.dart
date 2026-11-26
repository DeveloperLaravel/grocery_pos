
import 'package:drift/drift.dart';

import '../../../tables/sales_inventory/purchases/purchase_receipts_table.dart';
import '../../app_database.dart';
import '../../tables/purchases/purchase_receipts_table.dart';

part 'purchase_receipts_dao.g.dart';

@DriftAccessor(tables: [PurchaseReceipts])
class PurchaseReceiptsDao extends DatabaseAccessor<AppDatabase>
    with _$PurchaseReceiptsDaoMixin {
  PurchaseReceiptsDao(super.db);

  // Insert
  Future<int> insertReceipt(
    PurchaseReceiptsCompanion receipt,
  ) {
    return into(purchaseReceipts).insert(receipt);
  }

  // Update
  Future<bool> updateReceipt(
    PurchaseReceiptsCompanion receipt,
  ) {
    return update(purchaseReceipts).replace(receipt);
  }

  // Get By ID
  Future<PurchaseReceiptDb?> getById(int id) {
    return (select(purchaseReceipts)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  // Get By Receipt Number
  Future<PurchaseReceiptDb?> getByReceiptNumber(String number) {
    return (select(purchaseReceipts)
          ..where((t) => t.receiptNumber.equals(number)))
        .getSingleOrNull();
  }

  // Get By Purchase Order
  Future<List<PurchaseReceiptDb>> getByOrder(int orderId) {
    return (select(purchaseReceipts)
          ..where(
            (t) => t.purchaseOrderId.equals(orderId),
          )
          ..orderBy([
            (t) => OrderingTerm.desc(t.receivedAt),
          ]))
        .get();
  }

  // Watch By Purchase Order
  Stream<List<PurchaseReceiptDb>> watchByOrder(int orderId) {
    return (select(purchaseReceipts)
          ..where(
            (t) => t.purchaseOrderId.equals(orderId),
          )
          ..orderBy([
            (t) => OrderingTerm.desc(t.receivedAt),
          ]))
        .watch();
  }

  // Get All
  Future<List<PurchaseReceiptDb>> getAll() {
    return (select(purchaseReceipts)
          ..orderBy([
            (t) => OrderingTerm.desc(t.id),
          ]))
        .get();
  }

  // Watch All
  Stream<List<PurchaseReceiptDb>> watchAll() {
    return (select(purchaseReceipts)
          ..orderBy([
            (t) => OrderingTerm.desc(t.id),
          ]))
        .watch();
  }

  // Watch By Status
  Stream<List<PurchaseReceiptDb>> watchByStatus(String status) {
    return (select(purchaseReceipts)
          ..where((t) => t.status.equals(status))
          ..orderBy([
            (t) => OrderingTerm.desc(t.id),
          ]))
        .watch();
  }

  // Delete Draft Receipt Only
  Future<int> deleteDraft(int id) {
    return (delete(purchaseReceipts)
          ..where(
            (t) =>
                t.id.equals(id) &
                t.status.equals('draft'),
          ))
        .go();
  }
}
