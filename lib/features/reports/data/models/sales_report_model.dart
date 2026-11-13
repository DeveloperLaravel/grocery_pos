
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_report_model.freezed.dart';
part 'sales_report_model.g.dart';

@freezed
abstract class SalesReportModel with _$SalesReportModel {
  const factory SalesReportModel({
    @JsonKey(name: 'sales_count')
    required int salesCount,

    @JsonKey(name: 'gross_sales')
    required double grossSales,

    required double discounts,

    @JsonKey(name: 'net_sales')
    required double netSales,

    @JsonKey(name: 'returns_total')
    required double returnsTotal,

    @JsonKey(name: 'cost_of_goods_sold')
    required double costOfGoodsSold,

    @JsonKey(name: 'gross_profit')
    required double grossProfit,

    @JsonKey(name: 'net_profit')
    required double netProfit,

    @JsonKey(name: 'average_sale')
    required double averageSale,
  }) = _SalesReportModel;

  factory SalesReportModel.fromJson(Map<String, dynamic> json) =>
      _$SalesReportModelFromJson(json);
}
