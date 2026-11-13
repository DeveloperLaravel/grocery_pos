
import '../models/sales_report_model.dart';
import '../models/top_product_report_model.dart';

abstract class ReportsLocalDataSource {
  Future<SalesReportModel> getSalesReport({
    required DateTime startDate,
    required DateTime endDate,
  });

  Future<List<TopProductReportModel>> getTopProducts({
    required DateTime startDate,
    required DateTime endDate,
    int limit = 10,
  });
}