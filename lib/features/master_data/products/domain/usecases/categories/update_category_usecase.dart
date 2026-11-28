
import 'package:injectable/injectable.dart';

import '../../entities/parties/category.dart';
import '../../repositories/product_repository.dart';

@lazySingleton
class UpdateCategoryUseCase {
  final ProductsRepository _repository;

  UpdateCategoryUseCase(this._repository);

  Future<bool> call({
    required int id,
    required Category category,
  }) {
    if (id <= 0) {
      throw ArgumentError('معرف التصنيف غير صحيح');
    }

    if (category.name.trim().isEmpty) {
      throw ArgumentError('اسم التصنيف مطلوب');
    }

    if (category.parentId == id) {
      throw ArgumentError('لا يمكن أن يكون التصنيف أبًا لنفسه');
    }

    if (category.parentId != null && category.parentId! <= 0) {
      throw ArgumentError('معرف التصنيف الأب غير صحيح');
    }

    return _repository.updateCategory(id, category);
  }
}
