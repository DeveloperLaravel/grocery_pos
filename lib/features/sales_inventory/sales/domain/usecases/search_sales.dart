
import 'package:injectable/injectable.dart';

import '../entities/sale.dart';
import '../repositories/sales_repository.dart';
@injectable
class SearchSalesUseCase {
  final SalesRepository repository;

  SearchSalesUseCase(this.repository);

  Future<List<Sale>> call(String query) {
    return repository.searchSales(query);
  }
}
