
import 'package:injectable/injectable.dart';

import '../repositories/supplier_repository.dart';

@lazySingleton
class SupplierStatusUseCases {
  final SupplierRepository repository;

  SupplierStatusUseCases(this.repository);

  Future<int> togglePreferred({
    required int id,
    required bool isPreferred,
  }) =>
      repository.togglePreferredStatus(
        id: id,
        isPreferred: isPreferred,
      );

  Future<int> toggleActive({
    required int id,
    required bool isActive,
  }) =>
      repository.toggleSupplierStatus(
        id: id,
        isActive: isActive,
      );

  Future<int> updateLastPurchase({
    required int id,
    required DateTime date,
  }) =>
      repository.updateLastPurchaseAt(
        id: id,
        date: date,
      );

  Future<int> updateLastPayment({
    required int id,
    required DateTime date,
  }) =>
      repository.updateLastPaymentAt(
        id: id,
        date: date,
      );
}
