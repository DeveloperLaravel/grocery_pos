
import 'package:injectable/injectable.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';

import '../entities/sales_report.dart';
import '../repositories/reports_repository.dart';

@lazySingleton
class GetSalesReportUseCase {
  final ReportsRepository _repository;

  GetSalesReportUseCase(this._repository);

  TaskEither<Failure, SalesReport> call({
    required DateTime startDate,
    required DateTime endDate,
  }) {
    return _repository.getSalesReport(
      startDate: startDate,
      endDate: endDate,
    );
  }
}