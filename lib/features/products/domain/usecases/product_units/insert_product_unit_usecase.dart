import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/failure.dart';
import '../../entities/product/product_unit.dart';
import '../../repositories/product_repository.dart';

@lazySingleton
class InsertProductUnitUseCase {
  final ProductsRepository _repository;

  InsertProductUnitUseCase(this._repository);

  TaskEither<Failure, int> call({
    required ProductUnit unit,
  }) {
    return TaskEither.tryCatch(
      () => _repository.insertProductUnit(unit),
      (error, stackTrace) => ServerFailure(
        message: error.toString(),
      ),
    );
  }
}