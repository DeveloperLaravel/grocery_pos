
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';

import '../entities/sales_report.dart';
import '../entities/top_product_report.dart';

abstract class ReportsRepository {
  TaskEither<Failure, SalesReport> getSalesReport({
    required DateTime startDate,
    required DateTime endDate,
  });

  TaskEither<Failure, List<TopProductReport>> getTopProducts({
    required DateTime startDate,
    required DateTime endDate,
    int limit = 10,
  });
}