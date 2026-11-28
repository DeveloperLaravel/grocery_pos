import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/failure.dart';
import '../../repositories/product_repository.dart';

@lazySingleton
class SetDefaultUnitUseCase {
  final ProductsRepository _repository;

  SetDefaultUnitUseCase(this._repository);

  TaskEither<Failure, void> call({
    required int productId,
    required int unitId,
  }) {
    return TaskEither.tryCatch(
      () => _repository.setDefaultUnit(
        productId: productId,
        unitId: unitId,
      ),
      (error, stackTrace) => ServerFailure(
        message: error.toString(),
      ),
    );
  }
}