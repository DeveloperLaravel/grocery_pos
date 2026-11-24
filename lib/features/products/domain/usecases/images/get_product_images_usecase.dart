
import 'package:injectable/injectable.dart';

import '../../entities/product_image.dart';
import '../../repositories/product_repository.dart';

@lazySingleton
class GetProductImagesUseCase {
  final ProductRepository repository;

  GetProductImagesUseCase(this.repository);

  Future<List<ProductImage>> call(int productId) {
    return repository.getProductImages(productId);
  }
}
