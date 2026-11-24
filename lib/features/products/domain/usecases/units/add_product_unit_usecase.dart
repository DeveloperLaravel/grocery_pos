
import 'package:injectable/injectable.dart';

import '../../entities/product_unit.dart';
import '../../repositories/product_repository.dart';

@lazySingleton
class AddProductUnitUseCase {
  final ProductRepository repository;

  AddProductUnitUseCase(this.repository);

  Future<int> call(ProductUnit unit) {
    return repository.addProductUnit(unit);
  }
}
