
import 'package:injectable/injectable.dart';

import '../entities/category.dart';
import '../repositories/category_repository.dart';

@lazySingleton
class WatchCategoriesByParentIdUseCase {
  final CategoryRepository repository;

  WatchCategoriesByParentIdUseCase(this.repository);

  Stream<List<Category>> call(int? parentId) {
    return repository.watchCategoriesByParentId(parentId);
  }
}
