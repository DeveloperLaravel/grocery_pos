import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_product_report_model.freezed.dart';
part 'top_product_report_model.g.dart';

@freezed
abstract class TopProductReportModel with _$TopProductReportModel {
  const factory TopProductReportModel({
    required int productId,
    required String productName,
    required double quantitySold,
    required double salesTotal,
    required double costTotal,
    required double grossProfit,
  }) = _TopProductReportModel;

  factory TopProductReportModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$TopProductReportModelFromJson(json);

  factory TopProductReportModel.fromMap(
    Map<String, dynamic> map,
  ) {
    double read(String key) =>
        (map[key] as num?)?.toDouble() ?? 0;

    return TopProductReportModel(
      productId: (map['product_id'] as num?)?.toInt() ?? 0,
      productName: map['product_name']?.toString() ?? '',
      quantitySold: read('quantity_sold'),
      salesTotal: read('sales_total'),
      costTotal: read('cost_total'),
      grossProfit: read('gross_profit'),
    );
  }
}