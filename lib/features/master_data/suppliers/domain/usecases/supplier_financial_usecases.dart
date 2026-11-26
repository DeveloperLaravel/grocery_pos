
import 'package:injectable/injectable.dart';

import '../repositories/supplier_repository.dart';

@lazySingleton
class SupplierFinancialUseCases {
  final SupplierRepository repository;

  SupplierFinancialUseCases(this.repository);

  Future<int> updateBalance({
    required int id,
    required double balance,
  }) =>
      repository.updateSupplierBalance(
        id: id,
        balance: balance,
      );

  Future<double> getTotalBalance() =>
      repository.getTotalSupplierBalance();

  Future<int> updateRating({
    required int id,
    required double rating,
  }) =>
      repository.updateSupplierRating(
        id: id,
        rating: rating,
      );
}
