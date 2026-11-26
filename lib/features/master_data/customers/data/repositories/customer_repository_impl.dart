
import 'package:injectable/injectable.dart';

import '../../domain/entities/customer.dart';
import '../../domain/repositories/customer_repository.dart';

import '../database/customer_local_data_source.dart';
import '../mappers/customer_mapper.dart';

@LazySingleton(as: CustomerRepository)
class CustomersRepositoryImpl implements CustomerRepository {
  final CustomerLocalDataSource _localDataSource;

  const CustomersRepositoryImpl(this._localDataSource);

  // =====================================================
  // 1. Get All Customers
  // =====================================================

  @override
  Future<List<Customer>> getCustomers() async {
    final result = await _localDataSource.getCustomers();

    return result.map(CustomerMapper.toEntity).toList();
  }

  // =====================================================
  // 2. Watch Customers
  // =====================================================

  @override
  Stream<List<Customer>> watchCustomers() {
    return _localDataSource.watchCustomers().map(
      (customers) => customers.map(CustomerMapper.toEntity).toList(),
    );
  }

  // =====================================================
  // 3. Get Customer By ID
  // =====================================================

  @override
  Future<Customer?> getCustomerById(int id) async {
    final result = await _localDataSource.getCustomerById(id);

    if (result == null) return null;

    return CustomerMapper.toEntity(result);
  }

  // =====================================================
  // 4. Search Customers
  // =====================================================

  @override
  Future<List<Customer>> searchCustomers(String query) async {
    final result = await _localDataSource.searchCustomers(query);

    return result.map(CustomerMapper.toEntity).toList();
  }

  // =====================================================
  // 5. Insert Customer
  // =====================================================

  @override
  Future<int> insertCustomer(Customer customer) {
    final model = CustomerMapper.fromEntity(customer);

    return _localDataSource.insertCustomer(model);
  }

  // =====================================================
  // 6. Update Customer
  // =====================================================

  @override
  Future<bool> updateCustomer(Customer customer) {
    final model = CustomerMapper.fromEntity(customer);

    return _localDataSource.updateCustomer(model);
  }

  // =====================================================
  // 7. Delete Customer
  // =====================================================

  @override
  Future<bool> deleteCustomer(int id) {
    return _localDataSource.deleteCustomer(id);
  }

  // =====================================================
  // 8. Toggle Customer Status
  // =====================================================

  @override
  Future<bool> toggleCustomerStatus({
    required int id,
    required bool isActive,
  }) {
    return _localDataSource.toggleCustomerStatus(
      id: id,
      isActive: isActive,
    );
  }
}
