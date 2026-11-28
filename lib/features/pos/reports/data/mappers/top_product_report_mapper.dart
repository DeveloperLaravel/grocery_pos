import '../../domain/entities/top_product_report.dart';
import '../models/top_product_report_model.dart';

extension TopProductReportMapper on TopProductReportModel {
  TopProductReport toEntity() {
    return TopProductReport(
      productId: productId,
      productName: productName,
      quantitySold: quantitySold,
      salesTotal: salesTotal,
      costTotal: costTotal,
      grossProfit: grossProfit,
    );
  }
}

extension TopProductReportListMapper on List<TopProductReportModel> {
  List<TopProductReport> toEntities() {
    return map((model) => model.toEntity()).toList();
  }
}