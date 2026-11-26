
import 'package:injectable/injectable.dart';

import '../entities/customer.dart';
import '../repositories/customer_repository.dart';

@lazySingleton
class GetCustomerByIdUseCase {
  final CustomerRepository repository;

  const GetCustomerByIdUseCase(this.repository);

  Future<Customer?> call(int id) {
    return repository.getCustomerById(id);
  }
}
