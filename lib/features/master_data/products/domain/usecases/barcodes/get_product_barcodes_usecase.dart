import 'package:injectable/injectable.dart';

import '../../entities/product/product_barcode.dart';
import '../../repositories/product_repository.dart';

@lazySingleton
class GetProductBarcodesUseCase {
  final ProductsRepository _repository;

  GetProductBarcodesUseCase(this._repository);

  Future<List<ProductBarcode>> call(int productId) {
    return _repository.getProductBarcodes(productId);
  }
}