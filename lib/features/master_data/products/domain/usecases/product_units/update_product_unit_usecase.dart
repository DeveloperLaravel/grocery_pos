import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/failure.dart';
import '../../entities/product/product_unit.dart';
import '../../repositories/product_repository.dart';

@lazySingleton
class UpdateProductUnitUseCase {
  final ProductsRepository _repository;

  UpdateProductUnitUseCase(this._repository);

  TaskEither<Failure, bool> call({
    required int id,
    required ProductUnit unit,
  }) {
    return TaskEither.tryCatch(
      () => _repository.updateProductUnit(id, unit),
      (error, stackTrace) => ServerFailure(
        message: error.toString(),
      ),
    );
  }
}