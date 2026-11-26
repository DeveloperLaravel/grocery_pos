
import 'package:injectable/injectable.dart';

import '../../entities/product/product.dart';
import '../../repositories/product_repository.dart';

@lazySingleton
class WatchProductsByCategoryUseCase {
  final ProductsRepository _repository;

  WatchProductsByCategoryUseCase(this._repository);

  Stream<List<Product>> call(int categoryId) {
    return _repository.watchProductsByCategory(categoryId);
  }
}
