import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/failure.dart';
import '../../entities/product/product_unit.dart';
import '../../repositories/product_repository.dart';

@lazySingleton
class GetProductUnitsUseCase {
  final ProductsRepository _repository;

  GetProductUnitsUseCase(this._repository);

  TaskEither<Failure, List<ProductUnit>> call({
    required int productId,
  }) {
    return TaskEither.tryCatch(
      () => _repository.getProductUnits(productId),
      (error, stackTrace) => ServerFailure(
        message: error.toString(),
      ),
    );
  }
}