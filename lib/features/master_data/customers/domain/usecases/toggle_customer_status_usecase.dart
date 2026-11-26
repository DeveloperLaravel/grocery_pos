

import 'package:injectable/injectable.dart';

import '../repositories/customer_repository.dart';

@lazySingleton
class ToggleCustomerStatusUseCase {
  final CustomerRepository repository;

  const ToggleCustomerStatusUseCase(this.repository);

  Future<bool> call({
    required int id,
    required bool isActive,
  }) {
    return repository.toggleCustomerStatus(
      id: id,
      isActive: isActive,
    );
  }
}
