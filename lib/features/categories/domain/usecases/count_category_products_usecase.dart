
import 'package:injectable/injectable.dart';

import '../repositories/category_repository.dart';

@lazySingleton
class CountCategoryProductsUseCase {
  final CategoryRepository repository;

  CountCategoryProductsUseCase(this.repository);

  Future<int> call(int categoryId) {
    return repository.countProducts(categoryId);
  }
}
