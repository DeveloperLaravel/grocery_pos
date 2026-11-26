import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/failure.dart';
import '../../repositories/product_repository.dart';


@lazySingleton
class SetPrimaryProductImageUseCase {
  final ProductsRepository _repository;

  SetPrimaryProductImageUseCase(this._repository);

  TaskEither<Failure, Unit> call({
    required int productId,
    required int imageId,
  }) {
    return TaskEither.tryCatch(
      () async {
        await _repository.setPrimaryImage(
          productId: productId,
          imageId: imageId,
        );

        return unit;
      },
      (error, stackTrace) => ServerFailure(
        message: error.toString(),
      ),
    );
  }
}