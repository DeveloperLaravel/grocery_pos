
import 'package:drift/drift.dart';

import '../../../tables/sales_inventory/purchases/purchase_payments_table.dart';


part 'purchase_payments_dao.g.dart';

@DriftAccessor(tables: [PurchasePayments])
class PurchasePaymentsDao extends DatabaseAccessor<AppDatabase>
    with _$PurchasePaymentsDaoMixin {
  PurchasePaymentsDao(super.db);
ss
  // Insert
  Future<int> insertPayment(
    PurchasePaymentsCompanion payment,
  ) {
    return into(purchasePayments).insert(payment);
  }

  // Update
  Future<bool> updatePayment(
    PurchasePaymentsCompanion payment,
  ) {
    return update(purchasePayments).replace(payment);
  }

  // Get By ID
  Future<PurchasePaymentDb?> getById(int id) {
    return (select(purchasePayments)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  // Get By Payment Number
  Future<PurchasePaymentDb?> getByPaymentNumber(
    String number,
  ) {
    return (select(purchasePayments)
          ..where((t) => t.paymentNumber.equals(number)))
        .getSingleOrNull();
  }

  // Get Payments By Order
  Future<List<PurchasePaymentDb>> getByOrder(int orderId) {
    return (select(purchasePayments)
          ..where(
            (t) => t.purchaseOrderId.equals(orderId),
          )
          ..orderBy([
            (t) => OrderingTerm.desc(t.paymentDate),
          ]))
        .get();
  }

  // Watch Payments By Order
  Stream<List<PurchasePaymentDb>> watchByOrder(int orderId) {
    return (select(purchasePayments)
          ..where(
            (t) => t.purchaseOrderId.equals(orderId),
          )
          ..orderBy([
            (t) => OrderingTerm.desc(t.paymentDate),
          ]))
        .watch();
  }

  // Calculate Total Payments
  Future<double> getTotalPaid(int orderId) async {
    final query = selectOnly(purchasePayments)
      ..addColumns([
        purchasePayments.amount.sum(),
      ])
      ..where(
        purchasePayments.purchaseOrderId.equals(orderId),
      );

    final result = await query.getSingle();

    return result.read(purchasePayments.amount.sum()) ?? 0.0;
  }

  // Get All
  Future<List<PurchasePaymentDb>> getAll() {
    return (select(purchasePayments)
          ..orderBy([
            (t) => OrderingTerm.desc(t.paymentDate),
          ]))
        .get();
  }

  // Watch All
  Stream<List<PurchasePaymentDb>> watchAll() {
    return (select(purchasePayments)
          ..orderBy([
            (t) => OrderingTerm.desc(t.paymentDate),
          ]))
        .watch();
  }

  // Delete Payment
  Future<int> deletePayment(int id) {
    return (delete(purchasePayments)
          ..where((t) => t.id.equals(id)))
        .go();
  }
}
