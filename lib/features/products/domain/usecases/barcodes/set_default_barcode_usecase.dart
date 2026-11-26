import 'package:injectable/injectable.dart';

import '../../repositories/product_repository.dart';

@lazySingleton
class SetDefaultBarcodeUseCase {
  final ProductsRepository _repository;

  SetDefaultBarcodeUseCase(this._repository);

  Future<void> call({
    required int productId,
    required int barcodeId,
  }) {
    return _repository.setDefaultBarcode(
      productId: productId,
      barcodeId: barcodeId,
    );
  }
}