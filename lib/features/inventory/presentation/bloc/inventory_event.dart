import 'package:freezed_annotation/freezed_annotation.dart';
part 'inventory_event.freezed.dart';

@freezed
sealed class InventoryEvent with _$InventoryEvent {
  const factory InventoryEvent.started() = InventoryStarted;
  const factory InventoryEvent.refreshed() = InventoryRefreshed;
  const factory InventoryEvent.searchChanged(String query) = InventorySearchChanged;
  const factory InventoryEvent.lowStockToggled() = InventoryLowStockToggled;
  const factory InventoryEvent.adjusted({
    required int productId,
    required double delta,
    required String note,
  }) = InventoryAdjusted;
  const factory InventoryEvent.stockSet({
    required int productId,
    required double quantity,
    required String note,
  }) = InventoryStockSet;
  const factory InventoryEvent.minStockChanged({
    required int productId,
    required double minStock,
  }) = InventoryMinStockChanged;
}
