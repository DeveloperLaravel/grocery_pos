

import 'package:injectable/injectable.dart';

import '../entities/customer.dart';
import '../repositories/customer_repository.dart';

@lazySingleton
class SearchCustomersUseCase {
  final CustomerRepository repository;

  const SearchCustomersUseCase(this.repository);

  Future<List<Customer>> call(String query) {
    return repository.searchCustomers(query.trim());
  }
}
