import 'package:injectable/injectable.dart';

import '../../entities/product/product_unit.dart';
import '../../repositories/product_repository.dart';

@lazySingleton
class WatchProductUnitsUseCase {
  final ProductsRepository _repository;

  WatchProductUnitsUseCase(this._repository);

  Stream<List<ProductUnit>> call({
    required int productId,
  }) {
    return _repository.watchProductUnits(productId);
  }
}