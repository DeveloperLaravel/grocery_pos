import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/failure.dart';
import '../../repositories/product_repository.dart';

@lazySingleton
class DeleteProductUnitUseCase {
  final ProductsRepository _repository;

  DeleteProductUnitUseCase(this._repository);

  TaskEither<Failure, int> call({
    required int id,
  }) {
    return TaskEither.tryCatch(
      () => _repository.deleteProductUnit(id),
      (error, stackTrace) => ServerFailure(
        message: error.toString(),
      ),
    );
  }
}