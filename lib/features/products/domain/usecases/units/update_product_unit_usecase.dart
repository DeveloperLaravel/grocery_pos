
import 'package:injectable/injectable.dart';

import '../../entities/product_unit.dart';
import '../../repositories/product_repository.dart';

@lazySingleton
class UpdateProductUnitUseCase {
  final ProductRepository repository;

  UpdateProductUnitUseCase(this.repository);

  Future<bool> call(ProductUnit unit) {
    return repository.updateProductUnit(unit);
  }
}
