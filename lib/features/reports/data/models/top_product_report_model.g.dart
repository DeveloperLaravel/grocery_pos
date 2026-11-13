// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_product_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TopProductReportModel _$TopProductReportModelFromJson(
        Map<String, dynamic> json) =>
    _TopProductReportModel(
      productId: (json['product_id'] as num).toInt(),
      productName: json['product_name'] as String,
      quantitySold: (json['quantity_sold'] as num).toDouble(),
      salesTotal: (json['sales_total'] as num).toDouble(),
      costTotal: (json['cost_total'] as num).toDouble(),
      profit: (json['profit'] as num).toDouble(),
    );

Map<String, dynamic> _$TopProductReportModelToJson(
        _TopProductReportModel instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'product_name': instance.productName,
      'quantity_sold': instance.quantitySold,
      'sales_total': instance.salesTotal,
      'cost_total': instance.costTotal,
      'profit': instance.profit,
    };
