
import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../tables/sales_inventory/inventory/returns/return_items_table.dart';
import '../../../tables/sales_inventory/inventory/returns/returns_table.dart';

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

  // Get all returns
  Future<List<ReturnDb>> getAllReturns() {
    return (select(returns)
      ..orderBy([
        (t) => OrderingTerm.desc(t.returnDate),
      ])).get();
  }

  // Get return by ID
  Future<ReturnDb?> getReturnById(int id) {
    return (select(returns)
      ..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  // Get return items
  Future<List<ReturnItemDb>> getReturnItems(int returnId) {
    return (select(returnItems)
      ..where((t) => t.returnId.equals(returnId))).get();
  }

  // Create return with items atomically
  Future<int> createReturn({
    required ReturnsCompanion header,
    required List<ReturnItemsCompanion> items,
  }) {
    return transaction(() async {
      final returnId = await into(returns).insert(header);

      if (items.isNotEmpty) {
        await batch((batch) {
          batch.insertAll(
            returnItems,
            items.map(
              (item) => item.copyWith(
                returnId: Value(returnId),
              ),
            ).toList(),
          );
        });
      }

      return returnId;
    });
  }

  // Update return header
  Future<bool> updateReturn({
    required int id,
    required ReturnsCompanion entry,
  }) {
    return (update(returns)
      ..where((t) => t.id.equals(id))).write(entry).then(
        (rows) => rows > 0,
      );
  }

  // Replace return items
  // Call only while the document is still draft.
  Future<void> replaceReturnItems({
    required int returnId,
    required List<ReturnItemsCompanion> items,
  }) {
    return transaction(() async {
      final header = await getReturnById(returnId);

      if (header == null || header.status != 'draft') {
        throw StateError('Return cannot be modified.');
      }

      await (delete(returnItems)
        ..where((t) => t.returnId.equals(returnId))).go();

      if (items.isNotEmpty) {
        await batch((batch) {
          batch.insertAll(
            returnItems,
            items.map(
              (item) => item.copyWith(
                returnId: Value(returnId),
              ),
            ).toList(),
          );
        });
      }
    });
  }

  // Update document status
  Future<bool> updateReturnStatus({
    required int id,
    required String status,
  }) async {
    final rows = await (update(returns)
      ..where((t) => t.id.equals(id) & t.status.equals('draft')))
        .write(
      ReturnsCompanion(
        status: Value(status),
      ),
    );

    return rows > 0;
  }

  // Delete draft return
  Future<void> deleteDraftReturn(int id) {
    return transaction(() async {
      final header = await getReturnById(id);

      if (header == null || header.status != 'draft') {
        throw StateError('Only draft returns can be deleted.');
      }

      await (delete(returnItems)
        ..where((t) => t.returnId.equals(id))).go();

      await (delete(returns)
        ..where((t) => t.id.equals(id))).go();
    });
  }

  // Watch all returns
  Stream<List<ReturnDb>> watchReturns() {
    return (select(returns)
      ..orderBy([
        (t) => OrderingTerm.desc(t.returnDate),
      ])).watch();
  }
}
