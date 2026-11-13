
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/inventory_item.dart';
import '../../domain/entities/inventory_summary.dart';
import '../../domain/entities/stock_movement_entity.dart';

part 'inventory_state.freezed.dart';

@freezed
abstract class InventoryState with _$InventoryState {
  const factory InventoryState({
    @Default(false) bool isLoading,
    @Default(false) bool isAdjusting,

    @Default([]) List<InventoryItem> inventory,
    @Default(InventorySummary.empty) InventorySummary summary,
    @Default([]) List<InventoryItem> lowStockProducts,

    @Default([]) List<StockMovement> movements,
    int? selectedProductId,
    @Default(50) int movementsLimit,

    @Default('') String query,
    @Default(false) bool lowStockOnly,

    String? errorMessage,
    String? successMessage,
  }) = _InventoryState;

  factory InventoryState.initial() => const InventoryState();
}
