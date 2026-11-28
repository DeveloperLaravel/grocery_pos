import 'package:injectable/injectable.dart';

import '../../entities/parties/brand.dart';
import '../../repositories/product_repository.dart';

@lazySingleton
class WatchAllBrandsUseCase {
  final ProductsRepository _repository;

  WatchAllBrandsUseCase(this._repository);

  Stream<List<Brand>> call() {
    return _repository.watchAllBrands();
  }
}