import '../../domain/entities/daily_sales_report.dart';
import '../models/daily_sales_report_model.dart';

extension DailySalesReportMapper on DailySalesReportModel {
  DailySalesReport toEntity() {
    return DailySalesReport(
      date: date,
      salesCount: salesCount,
      totalSales: totalSales,
    );
  }
}

extension DailySalesReportListMapper on List<DailySalesReportModel> {
  List<DailySalesReport> toEntities() {
    return map((model) => model.toEntity()).toList();
  }
}