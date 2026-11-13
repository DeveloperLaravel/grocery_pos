
import 'package:injectable/injectable.dart';

import '../repositories/product_repository.dart';

@lazySingleton
class DeleteProductUseCase {
  final ProductRepository _repository;

  DeleteProductUseCase(this._repository);

  Future<bool> call(int id) {
    return _repository.deleteProduct(id);
  }
}