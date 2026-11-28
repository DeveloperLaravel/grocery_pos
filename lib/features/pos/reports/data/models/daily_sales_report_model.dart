import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_sales_report_model.freezed.dart';
part 'daily_sales_report_model.g.dart';

@freezed
abstract class DailySalesReportModel with _$DailySalesReportModel {
  const factory DailySalesReportModel({
    required DateTime date,
    required int salesCount,
    required double totalSales,
  }) = _DailySalesReportModel;

  factory DailySalesReportModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$DailySalesReportModelFromJson(json);

  factory DailySalesReportModel.fromMap(
    Map<String, dynamic> map,
  ) {
    return DailySalesReportModel(
      date: DateTime.parse(map['sale_date'].toString()),
      salesCount: (map['sales_count'] as num?)?.toInt() ?? 0,
      totalSales: (map['total_sales'] as num?)?.toDouble() ?? 0,
    );
  }
}