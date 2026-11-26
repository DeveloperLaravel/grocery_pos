import 'package:injectable/injectable.dart';

import '../../entities/product/product_barcode.dart';
import '../../repositories/product_repository.dart';

@lazySingleton
class GetBarcodeUseCase {
  final ProductsRepository _repository;

  GetBarcodeUseCase(this._repository);

  Future<ProductBarcode?> call(String barcode) {
    return _repository.getBarcode(barcode);
  }
}