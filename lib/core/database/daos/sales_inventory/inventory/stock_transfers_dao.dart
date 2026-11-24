
import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../tables/sales_inventory/inventory/stock_operations/transfers/stock_transfer_items_table.dart';
import '../../../tables/sales_inventory/inventory/stock_operations/transfers/stock_transfers_table.dart';

part 'stock_transfers_dao.g.dart';

@DriftAccessor(
  tables: [
    StockTransfers,
    StockTransferItems,
  ],
)
class StockTransfersDao extends DatabaseAccessor<AppDatabase>
    with _$StockTransfersDaoMixin {
  StockTransfersDao(super.db);

  // Get all transfers
  Future<List<StockTransferDb>> getAllTransfers() {
    return (select(stockTransfers)
      ..orderBy([
        (t) => OrderingTerm.desc(t.transferDate),
      ])).get();
  }

  // Get transfer by ID
  Future<StockTransferDb?> getTransferById(int id) {
    return (select(stockTransfers)
      ..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  // Get transfer items
  Future<List<StockTransferItemDb>> getTransferItems(
    int transferId,
  ) {
    return (select(stockTransferItems)
      ..where((t) => t.transferId.equals(transferId))).get();
  }

  // Create transfer with items
  Future<int> createTransfer({
    required StockTransfersCompanion header,
    required List<StockTransferItemsCompanion> items,
  }) {
    return transaction(() async {
      final transferId = await into(stockTransfers).insert(header);

      if (items.isNotEmpty) {
        await batch((batch) {
          batch.insertAll(
            stockTransferItems,
            items.map(
              (item) => item.copyWith(
                transferId: Value(transferId),
              ),
            ).toList(),
          );
        });
      }

      return transferId;
    });
  }

  // Update transfer header
  Future<bool> updateTransfer({
    required int id,
    required StockTransfersCompanion entry,
  }) async {
    final rows = await (update(stockTransfers)
      ..where((t) => t.id.equals(id) & t.status.equals('draft')))
        .write(entry);

    return rows > 0;
  }

  // Replace transfer items
  Future<void> replaceTransferItems({
    required int transferId,
    required List<StockTransferItemsCompanion> items,
  }) {
    return transaction(() async {
      final header = await getTransferById(transferId);

      if (header == null || header.status != 'draft') {
        throw StateError('Transfer cannot be modified.');
      }

      await (delete(stockTransferItems)
        ..where((t) => t.transferId.equals(transferId))).go();

      if (items.isNotEmpty) {
        await batch((batch) {
          batch.insertAll(
            stockTransferItems,
            items.map(
              (item) => item.copyWith(
                transferId: Value(transferId),
              ),
            ).toList(),
          );
        });
      }
    });
  }

  // Update status
  Future<bool> updateTransferStatus({
    required int id,
    required String status,
  }) async {
    final rows = await (update(stockTransfers)
      ..where((t) => t.id.equals(id) & t.status.equals('draft')))
        .write(
      StockTransfersCompanion(
        status: Value(status),
      ),
    );

    return rows > 0;
  }

  // Delete draft transfer
  Future<void> deleteDraftTransfer(int id) {
    return transaction(() async {
      final header = await getTransferById(id);

      if (header == null || header.status != 'draft') {
        throw StateError('Only draft transfers can be deleted.');
      }

      await (delete(stockTransferItems)
        ..where((t) => t.transferId.equals(id))).go();

      await (delete(stockTransfers)
        ..where((t) => t.id.equals(id))).go();
    });
  }

  // Watch transfers
  Stream<List<StockTransferDb>> watchTransfers() {
    return (select(stockTransfers)
      ..orderBy([
        (t) => OrderingTerm.desc(t.transferDate),
      ])).watch();
  }
}
