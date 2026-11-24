
import 'package:injectable/injectable.dart';

import '../entities/category.dart';
import '../repositories/category_repository.dart';

@lazySingleton
class WatchAllCategoriesUseCase {
  final CategoryRepository repository;

  WatchAllCategoriesUseCase(this.repository);

  Stream<List<Category>> call() {
    return repository.watchAllCategories();
  }
}
