
import 'package:injectable/injectable.dart';

import '../repositories/category_repository.dart';

@lazySingleton
class CategoryExistsUseCase {
  final CategoryRepository repository;

  CategoryExistsUseCase(this.repository);

  Future<bool> call(int id) {
    return repository.categoryExists(id);
  }
}
