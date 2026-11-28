import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_report_model.freezed.dart';
part 'sales_report_model.g.dart';

@freezed
abstract class SalesReportModel with _$SalesReportModel {
  const factory SalesReportModel({
    required int salesCount,
    required double grossSales,
    required double discounts,
    required double salesTotal,
    required double returnsTotal,
    required double netSales,
    required double costOfGoodsSold,
    required double netProfit,
    required double averageSale,
  }) = _SalesReportModel;

  factory SalesReportModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$SalesReportModelFromJson(json);

  factory SalesReportModel.fromMap(
    Map<String, dynamic> map,
  ) {
    double read(String key) =>
        (map[key] as num?)?.toDouble() ?? 0;

    return SalesReportModel(
      salesCount: (map['sales_count'] as num?)?.toInt() ?? 0,
      grossSales: read('gross_sales'),
      discounts: read('discounts'),
      salesTotal: read('sales_total'),
      returnsTotal: read('returns_total'),
      netSales: read('net_sales'),
      costOfGoodsSold: read('cost_of_goods_sold'),
      netProfit: read('net_profit'),
      averageSale: read('average_sale'),
    );
  }
}