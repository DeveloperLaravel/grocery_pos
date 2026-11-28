import '../../repositories/product_repository.dart';

class ToggleProductBarcodeUseCase {
  final ProductsRepository repository;

  ToggleProductBarcodeUseCase(this.repository);

  Future<void> call({
    required int id,
    required bool isActive,
  }) {
    return repository.toggleProductBarcode(
      id: id,
      isActive: isActive,
    );
  }
}