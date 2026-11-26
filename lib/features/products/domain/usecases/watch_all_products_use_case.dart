
import 'package:injectable/injectable.dart';

import '../entities/product/product.dart';
import '../repositories/product_repository.dart';

@lazySingleton
class WatchAllProductsUseCase {
  final ProductsRepository _repository;

  WatchAllProductsUseCase(this._repository);

  Stream<List<Product>> call() {
    return _repository.watchAllProducts();
  }
}
