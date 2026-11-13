
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../entities/product_entity.dart';
import '../pos_repository.dart';

class GetProductByIdUseCase {
  final PosRepository repository;

  GetProductByIdUseCase(this.repository);

  TaskEither<Failure, ProductEntity?> call(int id) {
    return repository.getProductById(id);
  }
}
