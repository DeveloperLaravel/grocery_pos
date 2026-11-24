import 'package:injectable/injectable.dart';

import '../../repositories/product_repository.dart';

@lazySingleton
class DeleteProductBarcodeUseCase {
  final ProductRepository repository;

  DeleteProductBarcodeUseCase(this.repository);

  Future<void> call(int id) {
    return repository.deleteProductBarcode(id);
  }
}