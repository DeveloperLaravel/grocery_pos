
import 'package:injectable/injectable.dart';

import '../../repositories/product_repository.dart';

@lazySingleton
class DeleteCategoryUseCase {
  final ProductsRepository _repository;

  DeleteCategoryUseCase(this._repository);

  Future<int> call(int id) {
    if (id <= 0) {
      throw ArgumentError('معرف التصنيف غير صحيح');
    }

    return _repository.deleteCategory(id);
  }
}
