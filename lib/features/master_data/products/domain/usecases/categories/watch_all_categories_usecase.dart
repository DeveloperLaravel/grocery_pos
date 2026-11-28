
import 'package:injectable/injectable.dart';

import '../../entities/parties/category.dart';
import '../../repositories/product_repository.dart';

@lazySingleton
class WatchAllCategoriesUseCase {
  final ProductsRepository _repository;

  WatchAllCategoriesUseCase(this._repository);

  Stream<List<Category>> call() {
    return _repository.watchAllCategories();
  }
}
