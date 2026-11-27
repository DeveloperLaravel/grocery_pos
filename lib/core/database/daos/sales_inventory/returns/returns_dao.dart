
import 'package:drift/drift.dart';

import '../../../app_database.dart';

import '../../../tables/sales_inventory/returns/returns_table.dart';
import '../../../tables/sales_inventory/returns/return_items_table.dart';

part 'returns_dao.g.dart';

@DriftAccessor(
  tables: [
    Returns,
    ReturnItems,
  ],
)
class ReturnsDao extends DatabaseAccessor<AppDatabase>
    with _$ReturnsDaoMixin {
  ReturnsDao(super.db);

  // =====================================================
  // 1. Create Return
  // =====================================================

  Future<int> createReturn({
    required String returnNumber,
    required int saleId,
    int? customerId,
    String returnType = 'partial',
    String? reason,
    String? notes,
    int? createdBy,
  }) async {
    return into(returns).insert(
      ReturnsCompanion.insert(
        returnNumber: returnNumber,
        saleId: saleId,
        customerId: Value(customerId),
        returnType: Value(returnType),
        reason: Value(reason),
        notes: Value(notes),
        createdBy: Value(createdBy),
      ),
    );
  }

  // =====================================================
  // 2. Get All Returns
  // =====================================================

  Future<List<ReturnDb>> getAllReturns() {
    return (select(returns)
          ..orderBy([
            (t) => OrderingTerm.desc(t.createdAt),
          ]))
        .get();
  }

  // =====================================================
  // 3. Watch All Returns
  // =====================================================

  Stream<List<ReturnDb>> watchAllReturns() {
    return (select(returns)
          ..orderBy([
            (t) => OrderingTerm.desc(t.createdAt),
          ]))
        .watch();
  }

  // =====================================================
  // 4. Get Return By ID
  // =====================================================

  Future<ReturnDb?> getReturnById(int id) {
    return (select(returns)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  // =====================================================
  // 5. Watch Return By ID
  // =====================================================

  Stream<ReturnDb?> watchReturnById(int id) {
    return (select(returns)
          ..where((t) => t.id.equals(id)))
        .watchSingleOrNull();
  }

  // =====================================================
  // 6. Get Returns By Sale ID
  // =====================================================

  Future<List<ReturnDb>> getReturnsBySaleId(int saleId) {
    return (select(returns)
          ..where((t) => t.saleId.equals(saleId))
          ..orderBy([
            (t) => OrderingTerm.desc(t.createdAt),
          ]))
        .get();
  }

  // =====================================================
  // 7. Watch Returns By Sale ID
  // =====================================================

  Stream<List<ReturnDb>> watchReturnsBySaleId(int saleId) {
    return (select(returns)
          ..where((t) => t.saleId.equals(saleId))
          ..orderBy([
            (t) => OrderingTerm.desc(t.createdAt),
          ]))
        .watch();
  }

  // =====================================================
  // 8. Get Returns By Status
  // =====================================================

  Future<List<ReturnDb>> getReturnsByStatus(String status) {
    return (select(returns)
          ..where((t) => t.status.equals(status))
          ..orderBy([
            (t) => OrderingTerm.desc(t.createdAt),
          ]))
        .get();
  }

  // =====================================================
  // 9. Get Return Items
  // =====================================================

  Future<List<ReturnItemDb>> getReturnItems(int returnId) {
    return (select(returnItems)
          ..where((t) => t.returnId.equals(returnId)))
        .get();
  }

  // =====================================================
  // 10. Calculate Return Totals
  // =====================================================

  Future<void> recalculateReturn(int returnId) async {
    await transaction(() async {
      final returnData = await getReturnById(returnId);

      if (returnData == null) {
        throw StateError('Return not found.');
      }

      if (returnData.status != 'draft') {
        throw StateError(
          'Only draft returns can be recalculated.',
        );
      }

      final items = await getReturnItems(returnId);

      final subtotal = items.fold<double>(
        0,
        (sum, item) => sum + item.subtotal,
      );

      final discount = items.fold<double>(
        0,
        (sum, item) => sum + item.discountAmount,
      );

      final tax = items.fold<double>(
        0,
        (sum, item) => sum + item.taxAmount,
      );

      final total = items.fold<double>(
        0,
        (sum, item) => sum + item.totalAmount,
      );

      await (update(returns)
            ..where((t) => t.id.equals(returnId)))
          .write(
        ReturnsCompanion(
          subtotal: Value(subtotal),
          discountAmount: Value(discount),
          taxAmount: Value(tax),
          totalAmount: Value(total),
          remainingRefundAmount: Value(total),
          updatedAt: Value(DateTime.now()),
        ),
      );
    });
  }

  // =====================================================
  // 11. Confirm Return
  // =====================================================

  Future<void> confirmReturn({
    required int returnId,
    required int confirmedBy,
  }) async {
    await transaction(() async {
      final returnData = await getReturnById(returnId);

      if (returnData == null) {
        throw StateError('Return not found.');
      }

      if (returnData.status != 'draft') {
        throw StateError(
          'Only draft returns can be confirmed.',
        );
      }

      final items = await getReturnItems(returnId);

      if (items.isEmpty) {
        throw StateError(
          'Cannot confirm an empty return.',
        );
      }

      // Validate every returned item.
      for (final item in items) {
        final previousItems = await (select(returnItems)
              .join([
                innerJoin(
                  returns,
                  returns.id.equalsExp(returnItems.returnId),
                ),
              ])
              ..where(
                returnItems.saleItemId.equals(item.saleItemId) &
                    returns.saleId.equals(returnData.saleId) &
                    returns.status.equals('confirmed'),
              ))
            .get();

        final previouslyReturned = previousItems.fold<double>(
          0,
          (sum, row) => sum + row.readTable(returnItems).quantity,
        );

        final availableQuantity =
            item.originalQuantity - previouslyReturned;

        if (item.quantity > availableQuantity + 0.000001) {
          throw StateError(
            'Returned quantity exceeds available quantity '
            'for sale item ${item.saleItemId}. '
            'Available: $availableQuantity',
          );
        }
      }

      // Calculate totals again before confirmation.
      final subtotal = items.fold<double>(
        0,
        (sum, item) => sum + item.subtotal,
      );

      final discount = items.fold<double>(
        0,
        (sum, item) => sum + item.discountAmount,
      );

      final tax = items.fold<double>(
        0,
        (sum, item) => sum + item.taxAmount,
      );

      final total = items.fold<double>(
        0,
        (sum, item) => sum + item.totalAmount,
      );

      if (total <= 0) {
        throw StateError('Invalid return total.');
      }

      await (update(returns)
            ..where((t) => t.id.equals(returnId)))
          .write(
        ReturnsCompanion(
          subtotal: Value(subtotal),
          discountAmount: Value(discount),
          taxAmount: Value(tax),
          totalAmount: Value(total),
          remainingRefundAmount: Value(total),
          status: const Value('confirmed'),
          confirmedBy: Value(confirmedBy),
          confirmedAt: Value(DateTime.now()),
          updatedAt: Value(DateTime.now()),
        ),
      );
    });
  }

  // =====================================================
  // 12. Cancel Draft Return
  // =====================================================

  Future<void> cancelReturn({
    required int returnId,
    required int cancelledBy,
  }) async {
    await transaction(() async {
      final returnData = await getReturnById(returnId);

      if (returnData == null) {
        throw StateError('Return not found.');
      }

      if (returnData.status != 'draft') {
        throw StateError(
          'Only draft returns can be cancelled. '
          'Confirmed returns require a reversal operation.',
        );
      }

      await (update(returns)
            ..where((t) => t.id.equals(returnId)))
          .write(
        ReturnsCompanion(
          status: const Value('cancelled'),
          cancelledBy: Value(cancelledBy),
          cancelledAt: Value(DateTime.now()),
          updatedAt: Value(DateTime.now()),
        ),
      );
    });
  }

  // =====================================================
  // 13. Delete Draft Return
  // =====================================================

  Future<int> deleteDraftReturn(int returnId) async {
    return transaction(() async {
      final returnData = await getReturnById(returnId);

      if (returnData == null) {
        return 0;
      }

      if (returnData.status != 'draft') {
        throw StateError(
          'Only draft returns can be deleted.',
        );
      }

      // ReturnItems are deleted by cascade.
      return (delete(returns)
            ..where((t) => t.id.equals(returnId)))
          .go();
    });
  }

  // =====================================================
  // 14. Update Return Notes
  // =====================================================

  Future<bool> updateReturnNotes({
    required int returnId,
    String? reason,
    String? notes,
  }) async {
    final returnData = await getReturnById(returnId);

    if (returnData == null || returnData.status != 'draft') {
      return false;
    }

    await (update(returns)
          ..where((t) => t.id.equals(returnId)))
        .write(
      ReturnsCompanion(
        reason: Value(reason),
        notes: Value(notes),
        updatedAt: Value(DateTime.now()),
      ),
    );

    return true;
  }

  // =====================================================
  // 15. Refund Amount
  // =====================================================

  Future<void> recordRefund({
    required int returnId,
    required double amount,
  }) async {
    if (amount <= 0) {
      throw ArgumentError('Refund amount must be positive.');
    }

    await transaction(() async {
      final data = await getReturnById(returnId);

      if (data == null || data.status != 'confirmed') {
        throw StateError('Return is not confirmed.');
      }

      if (data.refundStatus == 'not_applicable') {
        throw StateError('Refund is not applicable.');
      }

      final remaining = data.totalAmount - data.refundedAmount;

      if (amount > remaining + 0.000001) {
        throw StateError('Refund exceeds remaining amount.');
      }

      final newRefunded = data.refundedAmount + amount;
      final newRemaining = data.totalAmount - newRefunded;

      final isFullyRefunded = newRemaining <= 0.000001;

      await (update(returns)
            ..where((t) => t.id.equals(returnId)))
          .write(
        ReturnsCompanion(
          refundedAmount: Value(
            isFullyRefunded ? data.totalAmount : newRefunded,
          ),
          remainingRefundAmount: Value(
            isFullyRefunded ? 0 : newRemaining,
          ),
          refundStatus: Value(
            isFullyRefunded ? 'refunded' : 'partially_refunded',
          ),
          refundedAt: Value(
            isFullyRefunded ? DateTime.now() : data.refundedAt,
          ),
          updatedAt: Value(DateTime.now()),
        ),
      );
    });
  }

  // =====================================================
  // 16. Statistics
  // =====================================================

  Future<int> getReturnsCount() async {
    final count = countAll();

    final query = selectOnly(returns)
      ..addColumns([count]);

    return await query.map((row) => row.read(count)).getSingle() ?? 0;
  }

  Future<double> getTotalReturnedAmount() async {
    final result = await (select(returns)
          ..where((t) => t.status.equals('confirmed')))
        .get();

    return result.fold<double>(
      0,
      (sum, item) => sum + item.totalAmount,
    );
  }

  // =====================================================
  // 17. Search By Return Number
  // =====================================================

  Future<ReturnDb?> getByReturnNumber(String number) {
    return (select(returns)
          ..where((t) => t.returnNumber.equals(number)))
        .getSingleOrNull();
  }
}
