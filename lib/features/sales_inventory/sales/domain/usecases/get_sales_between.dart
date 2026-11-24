import '../entities/sale.dart';
import '../repositories/sales_repository.dart';

class GetSalesBetween {
  final SalesRepository repository;

  GetSalesBetween(this.repository);

  Future<List<Sale>> call({
    required DateTime start,
    required DateTime end,
  }) {
    return repository.getSalesBetween(start, end);
  }
}