
import 'package:injectable/injectable.dart';

import '../../domain/entities/daily_sales_report.dart';
import '../../domain/entities/sales_report.dart';
import '../../domain/entities/top_product_report.dart';
import '../../domain/repositories/reports_repository.dart';

import '../database/reports_local_data_source.dart';
import '../mappers/daily_sales_report_mapper.dart';
import '../mappers/sales_report_mapper.dart';
import '../mappers/top_product_report_mapper.dart';

@LazySingleton(as: ReportsRepository)
class ReportsRepositoryImpl implements ReportsRepository {
  final ReportsLocalDataSource _localDataSource;

  ReportsRepositoryImpl(this._localDataSource);

  @override
  Future<SalesReport> getSalesReport({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final model = await _localDataSource.getSalesReport(
      startDate: startDate,
      endDate: endDate,
    );

    return model.toEntity();
  }

  @override
  Future<List<TopProductReport>> getTopProducts({
    required DateTime startDate,
    required DateTime endDate,
    int limit = 10,
  }) async {
    final models = await _localDataSource.getTopProducts(
      startDate: startDate,
      endDate: endDate,
      limit: limit,
    );

    return models.toEntities();
  }

  @override
  Future<List<DailySalesReport>> getDailySales({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final models = await _localDataSource.getDailySales(
      startDate: startDate,
      endDate: endDate,
    );

    return models.toEntities();
  }
}
