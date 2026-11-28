
import 'package:injectable/injectable.dart';

import '../../../../core/database/daos/reports_dao.dart';

import '../models/daily_sales_report_model.dart';
import '../models/sales_report_model.dart';
import '../models/top_product_report_model.dart';

import 'reports_local_data_source.dart';

@LazySingleton(as: ReportsLocalDataSource)
class ReportsLocalDataSourceImpl implements ReportsLocalDataSource {
  final ReportsDao _dao;

  ReportsLocalDataSourceImpl(this._dao);

  @override
  Future<SalesReportModel> getSalesReport({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final result = await _dao.getSalesReport(
      startDate: startDate,
      endDate: endDate,
    );

    return SalesReportModel.fromMap(result);
  }

  @override
  Future<List<TopProductReportModel>> getTopProducts({
    required DateTime startDate,
    required DateTime endDate,
    int limit = 10,
  }) async {
    final results = await _dao.getTopProducts(
      startDate: startDate,
      endDate: endDate,
      limit: limit,
    );

    return results
        .map(TopProductReportModel.fromMap)
        .toList(growable: false);
  }

  @override
  Future<List<DailySalesReportModel>> getDailySales({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final results = await _dao.getDailySales(
      startDate: startDate,
      endDate: endDate,
    );

    return results
        .map(DailySalesReportModel.fromMap)
        .toList(growable: false);
  }
}
