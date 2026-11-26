import 'package:injectable/injectable.dart';

import '../../entities/product/product_barcode.dart';
import '../../repositories/product_repository.dart';

@lazySingleton
class InsertProductBarcodeUseCase {
  final ProductsRepository _repository;

  InsertProductBarcodeUseCase(this._repository);

  Future<int> call(ProductBarcode barcode) {
    return _repository.insertProductBarcode(barcode);
  }
}