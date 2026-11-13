
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../entities/product_entity.dart';
import '../pos_repository.dart';

class GetProductsUseCase {
  final PosRepository repository;

  GetProductsUseCase(this.repository);

  TaskEither<Failure, List<ProductEntity>> call({
    String query = '',
  }) {
    return repository.getProducts(query: query);
  }
}
