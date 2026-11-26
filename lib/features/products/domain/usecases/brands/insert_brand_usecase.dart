import 'package:injectable/injectable.dart';

import '../../entities/parties/brand.dart';
import '../../repositories/product_repository.dart';


@lazySingleton
class InsertBrandUseCase {
  final ProductsRepository _repository;

  InsertBrandUseCase(this._repository);

  Future<int> call(Brand brand) {
    return _repository.insertBrand(brand);
  }
}