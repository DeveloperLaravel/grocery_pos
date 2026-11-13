
import 'package:injectable/injectable.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../entities/product_entity.dart';
import '../repositories/pos_repository.dart';

@lazySingleton
class AddProductUseCase {
  final PosRepository _repository;

  AddProductUseCase(this._repository);

  TaskEither<Failure, ProductEntity> call(
    ProductEntity product,
  ) {
    return _repository.addProduct(product);
  }
}
