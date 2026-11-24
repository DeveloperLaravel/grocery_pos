
import 'dart:async';

import 'package:injectable/injectable.dart';

import '../entities/sale.dart';
import '../repositories/sales_repository.dart';
@injectable
class WatchAllSalesUseCase {
  final SalesRepository repository;

  WatchAllSalesUseCase(this.repository);

  Stream<List<Sale>> call() {
    return repository.watchAllSales();
  }
}
