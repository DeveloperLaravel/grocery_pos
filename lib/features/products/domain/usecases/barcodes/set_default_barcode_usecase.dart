
import 'package:injectable/injectable.dart';

import '../../repositories/product_repository.dart';

@lazySingleton
class SetDefaultBarcodeUsecase {
  final ProductRepository repository;

  SetDefaultBarcodeUsecase(this.repository);

  Future<void> call(int id) {
    return repository.setDefaultBarcode(id);
  }
}
