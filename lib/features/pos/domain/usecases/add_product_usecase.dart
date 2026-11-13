
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../entities/product_entity.dart';

class AddProductUseCase {
  final PosRepository repository;

  AddProductUseCase(this.repository);

  TaskEither<Failure, ProductEntity> call(
    ProductEntity product,
  ) {
    return repository.addProduct(product);
  }
}
