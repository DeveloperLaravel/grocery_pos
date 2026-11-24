
import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../tables/sales_inventory/inventory/stock_operations/contacts/stock_count_items_table.dart';
import '../../../tables/sales_inventory/inventory/stock_operations/contacts/stock_counts_table.dart';

part 'stock_counts_dao.g.dart';

@DriftAccessor(
  tables: [
    StockCounts,
    StockCountItems,
  ],
)
class StockCountsDao extends DatabaseAccessor<AppDatabase>
    with _$StockCountsDaoMixin {
  StockCountsDao(super.db);

  // Get all counts
  Future<List<StockCountDb>> getAllCounts() {
    return (select(stockCounts)
      ..orderBy([
        (t) => OrderingTerm.desc(t.countDate),
      ])).get();
  }

  // Get count by ID
  Future<StockCountDb?> getCountById(int id) {
    return (select(stockCounts)
      ..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  // Get count items
  Future<List<StockCountItemDb>> getCountItems(
    int countId,
  ) {
    return (select(stockCountItems)
      ..where((t) => t.stockCountId.equals(countId))).get();
  }

  // Create count with items
  Future<int> createCount({
    required StockCountsCompanion header,
    required List<StockCountItemsCompanion> items,
  }) {
    return transaction(() async {
      final countId = await into(stockCounts).insert(header);

      if (items.isNotEmpty) {
        await batch((batch) {
          batch.insertAll(
            stockCountItems,
            items.map(
              (item) => item.copyWith(
                stockCountId: Value(countId),
              ),
            ).toList(),
          );
        });
      }

      return countId;
    });
  }

  // Update draft count
  Future<bool> updateCount({
    required int id,
    required StockCountsCompanion entry,
  }) async {
    final rows = await (update(stockCounts)
      ..where((t) => t.id.equals(id) & t.status.equals('draft')))
        .write(entry);

    return rows > 0;
  }

  // Replace count items
  Future<void> replaceCountItems({
    required int countId,
    required List<StockCountItemsCompanion> items,
  }) {
    return transaction(() async {
      final header = await getCountById(countId);

      if (header == null || header.status != 'draft') {
        throw StateError('Count cannot be modified.');
      }

      await (delete(stockCountItems)
        ..where(
          (t) => t.stockCountId.equals(countId),
        )).go();

      if (items.isNotEmpty) {
        await batch((batch) {
          batch.insertAll(
            stockCountItems,
            items.map(
              (item) => item.copyWith(
                stockCountId: Value(countId),
              ),
            ).toList(),
          );
        });
      }
    });
  }

  // Save actual counted quantity
  Future<bool> saveCountedQuantity({
    required int itemId,
    required double countedQuantity,
  }) async {
    if (countedQuantity < 0) {
      throw ArgumentError('Counted quantity cannot be negative.');
    }

    final rows = await (update(stockCountItems)
      ..where((t) => t.id.equals(itemId)))
        .write(
      StockCountItemsCompanion(
        countedQuantity: Value(countedQuantity),
        isCounted: const Value(true),
        countedAt: Value(DateTime.now()),
      ),
    );

    return rows > 0;
  }

  // Delete draft count
  Future<void> deleteDraftCount(int id) {
    return transaction(() async {
      final header = await getCountById(id);

      if (header == null || header.status != 'draft') {
        throw StateError('Only draft counts can be deleted.');
      }

      await (delete(stockCountItems)
        ..where(
          (t) => t.stockCountId.equals(id),
        )).go();

      await (delete(stockCounts)
        ..where((t) => t.id.equals(id))).go();
    });
  }

  // Watch counts
  Stream<List<StockCountDb>> watchCounts() {
    return (select(stockCounts)
      ..orderBy([
        (t) => OrderingTerm.desc(t.countDate),
      ])).watch();
  }
}
