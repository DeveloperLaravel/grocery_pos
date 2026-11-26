
import 'package:drift/drift.dart';

import '../../../tables/sales_inventory/purchases/purchase_items_table.dart';
import '../../../tables/sales_inventory/purchases/purchase_payments_table.dart';
import 'purchase_orders_table.dart';



part 'purchase_transactions_dao.g.dart';

@DriftAccessor(
  tables: [
    PurchaseOrders,
    PurchaseItems,
    PurchasePayments,
  ],
)
class PurchaseTransactionsDao extends DatabaseAccessor<AppDatabase>
    with _$PurchaseTransactionsDaoMixin {
  PurchaseTransactionsDao(super.db);

  // =====================================================
  // GENERIC TRANSACTION
  // =====================================================

  Future<T> runInTransaction<T>(
    Future<T> Function() action,
  ) {
    return db.transaction(action);
  }

  // =====================================================
  // INSERT ORDER WITH ITEMS
  // =====================================================

  Future<int> insertOrderWithItems({
    required PurchaseOrdersCompanion order,
    required List<PurchaseItemsCompanion> items,
  }) {
    return db.transaction(() async {
      // Insert order
      final orderId = await into(purchaseOrders).insert(order);

      // Insert items
      if (items.isNotEmpty) {
        final orderItems = items.map((item) {
          return item.copyWith(
            purchaseOrderId: Value(orderId),
          );
        }).toList();

        await batch((batch) {
          batch.insertAll(purchaseItems, orderItems);
        });
      }

      return orderId;
    });
  }

  // =====================================================
  // INSERT PAYMENT AND REFRESH ORDER SUMMARY
  // =====================================================

  Future<int> insertPaymentAndRefreshOrder({
    required PurchasePaymentsCompanion payment,
    required int orderId,
  }) {
    return db.transaction(() async {
      // Ensure order exists and is not cancelled
      final order = await (select(purchaseOrders)
            ..where((t) => t.id.equals(orderId)))
          .getSingleOrNull();

      if (order == null) {
        throw StateError('فاتورة الشراء غير موجودة.');
      }

      if (order.status == 'cancelled') {
        throw StateError('لا يمكن الدفع لفاتورة ملغاة.');
      }

      // Insert payment
      final paymentId = await into(purchasePayments).insert(payment);

      // Calculate total paid
      final totalExpression = purchasePayments.amount.sum();

      final query = selectOnly(purchasePayments)
        ..addColumns([totalExpression])
        ..where(purchasePayments.purchaseOrderId.equals(orderId));

      final result = await query.getSingle();

      final paidAmount = result.read(totalExpression) ?? 0.0;

      // Calculate remaining
      final remainingAmount = (order.total - paidAmount)
          .clamp(0.0, double.infinity)
          .toDouble();

      // Calculate payment status
      final paymentStatus = paidAmount <= 0
          ? 'unpaid'
          : paidAmount >= order.total
              ? 'paid'
              : 'partially_paid';

      // Update order
      await (update(purchaseOrders)
            ..where((t) => t.id.equals(orderId)))
          .write(
        PurchaseOrdersCompanion(
          paidAmount: Value(paidAmount),
          remainingAmount: Value(remainingAmount),
          paymentStatus: Value(paymentStatus),
          updatedAt: Value(DateTime.now()),
        ),
      );

      return paymentId;
    });
  }
}
