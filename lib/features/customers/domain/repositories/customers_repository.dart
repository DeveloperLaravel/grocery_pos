import '../../domain/entities/customer.dart';

abstract class CustomersRepository {
  Future<int> insertCustomer(Customer customer);

  Future<int> updateCustomer(
    int id,
    Customer customer,
  );

  Future<Customer?> getCustomerById(int id);

  Future<Customer?> getCustomerByCode(String code);

  Future<List<Customer>> getAllCustomers();

  Future<List<Customer>> getActiveCustomers();

  Future<List<Customer>> searchCustomers(String query);

  Stream<List<Customer>> watchAllCustomers();

  Stream<List<Customer>> watchActiveCustomers();

  Stream<List<Customer>> watchSearchCustomers(String query);

  Stream<Customer?> watchCustomerById(int id);

  Future<bool> isCustomerCodeExists(
    String code, {
    int? excludedId,
  });

  Future<int> activateCustomer(int id);

  Future<int> deactivateCustomer(int id);

  Future<int> deleteCustomerPermanently(int id);

  Future<int> getCustomersCount();

  Future<int> getActiveCustomersCount();
}