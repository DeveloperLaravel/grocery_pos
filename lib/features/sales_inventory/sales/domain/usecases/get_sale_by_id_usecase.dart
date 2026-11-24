
import '../entities/sale.dart';
import '../repositories/sales_repository.dart';

class GetSaleByIdUseCase {
  final SalesRepository repository;

  GetSaleByIdUseCase(this.repository);

  Future<Sale?> call(int id) {
    return repository.getSaleById(id);
  }
}
