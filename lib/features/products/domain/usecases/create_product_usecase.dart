
import 'package:injectable/injectable.dart';

import '../entities/product/product.dart';
import '../repositories/product_repository.dart';

@lazySingleton
class CreateProductUseCase {
  final ProductsRepository _repository;

  CreateProductUseCase(this._repository);

  Future<int> call({
    required Product product,
    required String unitName,
  }) {
    if (product.name.trim().isEmpty) {
      throw ArgumentError('اسم المنتج مطلوب');
    }

    if (unitName.trim().isEmpty) {
      throw ArgumentError('الوحدة الأساسية مطلوبة');
    }

    if (product.costPrice < 0 || product.salePrice < 0) {
      throw ArgumentError('السعر لا يمكن أن يكون سالباً');
    }

    if (product.minStock < 0 || product.quantity < 0) {
      throw ArgumentError('الكمية والمخزون لا يمكن أن يكونا سالبين');
    }

    return _repository.createProductWithBaseUnit(
      product: product,
      unitName: unitName.trim(),
    );
  }
}
