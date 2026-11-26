
import 'package:injectable/injectable.dart';

import '../entities/customer.dart';
import '../repositories/customer_repository.dart';


@lazySingleton
class UpdateCustomerUseCase {
  final CustomerRepository repository;

  const UpdateCustomerUseCase(this.repository);

  Future<bool> call(Customer customer) {
    return repository.updateCustomer(customer);
  }
}
