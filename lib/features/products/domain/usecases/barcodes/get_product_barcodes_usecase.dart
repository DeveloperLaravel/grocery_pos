
import 'package:injectable/injectable.dart';

import '../../entities/product_barcode.dart';
import '../../repositories/product_repository.dart';

@lazySingleton
class GetProductBarcodesUsecase {
  final ProductRepository repository;

  GetProductBarcodesUsecase(this.repository);

  Future<List<ProductBarcode>> call(int productId) {
    return repository.getProductBarcodes(productId);
  }
}
