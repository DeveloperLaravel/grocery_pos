import 'package:injectable/injectable.dart';

import '../../entities/product/product_barcode.dart';
import '../../repositories/product_repository.dart';

@lazySingleton
class WatchProductBarcodesUseCase {
  final ProductsRepository _repository;

  WatchProductBarcodesUseCase(this._repository);

  Stream<List<ProductBarcode>> call(int productId) {
    return _repository.watchProductBarcodes(productId);
  }
}