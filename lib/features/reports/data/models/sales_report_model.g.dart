// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SalesReportModel _$SalesReportModelFromJson(Map<String, dynamic> json) =>
    _SalesReportModel(
      salesCount: (json['salesCount'] as num).toInt(),
      grossSales: (json['grossSales'] as num).toDouble(),
      discounts: (json['discounts'] as num).toDouble(),
      salesTotal: (json['salesTotal'] as num).toDouble(),
      returnsTotal: (json['returnsTotal'] as num).toDouble(),
      netSales: (json['netSales'] as num).toDouble(),
      costOfGoodsSold: (json['costOfGoodsSold'] as num).toDouble(),
      netProfit: (json['netProfit'] as num).toDouble(),
      averageSale: (json['averageSale'] as num).toDouble(),
    );

Map<String, dynamic> _$SalesReportModelToJson(_SalesReportModel instance) =>
    <String, dynamic>{
      'salesCount': instance.salesCount,
      'grossSales': instance.grossSales,
      'discounts': instance.discounts,
      'salesTotal': instance.salesTotal,
      'returnsTotal': instance.returnsTotal,
      'netSales': instance.netSales,
      'costOfGoodsSold': instance.costOfGoodsSold,
      'netProfit': instance.netProfit,
      'averageSale': instance.averageSale,
    };
