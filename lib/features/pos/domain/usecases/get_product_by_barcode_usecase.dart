
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';

class GetProductByBarcodeUseCase {
  final PosRepository repository;

  GetProductByBarcodeUseCase(this.repository);

  TaskEither<Failure, ProductEntity?> call(String barcode) {
    return repository.getProductByBarcode(barcode);
  }
}
