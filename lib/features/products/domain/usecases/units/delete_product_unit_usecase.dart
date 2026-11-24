
import 'package:injectable/injectable.dart';

import '../../repositories/product_repository.dart';

@lazySingleton
class DeleteProductUnitUseCase {
  final ProductRepository repository;

  DeleteProductUnitUseCase(this.repository);

  Future<bool> call(int id) {
    return repository.deleteProductUnit(id);
  }
}
