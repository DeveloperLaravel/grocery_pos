
import 'package:drift/drift.dart';



import '../../../tables/sales_inventory/customer_payments/customer_payment_allocations_table.dart';
import '../../../tables/sales_inventory/customer_payments/customer_payments_table.dart';
import '../sales/sales_table.dart';

part 'customer_payment_allocations_dao.g.dart';

@DriftAccessor(
  tables: [
    CustomerPayments,
    CustomerPaymentAllocations,
    Sales,
  ],
)
class CustomerPaymentAllocationsDao
    extends DatabaseAccessor<AppDatabase>
    with _$CustomerPaymentAllocationsDaoMixin {
  CustomerPaymentAllocationsDao(super.db);

  // =====================================================
  // ALLOCATE PAYMENT TO SALE
  // =====================================================

  Future<int> allocatePayment({
    required int customerPaymentId,
    required int saleId,
    required double amount,
  }) async {
    if (amount <= 0) {
      throw ArgumentError(
        'Allocation amount must be greater than zero',
      );
    }

    return transaction(() async {
      // 1. Get payment

      final payment = await (select(customerPayments)
            ..where((t) => t.id.equals(customerPaymentId)))
          .getSingleOrNull();

      if (payment == null) {
        throw StateError('Customer payment not found');
      }

      if (payment.status != 'posted') {
        throw StateError('Cannot allocate a voided payment');
      }

      // 2. Get sale

      final sale = await (select(sales)
            ..where((t) => t.id.equals(saleId)))
          .getSingleOrNull();

      if (sale == null) {
        throw StateError('Sales invoice not found');
      }

      // 3. Check customer ownership

      if (sale.customerId == null ||
          sale.customerId != payment.customerId) {
        throw StateError(
          'Payment customer does not match invoice customer',
        );
      }

      // 4. Check invoice status

      if (sale.status == 'cancelled' ||
          sale.status == 'returned') {
        throw StateError(
          'Cannot allocate payment to this invoice',
        );
      }

      // 5. Check duplicate allocation

      final existing = await (select(customerPaymentAllocations)
            ..where(
              (t) =>
                  t.customerPaymentId.equals(customerPaymentId) &
                  t.saleId.equals(saleId),
            ))
          .getSingleOrNull();

      if (existing != null) {
        throw StateError(
          'This payment is already allocated to this invoice',
        );
      }

      // 6. Calculate available payment amount

      final allocatedExpression =
          customerPaymentAllocations.amount.sum();

      final allocatedQuery = selectOnly(customerPaymentAllocations)
        ..addColumns([allocatedExpression])
        ..where(
          customerPaymentAllocations.customerPaymentId
              .equals(customerPaymentId),
        );

      final allocatedResult =
          await allocatedQuery.getSingle();

      final alreadyAllocated =
          allocatedResult.read(allocatedExpression) ?? 0.0;

      final paymentAvailable =
          payment.amount - alreadyAllocated;

      const epsilon = 0.000001;

      if (amount > paymentAvailable + epsilon) {
        throw StateError(
          'Allocation exceeds available payment amount. '
          'Available: $paymentAvailable',
        );
      }

      // 7. Check invoice remaining balance

      if (amount > sale.remaining + epsilon) {
        throw StateError(
          'Allocation exceeds invoice remaining balance. '
          'Remaining: ${sale.remaining}',
        );
      }

      // 8. Insert allocation

      final allocationId =
          await into(customerPaymentAllocations).insert(
        CustomerPaymentAllocationsCompanion.insert(
          customerPaymentId: customerPaymentId,
          saleId: saleId,
          amount: amount,
        ),
      );

      // 9. Update invoice balance

      final newPaid = sale.paid + amount;

      final newRemaining =
          (sale.remaining - amount).clamp(0.0, double.infinity);

      final newPaymentStatus =
          newRemaining <= epsilon
              ? 'paid'
              : newPaid > epsilon
                  ? 'partially_paid'
                  : 'unpaid';

      await (update(sales)
            ..where((t) => t.id.equals(saleId)))
          .write(
        SalesCompanion(
          paid: Value(newPaid),
          remaining: Value(newRemaining),
          paymentStatus: Value(newPaymentStatus),
        ),
      );

      return allocationId;
    });
  }

  // =====================================================
  // GET ALLOCATIONS BY PAYMENT
  // =====================================================

  Future<List<CustomerPaymentAllocationDb>>
      getAllocationsByPayment(int paymentId) {
    return (select(customerPaymentAllocations)
          ..where(
            (t) => t.customerPaymentId.equals(paymentId),
          )
          ..orderBy([
            (t) => OrderingTerm.desc(t.createdAt),
          ]))
        .get();
  }

  // =====================================================
  // GET ALLOCATIONS BY SALE
  // =====================================================

  Future<List<CustomerPaymentAllocationDb>>
      getAllocationsBySale(int saleId) {
    return (select(customerPaymentAllocations)
          ..where((t) => t.saleId.equals(saleId))
          ..orderBy([
            (t) => OrderingTerm.desc(t.createdAt),
          ]))
        .get();
  }

  // =====================================================
  // WATCH ALLOCATIONS
  // =====================================================

  Stream<List<CustomerPaymentAllocationDb>>
      watchAllocationsByPayment(int paymentId) {
    return (select(customerPaymentAllocations)
          ..where(
            (t) => t.customerPaymentId.equals(paymentId),
          ))
        .watch();
  }

  // =====================================================
  // DELETE / REVERSE ALLOCATION
  // =====================================================

  Future<void> deleteAllocation(int allocationId) async {
    await transaction(() async {
      // 1. Get allocation

      final allocation = await (select(customerPaymentAllocations)
            ..where((t) => t.id.equals(allocationId)))
          .getSingleOrNull();

      if (allocation == null) {
        throw StateError('Allocation not found');
      }

      // 2. Get payment

      final payment = await (select(customerPayments)
            ..where(
              (t) => t.id.equals(allocation.customerPaymentId),
            ))
          .getSingleOrNull();

      if (payment == null || payment.status != 'posted') {
        throw StateError(
          'Cannot reverse allocation of an invalid payment',
        );
      }

      // 3. Get sale

      final sale = await (select(sales)
            ..where((t) => t.id.equals(allocation.saleId)))
          .getSingleOrNull();

      if (sale == null) {
        throw StateError('Sales invoice not found');
      }

      // 4. Reverse invoice balance

      final newPaid =
          (sale.paid - allocation.amount)
              .clamp(0.0, double.infinity);

      final newRemaining =
          sale.remaining + allocation.amount;

      const epsilon = 0.000001;

      final newPaymentStatus =
          newPaid <= epsilon
              ? 'unpaid'
              : newRemaining <= epsilon
                  ? 'paid'
                  : 'partially_paid';

      // 5. Update invoice

      await (update(sales)
            ..where((t) => t.id.equals(allocation.saleId)))
          .write(
        SalesCompanion(
          paid: Value(newPaid),
          remaining: Value(newRemaining),
          paymentStatus: Value(newPaymentStatus),
        ),
      );

      // 6. Delete allocation

      await (delete(customerPaymentAllocations)
            ..where((t) => t.id.equals(allocationId)))
          .go();
    });
  }
}
