
import 'package:injectable/injectable.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';

import '../entities/top_product_report.dart';
import '../repositories/reports_repository.dart';

@lazySingleton
class GetTopProductsUseCase {
  final ReportsRepository _repository;

  GetTopProductsUseCase(this._repository);

  TaskEither<Failure, List<TopProductReport>> call({
    required DateTime startDate,
    required DateTime endDate,
    int limit = 10,
  }) {
    return _repository.getTopProducts(
      startDate: startDate,
      endDate: endDate,
      limit: limit,
    );
  }
}