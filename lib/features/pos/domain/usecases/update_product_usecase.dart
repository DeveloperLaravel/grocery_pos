
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../entities/product_entity.dart';
import '../pos_repository.dart';

class UpdateProductUseCase {
  final PosRepository repository;

  UpdateProductUseCase(this.repository);

  TaskEither<Failure, ProductEntity> call({
    required int id,
    required ProductEntity product,
  }) {
    return repository.updateProduct(
      id: id,
      product: product,
    );
  }
}
