
import '../entities/customer.dart';

abstract class CustomerRepository {
  // Get All
  Future<List<Customer>> getCustomers();

  // Watch All
  Stream<List<Customer>> watchCustomers();

  // Get By ID
  Future<Customer?> getCustomerById(int id);

  // Search
  Future<List<Customer>> searchCustomers(String query);

  // Insert
  Future<int> insertCustomer(Customer customer);

  // Update
  Future<bool> updateCustomer(Customer customer);

  // Delete
  Future<bool> deleteCustomer(int id);

  // Toggle Status
  Future<bool> toggleCustomerStatus({
    required int id,
    required bool isActive,
  });
}
