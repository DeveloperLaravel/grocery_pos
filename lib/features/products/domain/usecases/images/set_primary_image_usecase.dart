
import 'package:injectable/injectable.dart';

import '../../repositories/product_repository.dart';

@lazySingleton
class SetPrimaryImageUseCase {
  final ProductRepository repository;

  SetPrimaryImageUseCase(this.repository);

  Future<void> call(int id) {
    return repository.setPrimaryImage(id);
  }
}
