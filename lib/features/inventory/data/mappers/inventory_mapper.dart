
import '../../../../core/database/app_database.dart';

import '../../domain/entities/inventory_item.dart';
import '../../domain/entities/inventory_summary.dart';

import '../../domain/entities/stock_movement_entity.dart';
import '../models/inventory_item_model.dart';
import '../models/inventory_summary_model.dart';
import '../models/stock_movement_model.dart';

// =============================================
// ProductDb -> InventoryItemModel
// =============================================

extension InventoryDbMapper on ProductDb {
  InventoryItemModel toModel() {
    return InventoryItemModel(
      id: id,
      name: name,
      barcode: barcode,
      costPrice: costPrice,
      salePrice: salePrice,
      quantity: quantity,
      minStock: minStock,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

// =============================================
// InventoryItemModel -> InventoryItem
// =============================================

extension InventoryItemModelMapper on InventoryItemModel {
  InventoryItem toEntity() {
    return InventoryItem(
      id: id,
      name: name,
      barcode: barcode,
      costPrice: costPrice,
      salePrice: salePrice,
      quantity: quantity,
      minStock: minStock,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

// =============================================
// List<ProductDb> -> InventorySummaryModel
// =============================================

extension InventorySummaryDbMapper on List<ProductDb> {
  InventorySummaryModel toSummaryModel() {
    return InventorySummaryModel(
      productsCount: length,

      lowStockCount: where(
        (product) => product.quantity <= product.minStock,
      ).length,

      totalUnits: fold<double>(
        0,
        (total, product) => total + product.quantity,
      ),

      stockCostValue: fold<double>(
        0,
        (total, product) =>
            total + (product.quantity * product.costPrice),
      ),

      stockSaleValue: fold<double>(
        0,
        (total, product) =>
            total + (product.quantity * product.salePrice),
      ),
    );
  }
}

// =============================================
// InventorySummaryModel -> InventorySummary
// =============================================

extension InventorySummaryModelMapper
    on InventorySummaryModel {
  InventorySummary toEntity() {
    return InventorySummary(
      productsCount: productsCount,
      lowStockCount: lowStockCount,
      totalUnits: totalUnits,
      stockCostValue: stockCostValue,
      stockSaleValue: stockSaleValue,
    );
  }
}

// =============================================
// StockMovementDb -> StockMovementModel
// =============================================

extension StockMovementDbMapper on StockMovementDb {
  StockMovementModel toModel() {
    return StockMovementModel(
      id: id,
      productId: productId,
      type: type,
      quantity: quantity,
      reference: reference,
      note: note,
      createdAt: createdAt,
    );
  }
}

// =============================================
// StockMovementModel -> StockMovement
// =============================================

extension StockMovementModelMapper on StockMovementModel {
  StockMovement toEntity() {
    return StockMovement(
      id: id,
      productId: productId,
      type: type,
      quantity: quantity,
      reference: reference,
      note: note,
      createdAt: createdAt,
    );
  }
}
