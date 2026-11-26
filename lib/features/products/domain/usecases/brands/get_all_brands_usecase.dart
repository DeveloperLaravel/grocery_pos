import 'package:injectable/injectable.dart';

import '../../entities/parties/brand.dart';
import '../../repositories/product_repository.dart';

@lazySingleton
class GetAllBrandsUseCase {
  // final BrandsRepository _repository;
  final ProductsRepository _repository;

  GetAllBrandsUseCase(this._repository);

  Future<List<Brand>> call() {
    return _repository.getAllBrands();
  }
}