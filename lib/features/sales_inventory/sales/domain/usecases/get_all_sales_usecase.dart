
import 'package:injectable/injectable.dart';

import '../repositories/sales_repository.dart';
import '../entities/sale.dart';
@injectable
class GetAllSalesUseCase {
  final SalesRepository repository;

  GetAllSalesUseCase(this.repository);

  Future<List<Sale>> call() {
    return repository.getAllSales();
  }
}
