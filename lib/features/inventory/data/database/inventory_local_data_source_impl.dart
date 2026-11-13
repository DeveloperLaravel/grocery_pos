
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/database/daos/products_dao.dart';
import '../../../../core/database/daos/stock_dao.dart';

import '../models/inventory_item_model.dart';
import '../models/inventory_summary_model.dart';
import '../models/stock_movement_model.dart';

import '../mappers/inventory_mapper.dart';
import 'inventory_local_data_source.dart';

@LazySingleton(as: InventoryLocalDataSource)
class InventoryLocalDataSourceImpl
    implements InventoryLocalDataSource {
  final AppDatabase _database;
  final ProductsDao _productsDao;
  final StockDao _stockDao;

  InventoryLocalDataSourceImpl(
    this._database,
    this._productsDao,
    this._stockDao,
  );

  // =========================================
  // Inventory Products
  // =========================================

  @override
  Future<List<InventoryItemModel>> getInventory() async {
    final products = await _productsDao.getAllProducts();

    return products
        .map((product) => product.toModel())
        .toList();
  }

  @override
  Stream<List<InventoryItemModel>> watchInventory() {
    return _productsDao.watchAllProducts().map(
      (products) => products
          .map((product) => product.toModel())
          .toList(),
    );
  }

  // =========================================
  // Inventory Summary
  // =========================================

  @override
  Future<InventorySummaryModel> getInventorySummary() async {
    final products = await _productsDao.getAllProducts();

    return products.toSummaryModel();
  }

  @override
  Stream<InventorySummaryModel> watchInventorySummary() {
    return _productsDao.watchAllProducts().map(
      (products) => products.toSummaryModel(),
    );
  }

  // =========================================
  // Low Stock
  // =========================================

  @override
  Future<List<InventoryItemModel>> getLowStockProducts() async {
    final products = await _stockDao.getLowStockProducts();

    return products
        .map((product) => product.toModel())
        .toList();
  }

  @override
  Stream<List<InventoryItemModel>> watchLowStockProducts() {
    return _stockDao.watchLowStockProducts().map(
      (products) => products
          .map((product) => product.toModel())
          .toList(),
    );
  }

  // =========================================
  // Stock Movements
  // =========================================

  @override
  Future<List<StockMovementModel>> getStockMovements({
    int? productId,
    int limit = 50,
  }) async {
    _validateLimit(limit);

    final movements = await _stockDao.getStockMovements(
      productId: productId,
      limit: limit,
    );

    return movements
        .map((movement) => movement.toModel())
        .toList();
  }

  @override
  Stream<List<StockMovementModel>> watchStockMovements({
    int? productId,
    int limit = 50,
  }) {
    _validateLimit(limit);

    return _stockDao
        .watchStockMovements(
          productId: productId,
          limit: limit,
        )
        .map(
          (movements) => movements
              .map((movement) => movement.toModel())
              .toList(),
        );
  }

  // =========================================
  // Stock Adjustment
  // =========================================

  @override
  Future<void> adjustStock({
    required int productId,
    required double quantity,
    required String type,
    String? reference,
    String? note,
  }) async {
    _validateAdjustment(
      productId: productId,
      quantity: quantity,
      type: type,
    );

    await _database.transaction(() async {
      // 1. Get product
      final product = await _productsDao.getProductById(productId);

      if (product == null) {
        throw StateError('المنتج غير موجود');
      }

      // 2. Determine movement direction
      final isIncoming = type == 'in' || type == 'return';

      final currentQuantity = product.quantity;

      final newQuantity = isIncoming
          ? currentQuantity + quantity
          : currentQuantity - quantity;

      // 3. Prevent negative stock
      if (newQuantity < 0) {
        throw StateError(
          'الكمية المطلوبة أكبر من الكمية المتوفرة في المخزون',
        );
      }

      final now = DateTime.now();

      // 4. Update product quantity
      final updated = await _productsDao.updateProduct(
        productId,
        ProductsCompanion(
          quantity: Value(newQuantity),
          updatedAt: Value(now),
        ),
      );

      if (!updated) {
        throw StateError('تعذر تحديث كمية المنتج');
      }

      // 5. Insert stock movement
      await _stockDao.insertMovement(
        StockMovementsCompanion.insert(
          productId: productId,
          type: type,
          quantity: quantity,
          reference: Value(reference),
          note: Value(note),
        ),
      );
    });
  }

  // =========================================
  // Validation
  // =========================================

  void _validateAdjustment({
    required int productId,
    required double quantity,
    required String type,
  }) {
    if (productId <= 0) {
      throw ArgumentError.value(
        productId,
        'productId',
        'معرف المنتج غير صالح',
      );
    }

    if (!quantity.isFinite || quantity <= 0) {
      throw ArgumentError.value(
        quantity,
        'quantity',
        'يجب أن تكون الكمية رقماً موجباً وصالحاً',
      );
    }

    const allowedTypes = {
      'in',
      'out',
      'sale',
      'return',
    };

    if (!allowedTypes.contains(type)) {
      throw ArgumentError.value(
        type,
        'type',
        'نوع حركة المخزون غير مدعوم',
      );
    }
  }

  void _validateLimit(int limit) {
    if (limit <= 0) {
      throw ArgumentError.value(
        limit,
        'limit',
        'يجب أن يكون حد النتائج أكبر من صفر',
      );
    }
  }
}
