
import 'package:injectable/injectable.dart';

import '../../entities/parties/category.dart';
import '../../repositories/product_repository.dart';

@lazySingleton
class CreateCategoryUseCase {
  final ProductsRepository _repository;

  CreateCategoryUseCase(this._repository);

  Future<int> call(Category category) {
    if (category.name.trim().isEmpty) {
      throw ArgumentError('اسم التصنيف مطلوب');
    }

    if (category.parentId != null && category.parentId! <= 0) {
      throw ArgumentError('معرف التصنيف الأب غير صحيح');
    }

    if (category.sortOrder < 0) {
      throw ArgumentError('ترتيب التصنيف غير صحيح');
    }

    return _repository.insertCategory(category);
  }
}
