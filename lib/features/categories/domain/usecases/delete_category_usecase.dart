
import 'package:injectable/injectable.dart';

import '../repositories/category_repository.dart';

@lazySingleton
class DeleteCategoryUseCase {
  final CategoryRepository repository;

  DeleteCategoryUseCase(this.repository);

  Future<bool> call(int id) async {
    if (id <= 0) {
      throw ArgumentError('Invalid category ID');
    }

    if (!await repository.categoryExists(id)) {
      return false;
    }

    if (await repository.hasChildren(id)) {
      throw StateError(
        'Cannot delete a category that has child categories',
      );
    }

    if (await repository.countProducts(id) > 0) {
      throw StateError(
        'Cannot delete a category that has products',
      );
    }

    return repository.deleteCategory(id);
  }
}
