import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/failure.dart';
import '../../entities/product/product_image.dart';
import '../../repositories/product_repository.dart';

@lazySingleton
class InsertProductImageUseCase {
  final ProductsRepository _repository;

  InsertProductImageUseCase(this._repository);

  TaskEither<Failure, int> call(ProductImage image) {
    return TaskEither.tryCatch(
      () => _repository.insertProductImage(image),
      (error, stackTrace) => ServerFailure(
        message: error.toString(),
      ),
    );
  }
}