
import 'package:injectable/injectable.dart';

import '../../entities/product.dart';
import '../../repositories/product_repository.dart';

@lazySingleton
class GetProductByIdUseCase {
  final ProductRepository repository;

  GetProductByIdUseCase(this.repository);

  Future<Product?> call(int id) {
    return repository.getProductById(id);
  }
}
