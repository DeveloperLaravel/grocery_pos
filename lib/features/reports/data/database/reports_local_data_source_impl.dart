
import 'package:injectable/injectable.dart';

import '../../../../core/database/daos/reports_dao.dart';

import '../models/sales_report_model.dart';
import '../models/top_product_report_model.dart';

import 'reports_local_data_source.dart';

@LazySingleton(as: ReportsLocalDataSource)
class ReportsLocalDataSourceImpl
    implements ReportsLocalDataSource {
  final ReportsDao _reportsDao;

  ReportsLocalDataSourceImpl(this._reportsDao);

  @override
  Future<SalesReportModel> getSalesReport({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final result = await _reportsDao.getSalesReport(
      startDate: startDate,
      endDate: endDate,
    );

    return SalesReportModel.fromJson(result);
  }

  @override
  Future<List<TopProductReportModel>> getTopProducts({
    required DateTime startDate,
    required DateTime endDate,
    int limit = 10,
  }) async {
    final result = await _reportsDao.getTopProducts(
      startDate: startDate,
      endDate: endDate,
      limit: limit,
    );

    return result
        .map(TopProductReportModel.fromJson)
        .toList();
  }
}