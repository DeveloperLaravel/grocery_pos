
import 'package:injectable/injectable.dart';

import '../entities/product/product.dart';
import '../repositories/product_repository.dart';

@lazySingleton
class GetAllProductsUseCase {
  final ProductsRepository _repository;

  GetAllProductsUseCase(this._repository);

  Future<List<Product>> call() {
    return _repository.getAllProducts();
  }
}
