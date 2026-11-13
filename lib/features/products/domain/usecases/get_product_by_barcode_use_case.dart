
import 'package:injectable/injectable.dart';

import '../entities/product.dart';
import '../repositories/product_repository.dart';

@lazySingleton
class GetProductByBarcodeUseCase {
  final ProductRepository _repository;

  GetProductByBarcodeUseCase(this._repository);

  Future<Product?> call(String barcode) {
    return _repository.getProductByBarcode(barcode);
  }
}