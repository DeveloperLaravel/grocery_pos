
import 'package:injectable/injectable.dart';

import '../entities/category.dart';
import '../repositories/category_repository.dart';

@lazySingleton
class SearchCategoriesUseCase {
  final CategoryRepository repository;

  SearchCategoriesUseCase(this.repository);

  Future<List<Category>> call(String keyword) {
    return repository.searchCategories(keyword);
  }
}
