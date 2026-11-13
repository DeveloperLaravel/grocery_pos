
import 'package:injectable/injectable.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../entities/product_entity.dart';
import '../repositories/pos_repository.dart';

@lazySingleton
class GetProductByBarcodeUseCase {
  final PosRepository _repository;

  GetProductByBarcodeUseCase(this._repository);

  TaskEither<Failure, ProductEntity?> call(String barcode) {
    return _repository.getProductByBarcode(barcode);
  }
}
