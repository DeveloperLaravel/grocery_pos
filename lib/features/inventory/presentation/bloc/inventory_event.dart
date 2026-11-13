
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/inventory_item.dart';
import '../../domain/entities/inventory_summary.dart';
import '../../domain/entities/stock_movement_entity.dart';

part 'inventory_event.freezed.dart';

@freezed
sealed class InventoryEvent with _$InventoryEvent {
  const factory InventoryEvent.started() = InventoryStarted;

  const factory InventoryEvent.refreshRequested() =
      InventoryRefreshRequested;

  const factory InventoryEvent.searchChanged(String query) =
      InventorySearchChanged;

  const factory InventoryEvent.lowStockToggled() =
      InventoryLowStockToggled;

  const factory InventoryEvent.movementsFilterChanged({
    int? productId,
    @Default(50) int limit,
  }) = StockMovementsFilterChanged;

  const factory InventoryEvent.stockAdjustmentSubmitted({
    required int productId,
    required double quantity,
    required String type,
    String? reference,
    String? note,
  }) = StockAdjustmentSubmitted;

  const factory InventoryEvent.inventoryChanged(
    List<InventoryItem> inventory,
  ) = InventoryChanged;

  const factory InventoryEvent.summaryChanged(
    InventorySummary summary,
  ) = InventorySummaryChanged;

  const factory InventoryEvent.lowStockChanged(
    List<InventoryItem> products,
  ) = LowStockChanged;

  const factory InventoryEvent.movementsChanged(
    List<StockMovement> movements,
  ) = StockMovementsChanged;

  const factory InventoryEvent.streamFailed(
    String message,
  ) = InventoryStreamFailed;
}
