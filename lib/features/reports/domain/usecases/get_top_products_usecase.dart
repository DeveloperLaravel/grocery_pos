
import 'package:injectable/injectable.dart';

import '../entities/top_product_report.dart';
import '../repositories/reports_repository.dart';

@lazySingleton
class GetTopProductsUseCase {
  final ReportsRepository repository;

  GetTopProductsUseCase(this.repository);

  Future<List<TopProductReport>> call({
    required DateTime startDate,
    required DateTime endDate,
    int limit = 10,
  }) {
    return repository.getTopProducts(
      startDate: startDate,
      endDate: endDate,
      limit: limit,
    );
  }
}
