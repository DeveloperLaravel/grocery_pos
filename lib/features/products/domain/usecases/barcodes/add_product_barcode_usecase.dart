
import 'package:injectable/injectable.dart';

import '../../entities/product_barcode.dart';
import '../../repositories/product_repository.dart';

@lazySingleton
class AddProductBarcodeUsecase {
  final ProductRepository repository;

  AddProductBarcodeUsecase(this.repository);

  Future<int> call(ProductBarcode barcode) {
    return repository.addProductBarcode(barcode);
  }
}
