
import 'package:injectable/injectable.dart';

import '../../entities/product/product.dart';
import '../../repositories/product_repository.dart';

@lazySingleton
class WatchProductByIdUseCase {
  final ProductsRepository _repository;

  WatchProductByIdUseCase(this._repository);

  Stream<Product?> call(int id) {
    return _repository.watchProductById(id);
  }
}
