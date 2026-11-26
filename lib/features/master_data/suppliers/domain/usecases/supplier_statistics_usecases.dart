
import 'package:injectable/injectable.dart';

import '../repositories/supplier_repository.dart';

@lazySingleton
class SupplierStatisticsUseCases {
  final SupplierRepository repository;

  SupplierStatisticsUseCases(this.repository);

  Future<int> countAll() =>
      repository.countSuppliers();

  Future<int> countActive() =>
      repository.countActiveSuppliers();

  Future<double> getTotalBalance() =>
      repository.getTotalSupplierBalance();
}
