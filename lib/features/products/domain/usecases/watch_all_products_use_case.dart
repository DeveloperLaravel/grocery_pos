
import 'package:injectable/injectable.dart';

import '../entities/product.dart';
import '../repositories/product_repository.dart';

@lazySingleton
class WatchAllProductsUseCase {
  final ProductRepository _repository;

  WatchAllProductsUseCase(this._repository);

  Stream<List<Product>> call() {
    return _repository.watchAllProducts();
  }
}