import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';

import '../entities/sale.dart';
import '../repositories/sales_repository.dart';

class GetSalesUseCase {
  final SalesRepository repository;

  const GetSalesUseCase(this.repository);

  TaskEither<Failure, List<Sale>> call({
    int limit = 100,
  }) {
    return repository.getSales(limit: limit);
  }
}