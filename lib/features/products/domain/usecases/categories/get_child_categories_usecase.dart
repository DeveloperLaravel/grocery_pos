
import 'package:injectable/injectable.dart';

import '../../entities/parties/category.dart';
import '../../repositories/product_repository.dart';

@lazySingleton
class GetChildCategoriesUseCase {
  final ProductsRepository _repository;

  GetChildCategoriesUseCase(this._repository);

  Future<List<Category>> call(int parentId) {
    if (parentId <= 0) {
      throw ArgumentError('معرف التصنيف الأب غير صحيح');
    }

    return _repository.getChildCategories(parentId);
  }
}
