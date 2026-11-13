
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../repositories/inventory_repository.dart';

class AdjustStockUseCase {
  final InventoryRepository repository;

  const AdjustStockUseCase(this.repository);

  TaskEither<Failure, Unit> call({
    required int productId,
    required double quantity,
    required String type,
    String? reference,
    String? note,
  }) {
    return repository.adjustStock(
      productId: productId,
      quantity: quantity,
      type: type,
      reference: reference,
      note: note,
    );
  }
}
