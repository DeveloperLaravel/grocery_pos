
import 'package:injectable/injectable.dart';

import '../entities/customer.dart';
import '../repositories/customer_repository.dart';

// 1. Get Customers

@lazySingleton
class GetCustomersUseCase {
  final CustomerRepository _repository;

  GetCustomersUseCase(this._repository);

  Future<List<Customer>> call() {
    return _repository.getCustomers();
  }
}

// 2. Watch Customers

// @lazySingleton
// class WatchCustomersUseCase {
//   final CustomerRepository _repository;

//   WatchCustomersUseCase(this._repository);

//   Stream<List<Customer>> call() {
//     return _repository.watchCustomers();
//   }
// }

// // 3. Get Customer By ID

// @lazySingleton
// class GetCustomerByIdUseCase {
//   final CustomerRepository _repository;

//   GetCustomerByIdUseCase(this._repository);

//   Future<Customer?> call(int id) {
//     return _repository.getCustomerById(id);
//   }
// }

// // 4. Search Customers

// @lazySingleton
// class SearchCustomersUseCase {
//   final CustomerRepository _repository;

//   SearchCustomersUseCase(this._repository);

//   Future<List<Customer>> call(String query) {
//     return _repository.searchCustomers(query);
//   }
// }

// // 5. Insert Customer

// @lazySingleton
// class InsertCustomerUseCase {
//   final CustomerRepository _repository;

//   InsertCustomerUseCase(this._repository);

//   Future<int> call(Customer customer) {
//     return _repository.insertCustomer(customer);
//   }
// }

// // 6. Update Customer

// @lazySingleton
// class UpdateCustomerUseCase {
//   final CustomerRepository _repository;

//   UpdateCustomerUseCase(this._repository);

//   Future<bool> call(Customer customer) {
//     return _repository.updateCustomer(customer);
//   }
// }

// // 7. Delete Customer

// @lazySingleton
// class DeleteCustomerUseCase {
//   final CustomerRepository _repository;

//   DeleteCustomerUseCase(this._repository);

//   Future<bool> call(int id) {
//     return _repository.deleteCustomer(id);
//   }
// }

// // 8. Toggle Customer Status

// @lazySingleton
// class ToggleCustomerStatusUseCase {
//   final CustomerRepository _repository;

//   ToggleCustomerStatusUseCase(this._repository);

//   Future<bool> call({
//     required int id,
//     required bool isActive,
//   }) {
//     return _repository.toggleCustomerStatus(
//       id: id,
//       isActive: isActive,
//     );
//   }
// }
