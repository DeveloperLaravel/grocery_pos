
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

  // =========================
  // READ
  // =========================

  /// جميع الدفعات.
  Future<List<PurchasePaymentDb>> getAllPayments() {
    return select(purchasePayments).get();
  }

  /// مراقبة جميع الدفعات.
  Stream<List<PurchasePaymentDb>> watchAllPayments() {
    return select(purchasePayments).watch();
  }

  /// دفعة بواسطة ID.
  Future<PurchasePaymentDb?> getPaymentById(int id) {
    return (select(purchasePayments)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  /// دفعات أمر الشراء.
  Future<List<PurchasePaymentDb>> getPaymentsByOrderId(
    int orderId,
  ) {
    return (select(purchasePayments)
          ..where((t) => t.purchaseOrderId.equals(orderId)))
        .get();
  }

  /// مراقبة دفعات أمر الشراء.
  Stream<List<PurchasePaymentDb>> watchPaymentsByOrderId(
    int orderId,
  ) {
    return (select(purchasePayments)
          ..where((t) => t.purchaseOrderId.equals(orderId)))
        .watch();
  }

  // =========================
  // TOTAL
  // =========================

  /// مجموع المدفوعات لأمر الشراء.
  Future<double> getTotalPaidByOrderId(int orderId) async {
    final amountExpression = purchasePayments.amount.sum();

    final query = selectOnly(purchasePayments)
      ..addColumns([amountExpression])
      ..where(
        purchasePayments.purchaseOrderId.equals(orderId),
      );

    final result = await query.getSingle();

    return result.read(amountExpression) ?? 0.0;
  }

  // =========================
  // CREATE
  // =========================

  /// إضافة دفعة.
  Future<int> createPayment(
    PurchasePaymentsCompanion payment,
  ) {
    return into(purchasePayments).insert(payment);
  }

  // =========================
  // UPDATE
  // =========================

  /// تعديل دفعة بواسطة ID.
  Future<int> updatePayment({
    required int id,
    required PurchasePaymentsCompanion payment,
  }) {
    return (update(purchasePayments)
          ..where((t) => t.id.equals(id)))
        .write(payment);
  }

  // =========================
  // DELETE
  // =========================

  /// حذف دفعة بواسطة ID.
  Future<int> deletePayment(int paymentId) {
    return (delete(purchasePayments)
          ..where((t) => t.id.equals(paymentId)))
        .go();
  }

  /// حذف جميع دفعات أمر شراء.
  Future<int> deletePaymentsByOrderId(int orderId) {
    return (delete(purchasePayments)
          ..where((t) => t.purchaseOrderId.equals(orderId)))
        .go();
  }

  // =========================
  // COUNT
  // =========================

  Future<int> getPaymentsCount(int orderId) async {
    final count = purchasePayments.id.count();

    final query = selectOnly(purchasePayments)
      ..addColumns([count])
      ..where(
        purchasePayments.purchaseOrderId.equals(orderId),
      );

    final result = await query.getSingle();

    return result.read(count) ?? 0;
  }
}
