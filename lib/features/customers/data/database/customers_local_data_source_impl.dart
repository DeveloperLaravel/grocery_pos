import 'package:injectable/injectable.dart';


import '../../../../core/database/daos/master_data/parties/customers_dao.dart';
import '../mappers/customer_mapper.dart';
import '../models/customer_model.dart';
import 'customers_local_data_source.dart';

@LazySingleton(as: CustomersLocalDataSource)
class CustomersLocalDataSourceImpl
    implements CustomersLocalDataSource {
  final CustomersDao dao;

  CustomersLocalDataSourceImpl(this.dao);

  // =====================================================
  // Insert
  // =====================================================

  @override
  Future<int> insertCustomer(CustomerModel customer) {
    final companion = CustomerMapper.toCompanion(customer);

    return dao.insertCustomer(companion);
  }

  // =====================================================
  // Update
  // =====================================================

  @override
  Future<int> updateCustomer(
    int id,
    CustomerModel customer,
  ) {
    final companion = CustomerMapper.toCompanion(customer);

    return dao.updateCustomerById(id, companion);
  }

  // =====================================================
  // Get By ID
  // =====================================================

  @override
  Future<CustomerModel?> getCustomerById(int id) async {
    final result = await dao.getCustomerById(id);

    if (result == null) return null;

    return CustomerMapper.fromDb(result);
  }

  // =====================================================
  // Get By Code
  // =====================================================

  @override
  Future<CustomerModel?> getCustomerByCode(String code) async {
    final result = await dao.getCustomerByCode(code);

    if (result == null) return null;

    return CustomerMapper.fromDb(result);
  }

  // =====================================================
  // Get All
  // =====================================================

  @override
  Future<List<CustomerModel>> getAllCustomers() async {
    final result = await dao.getAllCustomers();

    return result.map(CustomerMapper.fromDb).toList();
  }

  // =====================================================
  // Get Active
  // =====================================================

  @override
  Future<List<CustomerModel>> getActiveCustomers() async {
    final result = await dao.getActiveCustomers();

    return result.map(CustomerMapper.fromDb).toList();
  }

  // =====================================================
  // Search
  // =====================================================

  @override
  Future<List<CustomerModel>> searchCustomers(String query) async {
    final result = await dao.searchCustomers(query);

    return result.map(CustomerMapper.fromDb).toList();
  }

  // =====================================================
  // Watch All
  // =====================================================

  @override
  Stream<List<CustomerModel>> watchAllCustomers() {
    return dao.watchAllCustomers().map(
          (rows) => rows.map(CustomerMapper.fromDb).toList(),
        );
  }

  // =====================================================
  // Watch Active
  // =====================================================

  @override
  Stream<List<CustomerModel>> watchActiveCustomers() {
    return dao.watchActiveCustomers().map(
          (rows) => rows.map(CustomerMapper.fromDb).toList(),
        );
  }

  // =====================================================
  // Watch Search
  // =====================================================

  @override
  Stream<List<CustomerModel>> watchSearchCustomers(
    String query,
  ) {
    return dao.watchSearchCustomers(query).map(
          (rows) => rows.map(CustomerMapper.fromDb).toList(),
        );
  }

  // =====================================================
  // Watch By ID
  // =====================================================

  @override
  Stream<CustomerModel?> watchCustomerById(int id) {
    return dao.watchCustomerById(id).map(
          (row) => row == null ? null : CustomerMapper.fromDb(row),
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
    return dao.isCustomerCodeExists(
      code,
      excludedId: excludedId,
    );
  }

  // =====================================================
  // Activate
  // =====================================================

  @override
  Future<int> activateCustomer(int id) {
    return dao.activateCustomer(id);
  }

  // =====================================================
  // Deactivate
  // =====================================================

  @override
  Future<int> deactivateCustomer(int id) {
    return dao.deactivateCustomer(id);
  }

  // =====================================================
  // Delete
  // =====================================================

  @override
  Future<int> deleteCustomerPermanently(int id) {
    return dao.deleteCustomerPermanently(id);
  }

  // =====================================================
  // Count
  // =====================================================

  @override
  Future<int> getCustomersCount() {
    return dao.getCustomersCount();
  }

  @override
  Future<int> getActiveCustomersCount() {
    return dao.getActiveCustomersCount();
  }
}