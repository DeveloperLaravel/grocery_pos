
import 'package:injectable/injectable.dart';

import '../../entities/product/product.dart';
import '../../repositories/product_repository.dart';

@lazySingleton
class WatchProductsByBrandUseCase {
  final ProductsRepository _repository;

  WatchProductsByBrandUseCase(this._repository);

  Stream<List<Product>> call(int brandId) {
    return _repository.watchProductsByBrand(brandId);
  }
}
