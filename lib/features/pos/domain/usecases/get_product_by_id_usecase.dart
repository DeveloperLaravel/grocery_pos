
import 'package:injectable/injectable.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../entities/product_entity.dart';
import '../repositories/pos_repository.dart';

@lazySingleton
class GetProductByIdUseCase {
  final PosRepository _repository;

  GetProductByIdUseCase(this._repository);

  TaskEither<Failure, ProductEntity?> call(int id) {
    return _repository.getProductById(id);
  }
}
