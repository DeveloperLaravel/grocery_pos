
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../repositories/sales_repository.dart';

class CancelSaleUseCase {
  final SalesRepository repository;

  const CancelSaleUseCase(this.repository);

  TaskEither<Failure, bool> call(int saleId) {
    return repository.cancelSale(saleId);
  }
}
