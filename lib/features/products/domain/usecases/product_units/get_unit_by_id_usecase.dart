import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/failure.dart';
import '../../entities/product/product_unit.dart';
import '../../repositories/product_repository.dart';

@lazySingleton
class GetUnitByIdUseCase {
  final ProductsRepository _repository;

  GetUnitByIdUseCase(this._repository);

  TaskEither<Failure, ProductUnit?> call({
    required int id,
  }) {
    return TaskEither.tryCatch(
      () => _repository.getUnitById(id),
      (error, stackTrace) => ServerFailure(
        message: error.toString(),
      ),
    );
  }
}