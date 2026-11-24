
import 'package:injectable/injectable.dart';

import '../../entities/product.dart';
import '../../repositories/product_repository.dart';

@lazySingleton
class UpdateProductUseCase {
  final ProductRepository repository;

  UpdateProductUseCase(this.repository);

  Future<bool> call(Product product) {
    return repository.updateProduct(product);
  }
}
