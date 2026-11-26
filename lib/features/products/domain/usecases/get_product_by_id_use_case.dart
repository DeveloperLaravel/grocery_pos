
import 'package:injectable/injectable.dart';

import '../entities/product/product.dart';
import '../repositories/product_repository.dart';

@lazySingleton
class GetProductByIdUseCase {
  final ProductsRepository _repository;

  GetProductByIdUseCase(this._repository);

  Future<Product?> call(int id) {
    return _repository.getProductById(id);
  }
}
