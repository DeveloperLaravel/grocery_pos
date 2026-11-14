import 'package:injectable/injectable.dart';

import '../entities/sale.dart';
import '../repositories/sales_repository.dart';
@lazySingleton
class WatchSalesUseCase {
  final SalesRepository repository;

  const WatchSalesUseCase(this.repository);

  Stream<List<Sale>> call({
    int limit = 100,
  }) {
    return repository.watchSales(limit: limit);
  }
}