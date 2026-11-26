
import 'package:injectable/injectable.dart';

import '../entities/customer.dart';
import '../repositories/customer_repository.dart';


@lazySingleton
class InsertCustomerUseCase {
  final CustomerRepository repository;

  const InsertCustomerUseCase(this.repository);

  Future<int> call(Customer customer) {
    return repository.insertCustomer(customer);
  }
}
