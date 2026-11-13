
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../pos_repository.dart';

class AdjustStockUseCase {
  final PosRepository repository;

  AdjustStockUseCase(this.repository);

  TaskEither<Failure, Unit> call({
    required int productId,
    required double delta,
    required String note,
  }) {
    return repository.adjustStock(
      productId: productId,
      delta: delta,
      note: note,
    );
  }
}
