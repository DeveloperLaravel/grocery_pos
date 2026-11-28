// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InventorySummaryModel _$InventorySummaryModelFromJson(
        Map<String, dynamic> json) =>
    _InventorySummaryModel(
      productsCount: (json['products_count'] as num).toInt(),
      lowStockCount: (json['low_stock_count'] as num).toInt(),
      totalUnits: (json['total_units'] as num).toDouble(),
      stockCostValue: (json['stock_cost_value'] as num).toDouble(),
      stockSaleValue: (json['stock_sale_value'] as num).toDouble(),
    );

Map<String, dynamic> _$InventorySummaryModelToJson(
        _InventorySummaryModel instance) =>
    <String, dynamic>{
      'products_count': instance.productsCount,
      'low_stock_count': instance.lowStockCount,
      'total_units': instance.totalUnits,
      'stock_cost_value': instance.stockCostValue,
      'stock_sale_value': instance.stockSaleValue,
    };
