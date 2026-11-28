import 'package:injectable/injectable.dart';

import '../../entities/product/product_image.dart';
import '../../repositories/product_repository.dart';

@lazySingleton
class WatchProductImagesUseCase {
  final ProductsRepository _repository;

  WatchProductImagesUseCase(this._repository);

  Stream<List<ProductImage>> call(int productId) {
    return _repository.watchProductImages(productId);
  }
}