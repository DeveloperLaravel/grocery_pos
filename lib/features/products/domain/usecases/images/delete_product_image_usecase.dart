import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/failure.dart';
import '../../repositories/product_repository.dart';

@lazySingleton
class DeleteProductImageUseCase {
  final ProductsRepository _repository;

  DeleteProductImageUseCase(this._repository);

  TaskEither<Failure, int> call(int id) {
    return TaskEither.tryCatch(
      () => _repository.deleteProductImage(id),
      (error, stackTrace) => ServerFailure(
        message: error.toString(),
      ),
    );
  }
}