
import '../models/customer_model.dart';

abstract class CustomerLocalDataSource {
  Future<List<CustomerModel>> getCustomers();

  Stream<List<CustomerModel>> watchCustomers();

  Future<CustomerModel?> getCustomerById(int id);

  Future<List<CustomerModel>> searchCustomers(String query);

  Future<int> insertCustomer(CustomerModel customer);

  Future<bool> updateCustomer(CustomerModel customer);

  Future<bool> deleteCustomer(int id);

  Future<bool> toggleCustomerStatus({
    required int id,
    required bool isActive,
  });
}
