
import 'package:drift/drift.dart';

import '../../../app_database.dart';

import '../../../tables/sales_inventory/inventory/product_stocks_table.dart';

part 'product_stocks_dao.g.dart';

@DriftAccessor(
  tables: [ProductStocks],
)
class ProductStocksDao extends DatabaseAccessor<AppDatabase>
    with _$ProductStocksDaoMixin {
  ProductStocksDao(super.db);

  // =====================================================
  // 1. Validation
  // =====================================================

  void _validateId(int id, String field) {
    if (id <= 0) {
      throw ArgumentError('$field غير صالح.');
    }
  }

  // =====================================================
  // 2. Insert Initial Stock
  // =====================================================

  Future<int> insertStock(ProductStocksCompanion stock) {
    return into(productStocks).insert(stock);
  }

  // =====================================================
  // 3. Update Stock
  // =====================================================

  Future<bool> updateStock(ProductStockDb stock) {
    _validateId(stock.id, 'رقم سجل المخزون');

    if (stock.quantity < 0 ||
        stock.reservedQuantity < 0 ||
        stock.availableQuantity < 0 ||
        stock.averageCost < 0 ||
        stock.totalCost < 0) {
      throw ArgumentError(
        'لا يمكن أن تكون كميات أو تكاليف المخزون سالبة.',
      );
    }

    if (stock.reservedQuantity > stock.quantity) {
      throw ArgumentError(
        'الكمية المحجوزة لا يمكن أن تتجاوز كمية المخزون.',
      );
    }

    final expectedAvailable =
        stock.quantity - stock.reservedQuantity;

    if ((stock.availableQuantity - expectedAvailable).abs() >
        0.000001) {
      throw ArgumentError(
        'الكمية المتاحة لا تطابق الكمية الفعلية بعد خصم المحجوز.',
      );
    }

    return update(productStocks).replace(
      stock.copyWith(
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  // =====================================================
  // 4. Get All Stocks
  // =====================================================

  Future<List<ProductStockDb>> getAllStocks() {
    return (select(productStocks)
          ..orderBy([
            (t) => OrderingTerm.asc(t.id),
          ]))
        .get();
  }

  // =====================================================
  // 5. Get Active Stocks
  // =====================================================

  Future<List<ProductStockDb>> getActiveStocks() {
    return (select(productStocks)
          ..where(
            (t) => t.isActive.equals(true),
          )
          ..orderBy([
            (t) => OrderingTerm.asc(t.productId),
          ]))
        .get();
  }

  // =====================================================
  // 6. Get Stock By ID
  // =====================================================

  Future<ProductStockDb?> getStockById(int id) {
    _validateId(id, 'رقم سجل المخزون');

    return (select(productStocks)
          ..where(
            (t) => t.id.equals(id),
          ))
        .getSingleOrNull();
  }

  // =====================================================
  // 7. Get Product Stock In Store
  // =====================================================

  Future<ProductStockDb?> getProductStock({
    required int storeId,
    required int productId,
  }) {
    _validateId(storeId, 'رقم المخزن');
    _validateId(productId, 'رقم المنتج');

    return (select(productStocks)
          ..where(
            (t) =>
                t.storeId.equals(storeId) &
                t.productId.equals(productId),
          ))
        .getSingleOrNull();
  }

  // =====================================================
  // 8. Get Store Stocks
  // =====================================================

  Future<List<ProductStockDb>> getStocksByStore(
    int storeId, {
    bool activeOnly = false,
  }) {
    _validateId(storeId, 'رقم المخزن');

    final query = select(productStocks)
      ..where(
        (t) => t.storeId.equals(storeId),
      )
      ..orderBy([
        (t) => OrderingTerm.asc(t.productId),
      ]);

    if (activeOnly) {
      query.where(
        (t) => t.isActive.equals(true),
      );
    }

    return query.get();
  }

  // =====================================================
  // 9. Get Product Stocks Across Stores
  // =====================================================

  Future<List<ProductStockDb>> getStocksByProduct(
    int productId, {
    bool activeOnly = false,
  }) {
    _validateId(productId, 'رقم المنتج');

    final query = select(productStocks)
      ..where(
        (t) => t.productId.equals(productId),
      )
      ..orderBy([
        (t) => OrderingTerm.asc(t.storeId),
      ]);

    if (activeOnly) {
      query.where(
        (t) => t.isActive.equals(true),
      );
    }

    return query.get();
  }

  // =====================================================
  // 10. Get Low Stock
  // =====================================================

  Future<List<ProductStockDb>> getLowStocks({
    int? storeId,
  }) {
    if (storeId != null) {
      _validateId(storeId, 'رقم المخزن');
    }

    final query = select(productStocks)
      ..where(
        (t) =>
            t.availableQuantity.isSmallerOrEqual(t.minStock) &
            t.isActive.equals(true),
      )
      ..orderBy([
        (t) => OrderingTerm.asc(t.availableQuantity),
      ]);

    if (storeId != null) {
      query.where(
        (t) => t.storeId.equals(storeId),
      );
    }

    return query.get();
  }

  // =====================================================
  // 11. Get Out Of Stock
  // =====================================================

  Future<List<ProductStockDb>> getOutOfStock({
    int? storeId,
  }) {
    if (storeId != null) {
      _validateId(storeId, 'رقم المخزن');
    }

    final query = select(productStocks)
      ..where(
        (t) =>
            t.availableQuantity.isSmallerOrEqualValue(0) &
            t.isActive.equals(true),
      );

    if (storeId != null) {
      query.where(
        (t) => t.storeId.equals(storeId),
      );
    }

    return query.get();
  }

  // =====================================================
  // 12. Watch All Stocks
  // =====================================================

  Stream<List<ProductStockDb>> watchAllStocks() {
    return (select(productStocks)
          ..orderBy([
            (t) => OrderingTerm.asc(t.id),
          ]))
        .watch();
  }

  // =====================================================
  // 13. Watch Active Stocks
  // =====================================================

  Stream<List<ProductStockDb>> watchActiveStocks() {
    return (select(productStocks)
          ..where(
            (t) => t.isActive.equals(true),
          ))
        .watch();
  }

  // =====================================================
  // 14. Watch Store Stocks
  // =====================================================

  Stream<List<ProductStockDb>> watchStocksByStore(
    int storeId,
  ) {
    _validateId(storeId, 'رقم المخزن');

    return (select(productStocks)
          ..where(
            (t) =>
                t.storeId.equals(storeId) &
                t.isActive.equals(true),
          )
          ..orderBy([
            (t) => OrderingTerm.asc(t.productId),
          ]))
        .watch();
  }

  // =====================================================
  // 15. Watch Product Stock
  // =====================================================

  Stream<ProductStockDb?> watchProductStock({
    required int storeId,
    required int productId,
  }) {
    _validateId(storeId, 'رقم المخزن');
    _validateId(productId, 'رقم المنتج');

    return (select(productStocks)
          ..where(
            (t) =>
                t.storeId.equals(storeId) &
                t.productId.equals(productId),
          ))
        .watchSingleOrNull();
  }

  // =====================================================
  // 16. Watch Low Stocks
  // =====================================================

  Stream<List<ProductStockDb>> watchLowStocks({
    int? storeId,
  }) {
    if (storeId != null) {
      _validateId(storeId, 'رقم المخزن');
    }

    final query = select(productStocks)
      ..where(
        (t) =>
            t.availableQuantity.isSmallerOrEqual(t.minStock) &
            t.isActive.equals(true),
      )
      ..orderBy([
        (t) => OrderingTerm.asc(t.availableQuantity),
      ]);

    if (storeId != null) {
      query.where(
        (t) => t.storeId.equals(storeId),
      );
    }

    return query.watch();
  }

  // =====================================================
  // 17. Watch Out Of Stock
  // =====================================================

  Stream<List<ProductStockDb>> watchOutOfStock({
    int? storeId,
  }) {
    if (storeId != null) {
      _validateId(storeId, 'رقم المخزن');
    }

    final query = select(productStocks)
      ..where(
        (t) =>
            t.availableQuantity.isSmallerOrEqualValue(0) &
            t.isActive.equals(true),
      );

    if (storeId != null) {
      query.where(
        (t) => t.storeId.equals(storeId),
      );
    }

    return query.watch();
  }

  // =====================================================
  // 18. Count Products In Store
  // =====================================================

  Future<int> countProductsInStore(int storeId) async {
    _validateId(storeId, 'رقم المخزن');

    final countExpression = productStocks.id.count();

    final query = selectOnly(productStocks)
      ..addColumns([countExpression])
      ..where(
        productStocks.storeId.equals(storeId) &
            productStocks.isActive.equals(true),
      );

    return query
        .map((row) => row.read(countExpression) ?? 0)
        .getSingle();
  }

  // =====================================================
  // 19. Count Low Stock
  // =====================================================

  Future<int> countLowStocks({
    int? storeId,
  }) async {
    if (storeId != null) {
      _validateId(storeId, 'رقم المخزن');
    }

    final countExpression = productStocks.id.count();

    final query = selectOnly(productStocks)
      ..addColumns([countExpression])
      ..where(
        productStocks.availableQuantity
                .isSmallerOrEqual(productStocks.minStock) &
            productStocks.isActive.equals(true),
      );

    if (storeId != null) {
      query.where(
        productStocks.storeId.equals(storeId),
      );
    }

    return query
        .map((row) => row.read(countExpression) ?? 0)
        .getSingle();
  }

  // =====================================================
  // 20. Count Out Of Stock
  // =====================================================

  Future<int> countOutOfStock({
    int? storeId,
  }) async {
    if (storeId != null) {
      _validateId(storeId, 'رقم المخزن');
    }

    final countExpression = productStocks.id.count();

    final query = selectOnly(productStocks)
      ..addColumns([countExpression])
      ..where(
        productStocks.availableQuantity
                .isSmallerOrEqualValue(0) &
            productStocks.isActive.equals(true),
      );

    if (storeId != null) {
      query.where(
        productStocks.storeId.equals(storeId),
      );
    }

    return query
        .map((row) => row.read(countExpression) ?? 0)
        .getSingle();
  }

  // =====================================================
  // 21. Deactivate Stock Record
  // Preserve Historical Data
  // =====================================================

  Future<int> deactivateStock(int id) async {
    _validateId(id, 'رقم سجل المخزون');

    final stock = await getStockById(id);

    if (stock == null) {
      return 0;
    }

    if (stock.quantity > 0 ||
        stock.reservedQuantity > 0) {
      throw StateError(
        'لا يمكن تعطيل سجل مخزون يحتوي على كمية أو حجز.',
      );
    }

    return (update(productStocks)
          ..where(
            (t) => t.id.equals(id),
          ))
        .write(
      ProductStocksCompanion(
        isActive: const Value(false),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  // =====================================================
  // 22. Activate Stock Record
  // =====================================================

  Future<int> activateStock(int id) {
    _validateId(id, 'رقم سجل المخزون');

    return (update(productStocks)
          ..where(
            (t) => t.id.equals(id),
          ))
        .write(
      ProductStocksCompanion(
        isActive: const Value(true),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }
}
