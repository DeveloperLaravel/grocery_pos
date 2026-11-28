import 'package:injectable/injectable.dart';

import '../../entities/parties/brand.dart';
import '../../repositories/product_repository.dart';


@lazySingleton
class UpdateBrandUseCase {
  final ProductsRepository _repository;

  UpdateBrandUseCase(this._repository);

  Future<bool> call({
    required int id,
    required Brand brand,
  }) {
    return _repository.updateBrand(id, brand);
  }
}