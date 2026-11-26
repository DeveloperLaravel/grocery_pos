
import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../tables/sales_inventory/purchases/purchase_payments_table.dart';

part 'purchase_payments_dao.g.dart';

@DriftAccessor(
  tables: [
    PurchasePayments,
  ],
)
class PurchasePaymentsDao extends DatabaseAccessor<AppDatabase>
    with _$PurchasePaymentsDaoMixin {
  PurchasePaymentsDao(super.db);

  // INSERT
  Future<int> insertPayment(
    PurchasePaymentsCompanion payment,
  ) {
    return into(purchasePayments).insert(payment);
  }

  // UPDATE
  Future<bool> updatePayment(
    int id,
    PurchasePaymentsCompanion payment,
  ) async {
    final updated = await (update(purchasePayments)
          ..where((t) => t.id.equals(id)))
        .write(
      payment.copyWith(
        updatedAt: Value(DateTime.now()),
      ),
    );

    return updated > 0;
  }

  // DELETE
  Future<int> deletePayment(int id) {
    return (delete(purchasePayments)
          ..where((t) => t.id.equals(id)))
        .go();
  }

  // GET BY ID
  Future<PurchasePaymentDb?> getPaymentById(int id) {
    return (select(purchasePayments)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  // GET ALL
  Future<List<PurchasePaymentDb>> getAllPayments() {
    return (select(purchasePayments)
          ..orderBy([
            (t) => OrderingTerm.desc(t.paymentDate),
          ]))
        .get();
  }

  // WATCH ALL
  Stream<List<PurchasePaymentDb>> watchAllPayments() {
    return (select(purchasePayments)
          ..orderBy([
            (t) => OrderingTerm.desc(t.paymentDate),
          ]))
        .watch();
  }

  // GET PAYMENTS BY ORDER
  Future<List<PurchasePaymentDb>> getPaymentsByOrder(
    int orderId,
  ) {
    return (select(purchasePayments)
          ..where((t) => t.purchaseOrderId.equals(orderId))
          ..orderBy([
            (t) => OrderingTerm.desc(t.paymentDate),
          ]))
        .get();
  }

  // WATCH PAYMENTS BY ORDER
  Stream<List<PurchasePaymentDb>> watchPaymentsByOrder(
    int orderId,
  ) {
    return (select(purchasePayments)
          ..where((t) => t.purchaseOrderId.equals(orderId))
          ..orderBy([
            (t) => OrderingTerm.desc(t.paymentDate),
          ]))
        .watch();
  }

  // TOTAL PAID FOR ORDER
  Future<double> getTotalPaid(int orderId) async {
    final expression = purchasePayments.amount.sum();

    final query = selectOnly(purchasePayments)
      ..addColumns([expression])
      ..where(
        purchasePayments.purchaseOrderId.equals(orderId),
      );

    final result = await query.getSingle();

    return result.read(expression) ?? 0.0;
  }

  // PAYMENT COUNT
  Future<int> getPaymentCount(int orderId) async {
    final countExpression = purchasePayments.id.count();

    final query = selectOnly(purchasePayments)
      ..addColumns([countExpression])
      ..where(
        purchasePayments.purchaseOrderId.equals(orderId),
      );

    final result = await query.getSingle();

    return result.read(countExpression) ?? 0;
  }
}
