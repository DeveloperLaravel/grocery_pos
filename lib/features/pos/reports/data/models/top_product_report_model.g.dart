// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_product_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TopProductReportModel _$TopProductReportModelFromJson(
        Map<String, dynamic> json) =>
    _TopProductReportModel(
      productId: (json['productId'] as num).toInt(),
      productName: json['productName'] as String,
      quantitySold: (json['quantitySold'] as num).toDouble(),
      salesTotal: (json['salesTotal'] as num).toDouble(),
      costTotal: (json['costTotal'] as num).toDouble(),
      grossProfit: (json['grossProfit'] as num).toDouble(),
    );

Map<String, dynamic> _$TopProductReportModelToJson(
        _TopProductReportModel instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'productName': instance.productName,
      'quantitySold': instance.quantitySold,
      'salesTotal': instance.salesTotal,
      'costTotal': instance.costTotal,
      'grossProfit': instance.grossProfit,
    };
