
import 'package:injectable/injectable.dart';

import '../../entities/product_barcode.dart';
import '../../repositories/product_repository.dart';

@lazySingleton
class GetBarcodeUsecase {
  final ProductRepository repository;

  GetBarcodeUsecase(this.repository);

  Future<ProductBarcode?> call(String barcode) {
    final value = barcode.trim();

    if (value.isEmpty) {
      return Future.value(null);
    }

    return repository.getBarcode(value);
  }
}
