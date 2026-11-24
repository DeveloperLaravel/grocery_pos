import 'package:injectable/injectable.dart';

import '../../entities/product.dart';
import '../../repositories/product_repository.dart';

@lazySingleton
class WatchAllProductsUseCase {
  final ProductRepository repository;

  WatchAllProductsUseCase(this.repository);

  Stream<List<Product>> call() {
    return repository.watchAllProducts();
  }
}