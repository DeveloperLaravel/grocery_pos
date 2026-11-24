
import 'package:injectable/injectable.dart';

import '../entities/category.dart';
import '../repositories/category_repository.dart';

@lazySingleton
class GetCategoriesByParentIdUseCase {
  final CategoryRepository repository;

  GetCategoriesByParentIdUseCase(this.repository);

  Future<List<Category>> call(int? parentId) {
    return repository.getCategoriesByParentId(parentId);
  }
}
