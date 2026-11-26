
import 'package:injectable/injectable.dart';

import '../../entities/parties/category.dart';
import '../../repositories/product_repository.dart';

@lazySingleton
class GetRootCategoriesUseCase {
  final ProductsRepository _repository;

  GetRootCategoriesUseCase(this._repository);

  Future<List<Category>> call() {
    return _repository.getRootCategories();
  }
}
