
import 'package:injectable/injectable.dart';

import '../../entities/product/product.dart';
import '../../repositories/product_repository.dart';

@lazySingleton
class SearchProductsUseCase {
  final ProductsRepository _repository;

  SearchProductsUseCase(this._repository);

  Future<List<Product>> call(String query) {
    return _repository.searchProducts(query.trim());
  }
}
