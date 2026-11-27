
import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../tables/sales_inventory/customer_payments/customer_payment_allocations_table.dart';
import '../../../tables/sales_inventory/customer_payments/customer_payments_table.dart';

part 'customer_payments_dao.g.dart';

@DriftAccessor(
  tables: [
    CustomerPayments,
    CustomerPaymentAllocations,
  ],
)
class CustomerPaymentsDao extends DatabaseAccessor<AppDatabase>
    with _$CustomerPaymentsDaoMixin {
  CustomerPaymentsDao(super.db);

  // =====================================================
  // INSERT PAYMENT
  // =====================================================

  Future<int> insertPayment({
    required int customerId,
    required int paymentMethodId,
    required double amount,
    String? referenceNumber,
    String? transactionReference,
    DateTime? paymentDate,
    String? notes,
  }) async {
    if (amount <= 0) {
      throw ArgumentError('Payment amount must be greater than zero');
    }

    return into(customerPayments).insert(
      CustomerPaymentsCompanion.insert(
        customerId: customerId,
        paymentMethodId: paymentMethodId,
        amount: amount,
        referenceNumber: Value(referenceNumber),
        transactionReference: Value(transactionReference),
        paymentDate: Value(paymentDate ?? DateTime.now()),
        notes: Value(notes),
      ),
    );
  }

  // =====================================================
  // GET ALL PAYMENTS
  // =====================================================

  Future<List<CustomerPaymentDb>> getAllPayments() {
    return (select(customerPayments)
          ..orderBy([
            (t) => OrderingTerm.desc(t.paymentDate),
          ]))
        .get();
  }

  // =====================================================
  // GET PAYMENT BY ID
  // =====================================================

  Future<CustomerPaymentDb?> getPaymentById(int id) {
    return (select(customerPayments)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  // =====================================================
  // GET PAYMENTS BY CUSTOMER
  // =====================================================

  Future<List<CustomerPaymentDb>> getPaymentsByCustomer(
    int customerId,
  ) {
    return (select(customerPayments)
          ..where((t) => t.customerId.equals(customerId))
          ..orderBy([
            (t) => OrderingTerm.desc(t.paymentDate),
          ]))
        .get();
  }

  // =====================================================
  // WATCH CUSTOMER PAYMENTS
  // =====================================================

  Stream<List<CustomerPaymentDb>> watchPaymentsByCustomer(
    int customerId,
  ) {
    return (select(customerPayments)
          ..where((t) => t.customerId.equals(customerId))
          ..orderBy([
            (t) => OrderingTerm.desc(t.paymentDate),
          ]))
        .watch();
  }

  // =====================================================
  // GET TOTAL PAYMENT AMOUNT
  // =====================================================

  Future<double> getTotalPayments(int customerId) async {
    final amount = customerPayments.amount.sum();

    final query = selectOnly(customerPayments)
      ..addColumns([amount])
      ..where(
        customerPayments.customerId.equals(customerId) &
            customerPayments.status.equals('posted'),
      );

    final result = await query.getSingle();

    return result.read(amount) ?? 0.0;
  }

  // =====================================================
  // GET ALLOCATED AMOUNT
  // =====================================================

  Future<double> getAllocatedAmount(int paymentId) async {
    final amount = customerPaymentAllocations.amount.sum();

    final query = selectOnly(customerPaymentAllocations)
      ..addColumns([amount])
      ..where(
        customerPaymentAllocations.customerPaymentId.equals(paymentId),
      );

    final result = await query.getSingle();

    return result.read(amount) ?? 0.0;
  }

  // =====================================================
  // GET UNALLOCATED AMOUNT
  // =====================================================

  Future<double> getUnallocatedAmount(int paymentId) async {
    final payment = await getPaymentById(paymentId);

    if (payment == null || payment.status != 'posted') {
      return 0.0;
    }

    final allocated = await getAllocatedAmount(paymentId);

    return (payment.amount - allocated).clamp(0.0, double.infinity);
  }

  // =====================================================
  // VOID PAYMENT
  // Only payments without allocations can be voided.
  // =====================================================

  Future<void> voidPayment(int paymentId) async {
    await transaction(() async {
      final payment = await getPaymentById(paymentId);

      if (payment == null) {
        throw StateError('Payment not found');
      }

      if (payment.status != 'posted') {
        throw StateError('Payment is already voided');
      }

      final allocated = await getAllocatedAmount(paymentId);

      if (allocated > 0) {
        throw StateError(
          'Cannot void a payment with allocations',
        );
      }

      await (update(customerPayments)
            ..where((t) => t.id.equals(paymentId)))
          .write(
        CustomerPaymentsCompanion(
          status: const Value('voided'),
          updatedAt: Value(DateTime.now()),
        ),
      );
    });
  }
}
