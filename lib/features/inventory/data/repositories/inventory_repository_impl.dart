
import 'package:fpdart/fpdart.dart';
import 'package:grocery_pos/core/error/failure.dart';
import 'package:injectable/injectable.dart';


import '../../domain/entities/inventory_item.dart';
import '../../domain/entities/inventory_summary.dart';

import '../../domain/entities/stock_movement_entity.dart';
import '../../domain/repositories/inventory_repository.dart';

import '../database/inventory_local_data_source.dart';
import '../mappers/inventory_mapper.dart';

@LazySingleton(as: InventoryRepository)
class InventoryRepositoryImpl implements InventoryRepository {
  final InventoryLocalDataSource _localDataSource;

  InventoryRepositoryImpl(this._localDataSource);

  // =========================================
  // Get Inventory
  // =========================================

  @override
  TaskEither<Failure, List<InventoryItem>> getInventory() {
    return TaskEither.tryCatch(
      () async {
        final models = await _localDataSource.getInventory();

        return models
            .map((model) => model.toEntity())
            .toList();
      },
      _handleError,
    );
  }

  // =========================================
  // Watch Inventory
  // =========================================

  @override
  Stream<List<InventoryItem>> watchInventory() {
    return _localDataSource.watchInventory().map(
      (models) => models
          .map((model) => model.toEntity())
          .toList(),
    );
  }

  // =========================================
  // Get Inventory Summary
  // =========================================

  @override
  TaskEither<Failure, InventorySummary> getInventorySummary() {
    return TaskEither.tryCatch(
      () async {
        final model =
            await _localDataSource.getInventorySummary();

        return model.toEntity();
      },
      _handleError,
    );
  }

  // =========================================
  // Watch Inventory Summary
  // =========================================

  @override
  Stream<InventorySummary> watchInventorySummary() {
    return _localDataSource.watchInventorySummary().map(
      (model) => model.toEntity(),
    );
  }

  // =========================================
  // Get Low Stock Products
  // =========================================

  @override
  TaskEither<Failure, List<InventoryItem>> getLowStockProducts() {
    return TaskEither.tryCatch(
      () async {
        final models =
            await _localDataSource.getLowStockProducts();

        return models
            .map((model) => model.toEntity())
            .toList();
      },
      _handleError,
    );
  }

  // =========================================
  // Watch Low Stock Products
  // =========================================

  @override
  Stream<List<InventoryItem>> watchLowStockProducts() {
    return _localDataSource.watchLowStockProducts().map(
      (models) => models
          .map((model) => model.toEntity())
          .toList(),
    );
  }

  // =========================================
  // Get Stock Movements
  // =========================================

  @override
  TaskEither<Failure, List<StockMovement>> getStockMovements({
    int? productId,
    int limit = 50,
  }) {
    return TaskEither.tryCatch(
      () async {
        final models = await _localDataSource.getStockMovements(
          productId: productId,
          limit: limit,
        );

        return models
            .map((model) => model.toEntity())
            .toList();
      },
      _handleError,
    );
  }

  // =========================================
  // Watch Stock Movements
  // =========================================

  @override
  Stream<List<StockMovement>> watchStockMovements({
    int? productId,
    int limit = 50,
  }) {
    return _localDataSource.watchStockMovements(
      productId: productId,
      limit: limit,
    ).map(
      (models) => models
          .map((model) => model.toEntity())
          .toList(),
    );
  }

  // =========================================
  // Adjust Stock
  // =========================================

  @override
  TaskEither<Failure, Unit> adjustStock({
    required int productId,
    required double quantity,
    required String type,
    String? reference,
    String? note,
  }) {
    return TaskEither.tryCatch(
      () async {
        await _localDataSource.adjustStock(
          productId: productId,
          quantity: quantity,
          type: type,
          reference: reference,
          note: note,
        );

        return unit;
      },
      _handleError,
    );
  }

  // =========================================
  // Error Handling
  // =========================================

 Failure _handleError(
  Object error,
  StackTrace stackTrace,
) {
  if (error is StateError) {
    return ValidationFailure(
      error.message,
      error,
      stackTrace,
    );
  }

  if (error is ArgumentError) {
    return ValidationFailure(
      error.message?.toString() ?? 'بيانات غير صالحة',
      error,
      stackTrace,
    );
  }

  return DatabaseFailure(
    'حدث خطأ أثناء التعامل مع المخزون',
    error,
    stackTrace,
  );
}
}
