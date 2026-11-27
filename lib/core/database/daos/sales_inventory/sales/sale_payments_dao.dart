
import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../tables/sales_inventory/sales/sales_table.dart';
import '../../../tables/sales_inventory/sales/sale_payments_table.dart';

part 'sale_payments_dao.g.dart';

@DriftAccessor(
  tables: [
    Sales,
    SalePayments,
  ],
)
class SalePaymentsDao extends DatabaseAccessor<AppDatabase>
    with _$SalePaymentsDaoMixin {
  SalePaymentsDao(super.db);

  // =========================================
  // 1. Insert Payment
  // =========================================

  Future<int> insertPayment(
    SalePaymentsCompanion payment,
  ) async {
    _validatePayment(payment);

    return transaction(() async {
      final saleId = payment.saleId.value;
      final sale = await _getSale(saleId);

      if (sale == null) {
        throw StateError('الفاتورة غير موجودة');
      }

      if (sale.status == 'cancelled') {
        throw StateError('لا يمكن الدفع لفاتورة ملغاة');
      }

      if (sale.status == 'returned') {
        throw StateError('لا يمكن الدفع لفاتورة مسترجعة بالكامل');
      }

      final paymentId = await into(salePayments).insert(payment);

      await _recalculateSalePayment(saleId);

      return paymentId;
    });
  }

  // =========================================
  // 2. Get Payment By ID
  // =========================================

  Future<SalePaymentDb?> getPaymentById(int paymentId) {
    return (select(salePayments)
          ..where((tbl) => tbl.id.equals(paymentId)))
        .getSingleOrNull();
  }

  // =========================================
  // 3. Get Payments By Sale
  // =========================================

  Future<List<SalePaymentDb>> getPaymentsBySaleId(
    int saleId,
  ) {
    return (select(salePayments)
          ..where((tbl) => tbl.saleId.equals(saleId))
          ..orderBy([
            (tbl) => OrderingTerm.desc(tbl.paidAt),
          ]))
        .get();
  }

  // =========================================
  // 4. Watch Payments By Sale
  // =========================================

  Stream<List<SalePaymentDb>> watchPaymentsBySaleId(
    int saleId,
  ) {
    return (select(salePayments)
          ..where((tbl) => tbl.saleId.equals(saleId))
          ..orderBy([
            (tbl) => OrderingTerm.desc(tbl.paidAt),
          ]))
        .watch();
  }

  // =========================================
  // 5. Get All Payments
  // =========================================

  Future<List<SalePaymentDb>> getAllPayments({
    int? limit,
  }) {
    final query = select(salePayments)
      ..orderBy([
        (tbl) => OrderingTerm.desc(tbl.paidAt),
      ]);

    if (limit != null) {
      query.limit(limit);
    }

    return query.get();
  }

  // =========================================
  // 6. Update Payment
  // =========================================

  Future<bool> updatePayment({
    required int paymentId,
    required SalePaymentsCompanion payment,
  }) async {
    _validatePayment(payment);

    return transaction(() async {
      final oldPayment = await getPaymentById(paymentId);

      if (oldPayment == null) return false;

      if (payment.saleId.present &&
          payment.saleId.value != oldPayment.saleId) {
        throw ArgumentError(
          'لا يمكن نقل الدفعة إلى فاتورة أخرى',
        );
      }

      final rows = await (update(salePayments)
            ..where((tbl) => tbl.id.equals(paymentId)))
          .write(
        payment.copyWith(
          saleId: Value(oldPayment.saleId),
        ),
      );

      if (rows > 0) {
        await _recalculateSalePayment(oldPayment.saleId);
      }

      return rows > 0;
    });
  }

  // =========================================
  // 7. Update Payment Status
  // =========================================

  Future<bool> updatePaymentStatus({
    required int paymentId,
    required String status,
  }) async {
    const allowedStatuses = {
      'completed',
      'pending',
      'failed',
      'refunded',
    };

    if (!allowedStatuses.contains(status)) {
      throw ArgumentError('حالة الدفعة غير صحيحة');
    }

    return transaction(() async {
      final payment = await getPaymentById(paymentId);

      if (payment == null) return false;

      final rows = await (update(salePayments)
            ..where((tbl) => tbl.id.equals(paymentId)))
          .write(
        SalePaymentsCompanion(
          status: Value(status),
        ),
      );

      if (rows > 0) {
        await _recalculateSalePayment(payment.saleId);
      }

      return rows > 0;
    });
  }

  // =========================================
  // 8. Delete Payment
  // =========================================

  Future<bool> deletePayment(int paymentId) async {
    return transaction(() async {
      final payment = await getPaymentById(paymentId);

      if (payment == null) return false;

      // Completed payments should normally be reversed
      // through a refund record, not silently deleted.
      if (payment.status == 'completed') {
        throw StateError(
          'لا يمكن حذف دفعة مكتملة. سجل عملية استرداد بدلاً منها.',
        );
      }

      final rows = await (delete(salePayments)
            ..where((tbl) => tbl.id.equals(paymentId)))
          .go();

      if (rows > 0) {
        await _recalculateSalePayment(payment.saleId);
      }

      return rows > 0;
    });
  }

  // =========================================
  // 9. Calculate Total Paid
  // =========================================

  Future<double> getTotalPaid(int saleId) async {
    final completedPayments = await (select(salePayments)
          ..where(
            (tbl) =>
                tbl.saleId.equals(saleId) &
                tbl.status.equals('completed'),
          ))
        .get();

    return completedPayments.fold<double>(
      0.0,
      (sum, payment) => sum + payment.amount,
    );
  }

  // =========================================
  // 10. Calculate Remaining Amount
  // =========================================

  Future<double> getRemainingAmount(int saleId) async {
    final sale = await _getSale(saleId);

    if (sale == null) {
      throw StateError('الفاتورة غير موجودة');
    }

    final paid = await getTotalPaid(saleId);

    return (sale.total - paid).clamp(0.0, double.infinity);
  }

  // =========================================
  // 11. Watch Total Paid
  // =========================================

  Stream<double> watchTotalPaid(int saleId) {
    return watchPaymentsBySaleId(saleId).map(
      (payments) => payments
          .where((payment) => payment.status == 'completed')
          .fold<double>(
            0.0,
            (sum, payment) => sum + payment.amount,
          ),
    );
  }

  // =========================================
  // 12. Recalculate Sale Payment
  // =========================================

  Future<void> _recalculateSalePayment(int saleId) async {
    final sale = await _getSale(saleId);

    if (sale == null) {
      throw StateError('الفاتورة غير موجودة');
    }

    final payments = await (select(salePayments)
          ..where(
            (tbl) =>
                tbl.saleId.equals(saleId) &
                tbl.status.equals('completed'),
          ))
        .get();

    final paidAmount = payments.fold<double>(
      0.0,
      (sum, payment) => sum + payment.amount,
    );

    final remainingAmount =
        (sale.total - paidAmount).clamp(0.0, double.infinity);

    final paymentStatus = paidAmount <= 0
        ? 'unpaid'
        : remainingAmount <= 0
            ? 'paid'
            : 'partially_paid';

    final methods = payments
        .map((payment) => payment.paymentMethod)
        .toSet();

    final paymentMethod = methods.isEmpty
        ? 'credit'
        : methods.length > 1
            ? 'mixed'
            : methods.first;

    await (update(sales)
          ..where((tbl) => tbl.id.equals(saleId)))
        .write(
      SalesCompanion(
        paidAmount: Value(paidAmount),
        remainingAmount: Value(remainingAmount),
        paymentStatus: Value(paymentStatus),
        paymentMethod: Value(paymentMethod),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  // =========================================
  // 13. Get Sale
  // =========================================

  Future<SaleDb?> _getSale(int saleId) {
    return (select(sales)
          ..where((tbl) => tbl.id.equals(saleId)))
        .getSingleOrNull();
  }

  // =========================================
  // 14. Validate Payment
  // =========================================

  void _validatePayment(SalePaymentsCompanion payment) {
    if (payment.amount.present && payment.amount.value <= 0) {
      throw ArgumentError('مبلغ الدفعة يجب أن يكون أكبر من صفر');
    }

    if (payment.paymentMethod.present) {
      const allowedMethods = {
        'cash',
        'card',
        'bank_transfer',
        'other',
      };

      if (!allowedMethods.contains(payment.paymentMethod.value)) {
        throw ArgumentError('طريقة الدفع غير صحيحة');
      }
    }

    if (payment.status.present) {
      const allowedStatuses = {
        'completed',
        'pending',
        'failed',
        'refunded',
      };

      if (!allowedStatuses.contains(payment.status.value)) {
        throw ArgumentError('حالة الدفعة غير صحيحة');
      }
    }
  }
}
