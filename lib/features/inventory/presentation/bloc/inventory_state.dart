import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grocery_pos/features/inventory/domain/entities/inventory_item.dart';
import 'package:grocery_pos/features/inventory/domain/entities/inventory_summary.dart';
part 'inventory_state.freezed.dart';

@freezed
abstract class InventoryState with _$InventoryState {
  const factory InventoryState({
    @Default(false) bool loading,
    @Default([]) List<InventoryItem> items,
    @Default(InventorySummary.empty) InventorySummary summary,
    @Default('') String query,
    @Default(false) bool lowStockOnly,
    String? error,
    String? message,
  }) = _InventoryState;
}
