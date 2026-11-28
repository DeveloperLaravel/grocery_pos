import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/failure.dart';
import '../../entities/product/product_image.dart';
import '../../repositories/product_repository.dart';

@lazySingleton
class GetProductImagesUseCase {
  final ProductsRepository _repository;

  GetProductImagesUseCase(this._repository);

  TaskEither<Failure, List<ProductImage>> call(int productId) {
    return TaskEither.tryCatch(
      () => _repository.getProductImages(productId),
      (error, stackTrace) => ServerFailure(
        message: error.toString(),
      ),
    );
  }
}