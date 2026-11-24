
import 'package:injectable/injectable.dart';

import '../../repositories/product_repository.dart';

@lazySingleton
class SetDefaultProductUnitUseCase {
  final ProductRepository repository;

  SetDefaultProductUnitUseCase(this.repository);

  Future<void> call({
    required int productId,
    required int unitId,
  }) {
    return repository.setDefaultProductUnit(
      productId: productId,
      unitId: unitId,
    );
  }
}
