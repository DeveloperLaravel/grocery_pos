// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_sales_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DailySalesReportModel _$DailySalesReportModelFromJson(
        Map<String, dynamic> json) =>
    _DailySalesReportModel(
      date: DateTime.parse(json['date'] as String),
      salesCount: (json['salesCount'] as num).toInt(),
      totalSales: (json['totalSales'] as num).toDouble(),
    );

Map<String, dynamic> _$DailySalesReportModelToJson(
        _DailySalesReportModel instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'salesCount': instance.salesCount,
      'totalSales': instance.totalSales,
    };
