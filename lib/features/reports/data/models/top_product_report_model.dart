
import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_product_report_model.freezed.dart';
part 'top_product_report_model.g.dart';

@freezed
abstract class TopProductReportModel with _$TopProductReportModel {
  const factory TopProductReportModel({
    @JsonKey(name: 'product_id')
    required int productId,

    @JsonKey(name: 'product_name')
    required String productName,

    @JsonKey(name: 'quantity_sold')
    required double quantitySold,

    @JsonKey(name: 'sales_total')
    required double salesTotal,

    @JsonKey(name: 'cost_total')
    required double costTotal,

    required double profit,
  }) = _TopProductReportModel;

  factory TopProductReportModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$TopProductReportModelFromJson(json);
}