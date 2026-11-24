
import '../entities/sale_details.dart';
import '../repositories/sales_repository.dart';

class WatchSaleDetailsUseCase {
  final SalesRepository repository;

  WatchSaleDetailsUseCase(this.repository);

  Stream<SaleDetails?> call(int saleId) {
    return repository.watchSaleDetails(saleId);
  }
}
