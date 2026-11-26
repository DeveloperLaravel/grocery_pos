
import 'package:injectable/injectable.dart';

import '../repositories/product_repository.dart';

@lazySingleton
class DeleteProductUseCase {
  final ProductsRepository _repository;

  DeleteProductUseCase(this._repository);

  Future<int> call(int id) {
    if (id <= 0) {
      throw ArgumentError('معرف المنتج غير صحيح');
    }

    return _repository.deleteProduct(id);
  }
}
