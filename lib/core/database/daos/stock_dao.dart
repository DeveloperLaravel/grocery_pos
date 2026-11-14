
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../app_database.dart';
import '../tables/products_table.dart';
import '../tables/stock_movements_table.dart';
part 'stock_dao.g.dart';

@DriftAccessor(
  tables: [
    Products,
    StockMovements,
  ],
)
@lazySingleton
class StockDao extends DatabaseAccessor<AppDatabase>
    with _$StockDaoMixin {
  StockDao(super.db);

  // =========================================
  // Low Stock Products
  // =========================================
// DateTimeColumn get createdAt =>
//     dateTime().withDefault(currentDateAndTime)();
  /// جلب المنتجات منخفضة المخزون
  Future<List<ProductDb>> getLowStockProducts() {
    final query = select(products)
      ..where(
        (tbl) => tbl.quantity.isSmallerOrEqual(tbl.minStock),
      )
      ..orderBy([
        (tbl) => OrderingTerm.asc(tbl.quantity),
        (tbl) => OrderingTerm.asc(tbl.name),
      ]);

    return query.get();
  }

  /// مراقبة المنتجات منخفضة المخزون
  Stream<List<ProductDb>> watchLowStockProducts() {
    final query = select(products)
      ..where(
        (tbl) => tbl.quantity.isSmallerOrEqual(tbl.minStock),
      )
      ..orderBy([
        (tbl) => OrderingTerm.asc(tbl.quantity),
        (tbl) => OrderingTerm.asc(tbl.name),
      ]);

    return query.watch();
  }

  // =========================================
  // Stock Movements
  // =========================================

  /// جلب حركات المخزون
  Future<List<StockMovementDb>> getStockMovements({
    int? productId,
    int limit = 50,
  }) {
    _validateMovementQuery(
      productId: productId,
      limit: limit,
    );

    final query = select(stockMovements)
      ..orderBy([
        (tbl) => OrderingTerm.desc(tbl.createdAt),
        (tbl) => OrderingTerm.desc(tbl.id),
      ])
      ..limit(limit);

    if (productId != null) {
      query.where(
        (tbl) => tbl.productId.equals(productId),
      );
    }

    return query.get();
  }

  /// مراقبة حركات المخزون
  Stream<List<StockMovementDb>> watchStockMovements({
    int? productId,
    int limit = 50,
  }) {
    _validateMovementQuery(
      productId: productId,
      limit: limit,
    );

    final query = select(stockMovements)
      ..orderBy([
        (tbl) => OrderingTerm.desc(tbl.createdAt),
        (tbl) => OrderingTerm.desc(tbl.id),
      ])
      ..limit(limit);

    if (productId != null) {
      query.where(
        (tbl) => tbl.productId.equals(productId),
      );
    }

    return query.watch();
  }

  // =========================================
  // Insert Stock Movement
  // =========================================

  /// تسجيل حركة مخزون
  Future<int> insertMovement(
    StockMovementsCompanion movement,
  ) {
    return into(stockMovements).insert(movement);
  }

  // =========================================
  // Validation
  // =========================================

  void _validateMovementQuery({
    int? productId,
    required int limit,
  }) {
    if (productId != null && productId <= 0) {
      throw ArgumentError.value(
        productId,
        'productId',
        'معرف المنتج يجب أن يكون أكبر من صفر',
      );
    }

    if (limit <= 0) {
      throw ArgumentError.value(
        limit,
        'limit',
        'عدد النتائج يجب أن يكون أكبر من صفر',
      );
    }
  }
}
