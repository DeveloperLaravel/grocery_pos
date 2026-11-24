
import 'package:injectable/injectable.dart';

import '../repositories/category_repository.dart';

@lazySingleton
class HasCategoryChildrenUseCase {
  final CategoryRepository repository;

  HasCategoryChildrenUseCase(this.repository);

  Future<bool> call(int id) {
    return repository.hasChildren(id);
  }
}
