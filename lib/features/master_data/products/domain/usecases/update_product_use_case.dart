
import 'package:injectable/injectable.dart';

import '../entities/product/product.dart';
import '../repositories/product_repository.dart';

@lazySingleton
class UpdateProductUsecase {
  final ProductsRepository _repository;

  UpdateProductUsecase(this._repository);

  Future<Product> call({
    required int id,
    required Product product,
  }) async {
    if (id <= 0) {
      throw ArgumentError('معرف المنتج غير صحيح');
    }

    if (product.name.trim().isEmpty) {
      throw ArgumentError('اسم المنتج مطلوب');
    }

    if (product.costPrice < 0 || product.salePrice < 0) {
      throw ArgumentError('السعر لا يمكن أن يكون سالباً');
    }

    return _repository.updateProduct(id, product);
  }
}
