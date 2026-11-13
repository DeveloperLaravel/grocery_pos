
import 'package:injectable/injectable.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../entities/product_entity.dart';
import '../repositories/pos_repository.dart';

@lazySingleton
class GetProductsUseCase {
  final PosRepository _repository;

  GetProductsUseCase(this._repository);

  TaskEither<Failure, List<ProductEntity>> call({
    String query = '',
  }) {
    return _repository.getProducts(query: query);
  }
}
