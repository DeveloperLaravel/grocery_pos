import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';

import '../entities/sale.dart';
import '../repositories/sales_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetSaleDetailsUseCase {
  final SalesRepository repository;

  const GetSaleDetailsUseCase(this.repository);

  TaskEither<Failure, Sale> call(int saleId) {
    return repository.getSaleDetails(saleId);
  }
}