
import 'package:injectable/injectable.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../entities/product_entity.dart';
import '../repositories/pos_repository.dart';

@lazySingleton
class UpdateProductUseCase {
  final PosRepository _repository;

  UpdateProductUseCase(this._repository);

  TaskEither<Failure, ProductEntity> call({
    required int id,
    required ProductEntity product,
  }) {
    return _repository.updateProduct(
      id: id,
      product: product,
    );
  }
}
