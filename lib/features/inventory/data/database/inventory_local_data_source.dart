
import '../models/inventory_item_model.dart';
import '../models/inventory_summary_model.dart';
import '../models/stock_movement_model.dart';

abstract class InventoryLocalDataSource {
  // =========================================
  // Inventory Products
  // =========================================

  Future<List<InventoryItemModel>> getInventory();

  Stream<List<InventoryItemModel>> watchInventory();

  // =========================================
  // Inventory Summary
  // =========================================

  Future<InventorySummaryModel> getInventorySummary();

  Stream<InventorySummaryModel> watchInventorySummary();

  // =========================================
  // Low Stock
  // =========================================

  Future<List<InventoryItemModel>> getLowStockProducts();

  Stream<List<InventoryItemModel>> watchLowStockProducts();

  // =========================================
  // Stock Movements
  // =========================================

  Future<List<StockMovementModel>> getStockMovements({
    int? productId,
    int limit = 50,
  });

  Stream<List<StockMovementModel>> watchStockMovements({
    int? productId,
    int limit = 50,
  });

  // =========================================
  // Stock Adjustment
  // =========================================

  Future<void> adjustStock({
    required int productId,
    required double quantity,
    required String type,
    String? reference,
    String? note,
  });
}
