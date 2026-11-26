import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/failure.dart';
import '../../repositories/product_repository.dart';

@lazySingleton
class SetBaseUnitUseCase {
  final ProductsRepository _repository;

  SetBaseUnitUseCase(this._repository);

  TaskEither<Failure, void> call({
    required int productId,
    required int unitId,
  }) {
    return TaskEither.tryCatch(
      () => _repository.setBaseUnit(
        productId: productId,
        unitId: unitId,
      ),
      (error, stackTrace) => ServerFailure(
        message: error.toString(),
      ),
    );
  }
}