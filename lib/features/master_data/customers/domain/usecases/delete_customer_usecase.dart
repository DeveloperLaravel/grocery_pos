
import 'package:injectable/injectable.dart';

import '../repositories/customer_repository.dart';

@lazySingleton
class DeleteCustomerUseCase {
  final CustomerRepository repository;

  const DeleteCustomerUseCase(this.repository);

  Future<bool> call(int id) {
    return repository.deleteCustomer(id);
  }
}
