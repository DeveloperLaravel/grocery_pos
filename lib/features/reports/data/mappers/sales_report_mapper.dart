
import '../../domain/entities/sales_report.dart';
import '../models/sales_report_model.dart';

class SalesReportMapper {
  const SalesReportMapper._();

  static SalesReport toEntity(SalesReportModel model) {
    return SalesReport(
      salesCount: model.salesCount,
      grossSales: model.grossSales,
      discounts: model.discounts,
      netSales: model.netSales,
      returnsTotal: model.returnsTotal,
      costOfGoodsSold: model.costOfGoodsSold,
      grossProfit: model.grossProfit,
      netProfit: model.netProfit,
      averageSale: model.averageSale,
    );
  }
}