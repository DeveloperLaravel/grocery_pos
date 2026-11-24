import 'package:injectable/injectable.dart';

import '../../domain/entities/customer.dart';
import '../../domain/repositories/customers_repository.dart';

import '../database/customers_local_data_source.dart';
import '../mappers/customer_mapper.dart';

@LazySingleton(as: CustomersRepository)
class CustomersRepositoryImpl implements CustomersRepository {
  final CustomersLocalDataSource localDataSource;

  CustomersRepositoryImpl(this.localDataSource);

  // =====================================================
  // Insert
  // =====================================================

  @override
  Future<int> insertCustomer(Customer customer) {
    final model = CustomerMapper.fromEntity(customer);

    return localDataSource.insertCustomer(model);
  }

  // =====================================================
  // Update
  // =====================================================

  @override
  Future<int> updateCustomer(
    int id,
    Customer customer,
  ) {
    final model = CustomerMapper.fromEntity(customer);

    return localDataSource.updateCustomer(id, model);
  }

  // =====================================================
  // Get By ID
  // =====================================================

  @override
  Future<Customer?> getCustomerById(int id) async {
    final result = await localDataSource.getCustomerById(id);

    if (result == null) return null;

    return CustomerMapper.toEntity(result);
  }

  // =====================================================
  // Get By Code
  // =====================================================

  @override
  Future<Customer?> getCustomerByCode(String code) async {
    final result = await localDataSource.getCustomerByCode(code);

    if (result == null) return null;

    return CustomerMapper.toEntity(result);
  }

  // =====================================================
  // Get All
  // =====================================================

  @override
  Future<List<Customer>> getAllCustomers() async {
    final result = await localDataSource.getAllCustomers();

    return result.map(CustomerMapper.toEntity).toList();
  }

  // =====================================================
  // Get Active
  // =====================================================

  @override
  Future<List<Customer>> getActiveCustomers() async {
    final result = await localDataSource.getActiveCustomers();

    return result.map(CustomerMapper.toEntity).toList();
  }

  // =====================================================
  // Search
  // =====================================================

  @override
  Future<List<Customer>> searchCustomers(String query) async {
    final result = await localDataSource.searchCustomers(query);

    return result.map(CustomerMapper.toEntity).toList();
  }

  // =====================================================
  // Watch All
  // =====================================================

  @override
  Stream<List<Customer>> watchAllCustomers() {
    return localDataSource.watchAllCustomers().map(
          (items) => items.map(CustomerMapper.toEntity).toList(),
        );
  }

  // =====================================================
  // Watch Active
  // =====================================================

  @override
  Stream<List<Customer>> watchActiveCustomers() {
    return localDataSource.watchActiveCustomers().map(
          (items) => items.map(CustomerMapper.toEntity).toList(),
        );
  }

  // =====================================================
  // Watch Search
  // =====================================================

  @override
  Stream<List<Customer>> watchSearchCustomers(String query) {
    return localDataSource.watchSearchCustomers(query).map(
          (items) => items.map(CustomerMapper.toEntity).toList(),
        );
  }

  // =====================================================
  // Watch By ID
  // =====================================================

  @override
  Stream<Customer?> watchCustomerById(int id) {
    return localDataSource.watchCustomerById(id).map(
          (item) =>
              item == null ? null : CustomerMapper.toEntity(item),
        );
  }

  // =====================================================
  // Check Code
  // =====================================================

  @override
  Future<bool> isCustomerCodeExists(
    String code, {
    int? excludedId,
  }) {
    return localDataSource.isCustomerCodeExists(
      code,
      excludedId: excludedId,
    );
  }

  // =====================================================
  // Activate
  // =====================================================

  @override
  Future<int> activateCustomer(int id) {
    return localDataSource.activateCustomer(id);
  }

  // =====================================================
  // Deactivate
  // =====================================================

  @override
  Future<int> deactivateCustomer(int id) {
    return localDataSource.deactivateCustomer(id);
  }

  // =====================================================
  // Delete
  // =====================================================

  @override
  Future<int> deleteCustomerPermanently(int id) {
    return localDataSource.deleteCustomerPermanently(id);
  }

  // =====================================================
  // Count
  // =====================================================

  @override
  Future<int> getCustomersCount() {
    return localDataSource.getCustomersCount();
  }

  @override
  Future<int> getActiveCustomersCount() {
    return localDataSource.getActiveCustomersCount();
  }
}