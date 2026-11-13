// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SalesReportModel _$SalesReportModelFromJson(Map<String, dynamic> json) =>
    _SalesReportModel(
      salesCount: (json['sales_count'] as num).toInt(),
      grossSales: (json['gross_sales'] as num).toDouble(),
      discounts: (json['discounts'] as num).toDouble(),
      netSales: (json['net_sales'] as num).toDouble(),
      returnsTotal: (json['returns_total'] as num).toDouble(),
      costOfGoodsSold: (json['cost_of_goods_sold'] as num).toDouble(),
      grossProfit: (json['gross_profit'] as num).toDouble(),
      netProfit: (json['net_profit'] as num).toDouble(),
      averageSale: (json['average_sale'] as num).toDouble(),
    );

Map<String, dynamic> _$SalesReportModelToJson(_SalesReportModel instance) =>
    <String, dynamic>{
      'sales_count': instance.salesCount,
      'gross_sales': instance.grossSales,
      'discounts': instance.discounts,
      'net_sales': instance.netSales,
      'returns_total': instance.returnsTotal,
      'cost_of_goods_sold': instance.costOfGoodsSold,
      'gross_profit': instance.grossProfit,
      'net_profit': instance.netProfit,
      'average_sale': instance.averageSale,
    };
