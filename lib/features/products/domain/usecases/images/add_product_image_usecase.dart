
import 'package:injectable/injectable.dart';

import '../../entities/product_image.dart';
import '../../repositories/product_repository.dart';

@lazySingleton
class AddProductImageUseCase {
  final ProductRepository repository;

  AddProductImageUseCase(this.repository);

  Future<int> call(ProductImage image) {
    return repository.addProductImage(image);
  }
}
