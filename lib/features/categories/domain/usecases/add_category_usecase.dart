
import 'package:injectable/injectable.dart';

import '../entities/category.dart';
import '../repositories/category_repository.dart';

@lazySingleton
class AddCategoryUseCase {
  final CategoryRepository repository;

  AddCategoryUseCase(this.repository);

  Future<int> call(Category category) async {
    if (category.name.trim().isEmpty) {
      throw ArgumentError('Category name cannot be empty');
    }

    return repository.addCategory(
      Category(
        name: category.name.trim(),
        description: category.description,
        parentId: category.parentId,
        imagePath: category.imagePath,
        isActive: category.isActive,
        sortOrder: category.sortOrder,
      ),
    );
  }
}
