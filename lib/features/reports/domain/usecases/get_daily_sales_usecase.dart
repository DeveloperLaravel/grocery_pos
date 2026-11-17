
import 'package:injectable/injectable.dart';

import '../entities/daily_sales_report.dart';
import '../repositories/reports_repository.dart';

@lazySingleton
class GetDailySalesUseCase {
  final ReportsRepository repository;

  GetDailySalesUseCase(this.repository);

  Future<List<DailySalesReport>> call({
    required DateTime startDate,
    required DateTime endDate,
  }) {
    return repository.getDailySales(
      startDate: startDate,
      endDate: endDate,
    );
  }
}
