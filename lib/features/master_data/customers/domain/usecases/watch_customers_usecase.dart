

import 'package:injectable/injectable.dart';

import '../entities/customer.dart';
import '../repositories/customer_repository.dart';

@lazySingleton
class WatchCustomersUseCase {
  final CustomerRepository repository;

  const WatchCustomersUseCase(this.repository);

  Stream<List<Customer>> call() {
    return repository.watchCustomers();
  }
}
