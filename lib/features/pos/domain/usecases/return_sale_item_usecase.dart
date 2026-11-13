
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../pos_repository.dart';

class ReturnSaleItemUseCase {
  final PosRepository repository;

  ReturnSaleItemUseCase(this.repository);

  TaskEither<Failure, Unit> call({
    required int saleId,
    required int productId,
    required double quantity,
    required double refundAmount,
  }) {
    return repository.returnSaleItem(
      saleId: saleId,
      productId: productId,
      quantity: quantity,
      refundAmount: refundAmount,
    );
  }
}
