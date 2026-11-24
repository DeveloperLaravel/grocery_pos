
import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../tables/sales_inventory/inventory/stock_operations/adjustments/stock_adjustment_items_table.dart';
import '../../../tables/sales_inventory/inventory/stock_operations/adjustments/stock_adjustment_table.dart';

part 'stock_adjustments_dao.g.dart';

@DriftAccessor(
  tables: [
    StockAdjustments,
    StockAdjustmentItems,
  ],
)
class StockAdjustmentsDao extends DatabaseAccessor<AppDatabase>
    with _$StockAdjustmentsDaoMixin {
  StockAdjustmentsDao(super.db);

  // Get all adjustments
  Future<List<StockAdjustmentDb>> getAllAdjustments() {
    return (select(stockAdjustments)
      ..orderBy([
        (t) => OrderingTerm.desc(t.adjustmentDate),
      ])).get();
  }

  // Get adjustment by ID
  Future<StockAdjustmentDb?> getAdjustmentById(int id) {
    return (select(stockAdjustments)
      ..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  // Get adjustment items
  Future<List<StockAdjustmentItemDb>> getAdjustmentItems(
    int adjustmentId,
  ) {
    return (select(stockAdjustmentItems)
      ..where((t) => t.adjustmentId.equals(adjustmentId))).get();
  }

  // Create adjustment with items
  Future<int> createAdjustment({
    required StockAdjustmentsCompanion header,
    required List<StockAdjustmentItemsCompanion> items,
  }) {
    return transaction(() async {
      final adjustmentId =
          await into(stockAdjustments).insert(header);

      if (items.isNotEmpty) {
        await batch((batch) {
          batch.insertAll(
            stockAdjustmentItems,
            items.map(
              (item) => item.copyWith(
                adjustmentId: Value(adjustmentId),
              ),
            ).toList(),
          );
        });
      }

      return adjustmentId;
    });
  }

  // Update draft header
  Future<bool> updateAdjustment({
    required int id,
    required StockAdjustmentsCompanion entry,
  }) async {
    final rows = await (update(stockAdjustments)
      ..where((t) => t.id.equals(id) & t.status.equals('draft')))
        .write(entry);

    return rows > 0;
  }

  // Replace adjustment items
  Future<void> replaceAdjustmentItems({
    required int adjustmentId,
    required List<StockAdjustmentItemsCompanion> items,
  }) {
    return transaction(() async {
      final header = await getAdjustmentById(adjustmentId);

      if (header == null || header.status != 'draft') {
        throw StateError('Adjustment cannot be modified.');
      }

      await (delete(stockAdjustmentItems)
        ..where(
          (t) => t.adjustmentId.equals(adjustmentId),
        )).go();

      if (items.isNotEmpty) {
        await batch((batch) {
          batch.insertAll(
            stockAdjustmentItems,
            items.map(
              (item) => item.copyWith(
                adjustmentId: Value(adjustmentId),
              ),
            ).toList(),
          );
        });
      }
    });
  }

  // Delete draft adjustment
  Future<void> deleteDraftAdjustment(int id) {
    return transaction(() async {
      final header = await getAdjustmentById(id);

      if (header == null || header.status != 'draft') {
        throw StateError('Only draft adjustments can be deleted.');
      }

      await (delete(stockAdjustmentItems)
        ..where(
          (t) => t.adjustmentId.equals(id),
        )).go();

      await (delete(stockAdjustments)
        ..where((t) => t.id.equals(id))).go();
    });
  }

  // Watch adjustments
  Stream<List<StockAdjustmentDb>> watchAdjustments() {
    return (select(stockAdjustments)
      ..orderBy([
        (t) => OrderingTerm.desc(t.adjustmentDate),
      ])).watch();
  }
}
