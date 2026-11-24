
import 'package:injectable/injectable.dart';

import '../entities/category.dart';
import '../repositories/category_repository.dart';

@lazySingleton
class UpdateCategoryUseCase {
  final CategoryRepository repository;

  UpdateCategoryUseCase(this.repository);

  Future<bool> call(Category category) async {
    if (category.id == null || category.id! <= 0) {
      throw ArgumentError('Invalid category ID');
    }

    if (category.name.trim().isEmpty) {
      throw ArgumentError('Category name cannot be empty');
    }

    return repository.updateCategory(
      category.copyWith(
        name: category.name.trim(),
      ),
    );
  }
}
