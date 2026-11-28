
import '../entities/sales_report.dart';
import '../entities/top_product_report.dart';
import '../entities/daily_sales_report.dart';

abstract interface class ReportsRepository {
  Future<SalesReport> getSalesReport({
    required DateTime startDate,
    required DateTime endDate,
  });

  Future<List<TopProductReport>> getTopProducts({
    required DateTime startDate,
    required DateTime endDate,
    int limit,
  });

  Future<List<DailySalesReport>> getDailySales({
    required DateTime startDate,
    required DateTime endDate,
  });
}
