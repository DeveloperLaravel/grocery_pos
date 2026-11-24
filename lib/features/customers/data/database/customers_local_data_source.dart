import '../models/customer_model.dart';

abstract class CustomersLocalDataSource {
  Future<int> insertCustomer(CustomerModel customer);

  Future<int> updateCustomer(
    int id,
    CustomerModel customer,
  );

  Future<CustomerModel?> getCustomerById(int id);

  Future<CustomerModel?> getCustomerByCode(String code);

  Future<List<CustomerModel>> getAllCustomers();

  Future<List<CustomerModel>> getActiveCustomers();

  Future<List<CustomerModel>> searchCustomers(String query);

  Stream<List<CustomerModel>> watchAllCustomers();

  Stream<List<CustomerModel>> watchActiveCustomers();

  Stream<List<CustomerModel>> watchSearchCustomers(
    String query,
  );

  Stream<CustomerModel?> watchCustomerById(int id);

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