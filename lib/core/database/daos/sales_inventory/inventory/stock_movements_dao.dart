import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../tables/sales_inventory/inventory/stock_movements_table.dart';

part 'stock_movements_dao.g.dart';

@DriftAccessor(
  tables: [
    StockMovements,
  ],
)
class StockMovementsDao extends DatabaseAccessor<AppDatabase>
    with _$StockMovementsDaoMixin {
  StockMovementsDao(super.db);

  Future<List<StockMovementDb>> getAllMovements() {
    return (select(stockMovements)
      ..orderBy([
        (t) => OrderingTerm.desc(t.movementDate),
      ])).get();
  }

  Future<List<StockMovementDb>> getProductMovements(
    int productId,
  ) {
    return (select(stockMovements)
      ..where((t) => t.productId.equals(productId))
      ..orderBy([
        (t) => OrderingTerm.desc(t.movementDate),
      ])).get();
  }

  Future<List<StockMovementDb>> getStoreMovements(
    int storeId,
  ) {
    return (select(stockMovements)
      ..where((t) => t.storeId.equals(storeId))
      ..orderBy([
        (t) => OrderingTerm.desc(t.movementDate),
      ])).get();
  }

  Future<List<StockMovementDb>> getReferenceMovements({
    required String referenceType,
    required int referenceId,
  }) {
    return (select(stockMovements)
      ..where(
        (t) =>
            t.referenceType.equals(referenceType) &
            t.referenceId.equals(referenceId),
      )).get();
  }

  Future<int> insertMovement(
    StockMovementsCompanion entry,
  ) {
    return into(stockMovements).insert(entry);
  }

  Stream<List<StockMovementDb>> watchMovements() {
    return (select(stockMovements)
      ..orderBy([
        (t) => OrderingTerm.desc(t.movementDate),
      ])).watch();
  }
}