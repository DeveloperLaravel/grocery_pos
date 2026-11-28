
import 'package:injectable/injectable.dart';

import '../entities/sales_report.dart';
import '../repositories/reports_repository.dart';

@lazySingleton
class GetSalesReportUseCase {
  final ReportsRepository repository;

  GetSalesReportUseCase(this.repository);

  Future<SalesReport> call({
    required DateTime startDate,
    required DateTime endDate,
  }) {
    return repository.getSalesReport(
      startDate: startDate,
      endDate: endDate,
    );
  }
}
