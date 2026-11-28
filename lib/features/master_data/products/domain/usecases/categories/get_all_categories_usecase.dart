
import 'package:injectable/injectable.dart';

import '../../entities/parties/category.dart';
import '../../repositories/product_repository.dart';

@lazySingleton
class GetAllCategoriesUseCase {
  final ProductsRepository _repository;

  GetAllCategoriesUseCase(this._repository);

  Future<List<Category>> call() {
    return _repository.getAllCategories();
  }
}
