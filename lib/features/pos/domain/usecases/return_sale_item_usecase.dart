
import 'package:injectable/injectable.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../repositories/pos_repository.dart';

@lazySingleton
class ReturnSaleItemUseCase {
  final PosRepository _repository;

  ReturnSaleItemUseCase(this._repository);

  TaskEither<Failure, Unit> call({
    required int saleId,
    required int productId,
    required double quantity,
    required double refundAmount,
  }) {
    return _repository.returnSaleItem(
      saleId: saleId,
      productId: productId,
      quantity: quantity,
      refundAmount: refundAmount,
    );
  }
}
