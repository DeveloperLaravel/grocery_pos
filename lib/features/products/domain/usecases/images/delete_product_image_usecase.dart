
import 'package:injectable/injectable.dart';

import '../../repositories/product_repository.dart';

@lazySingleton
class DeleteProductImageUseCase {
  final ProductRepository repository;

  DeleteProductImageUseCase(this.repository);

  Future<bool> call(int id) {
    return repository.deleteProductImage(id);
  }
}
