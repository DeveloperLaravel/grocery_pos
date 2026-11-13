
import 'package:freezed_annotation/freezed_annotation.dart';

part 'inventory_summary_model.freezed.dart';
part 'inventory_summary_model.g.dart';

@freezed
abstract class InventorySummaryModel
    with _$InventorySummaryModel {
  const factory InventorySummaryModel({
    @JsonKey(name: 'products_count')
    required int productsCount,

    @JsonKey(name: 'low_stock_count')
    required int lowStockCount,

    @JsonKey(name: 'total_units')
    required double totalUnits,

    @JsonKey(name: 'stock_cost_value')
    required double stockCostValue,

    @JsonKey(name: 'stock_sale_value')
    required double stockSaleValue,
  }) = _InventorySummaryModel;

  factory InventorySummaryModel.fromJson(
    Map<String, dynamic> json,
  ) => _$InventorySummaryModelFromJson(json);
}
