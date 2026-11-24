
import 'package:injectable/injectable.dart';

import '../entities/category.dart';
import '../repositories/category_repository.dart';

@lazySingleton
class GetActiveCategoriesUseCase {
  final CategoryRepository repository;

  GetActiveCategoriesUseCase(this.repository);

  Future<List<Category>> call() {
    return repository.getActiveCategories();
  }
}
