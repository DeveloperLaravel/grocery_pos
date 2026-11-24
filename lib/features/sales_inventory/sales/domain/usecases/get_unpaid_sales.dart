import '../entities/sale.dart';
import '../repositories/sales_repository.dart';

class GetUnpaidSales {
  final SalesRepository repository;

  GetUnpaidSales(this.repository);

  Future<List<Sale>> call() {
    return repository.getUnpaidSales();
  }
}