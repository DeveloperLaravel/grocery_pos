import 'package:injectable/injectable.dart';

import '../../repositories/product_repository.dart';

@lazySingleton
class DeleteProductBarcodeUseCase {
  final ProductsRepository _repository;

  DeleteProductBarcodeUseCase(this._repository);

  Future<int> call(int id) {
    return _repository.deleteProductBarcode(id);
  }
}