
import '../entities/sale_details.dart';
import '../repositories/sales_repository.dart';

class GetSaleDetailsUseCase {
  final SalesRepository repository;

  GetSaleDetailsUseCase(this.repository);

  Future<SaleDetails?> call(int saleId) {
    return repository.getSaleDetails(saleId);
  }
}
