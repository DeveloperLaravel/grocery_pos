import 'package:injectable/injectable.dart';

import '../../repositories/product_repository.dart';


@lazySingleton
class DeleteBrandUseCase {
  final ProductsRepository _repository;

  DeleteBrandUseCase(this._repository);

  Future<int> call(int id) {
    return _repository.deleteBrand(id);
  }
}