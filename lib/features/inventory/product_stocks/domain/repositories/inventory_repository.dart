
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';

import '../entities/inventory_item.dart';
import '../entities/inventory_summary.dart';
import '../entities/stock_movement_entity.dart';

abstract class InventoryRepository {
  // =========================================
  // Inventory
  // =========================================

  TaskEither<Failure, List<InventoryItem>> getInventory();

  Stream<List<InventoryItem>> watchInventory();

  // =========================================
  // Summary
  // =========================================

  TaskEither<Failure, InventorySummary> getInventorySummary();

  Stream<InventorySummary> watchInventorySummary();

  // =========================================
  // Low Stock
  // =========================================

  TaskEither<Failure, List<InventoryItem>> getLowStockProducts();

  Stream<List<InventoryItem>> watchLowStockProducts();

  // =========================================
  // Stock Movements
  // =========================================

  TaskEither<Failure, List<StockMovement>> getStockMovements({
    int? productId,
    int limit = 50,
  });

  Stream<List<StockMovement>> watchStockMovements({
    int? productId,
    int limit = 50,
  });

  // =========================================
  // Adjust Stock
  // =========================================

  TaskEither<Failure, Unit> adjustStock({
    required int productId,
    required double quantity,
    required String type,
    String? reference,
    String? note,
  });
}
