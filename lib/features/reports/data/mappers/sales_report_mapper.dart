import '../../domain/entities/sales_report.dart';
import '../models/sales_report_model.dart';

extension SalesReportMapper on SalesReportModel {
  SalesReport toEntity() {
    return SalesReport(
      salesCount: salesCount,
      grossSales: grossSales,
      discounts: discounts,
      salesTotal: salesTotal,
      returnsTotal: returnsTotal,
      netSales: netSales,
      costOfGoodsSold: costOfGoodsSold,
      netProfit: netProfit,
      averageSale: averageSale,
    );
  }
}