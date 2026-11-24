
import 'package:injectable/injectable.dart';

import '../../entities/product_unit.dart';
import '../../repositories/product_repository.dart';

@lazySingleton
class GetProductUnitsUseCase {
  final ProductRepository repository;

  GetProductUnitsUseCase(this.repository);

  Future<List<ProductUnit>> call(int productId) {
    return repository.getProductUnits(productId);
  }
}
