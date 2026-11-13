
import 'package:injectable/injectable.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../repositories/pos_repository.dart';

@lazySingleton
class AdjustStockUseCase {
  final PosRepository _repository;

  AdjustStockUseCase(this._repository);

  TaskEither<Failure, Unit> call({
    required int productId,
    required double delta,
    required String note,
  }) {
    return _repository.adjustStock(
      productId: productId,
      delta: delta,
      note: note,
    );
  }
}
