
import 'package:injectable/injectable.dart';

import '../../entities/product.dart';
import '../../repositories/product_repository.dart';

@lazySingleton
class GetProductByBarcodeUsecase {
  final ProductRepository repository;

  GetProductByBarcodeUsecase(this.repository);

  Future<Product?> call(String barcode) {
    final value = barcode.trim();

    if (value.isEmpty) {
      return Future.value(null);
    }

    return repository.getProductByBarcode(value);
  }
}
