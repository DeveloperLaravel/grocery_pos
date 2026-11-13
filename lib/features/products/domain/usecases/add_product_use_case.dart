
import 'package:injectable/injectable.dart';

import '../entities/product.dart';
import '../repositories/product_repository.dart';

@lazySingleton
class AddProductUseCase {
  final ProductRepository _repository;

  AddProductUseCase(this._repository);

  Future<int> call(Product product) {
    return _repository.addProduct(product);
  }
}