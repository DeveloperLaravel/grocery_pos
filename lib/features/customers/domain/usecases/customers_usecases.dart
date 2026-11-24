import 'package:injectable/injectable.dart';

import '../entities/customer.dart';
import '../repositories/customers_repository.dart';

@lazySingleton
class CustomersUseCases {
  final CustomersRepository repository;

  CustomersUseCases(this.repository);

  // =====================================================
  // CREATE
  // =====================================================

  Future<int> insertCustomer(Customer customer) {
    return repository.insertCustomer(customer);
  }

  // =====================================================
  // UPDATE
  // =====================================================

  Future<int> updateCustomer(
    int id,
    Customer customer,
  ) {
    return repository.updateCustomer(id, customer);
  }

  // =====================================================
  // GET BY ID
  // =====================================================

  Future<Customer?> getCustomerById(int id) {
    return repository.getCustomerById(id);
  }

  // =====================================================
  // GET BY CODE
  // =====================================================

  Future<Customer?> getCustomerByCode(String code) {
    return repository.getCustomerByCode(code);
  }

  // =====================================================
  // GET ALL
  // =====================================================

  Future<List<Customer>> getAllCustomers() {
    return repository.getAllCustomers();
  }

  // =====================================================
  // GET ACTIVE
  // =====================================================

  Future<List<Customer>> getActiveCustomers() {
    return repository.getActiveCustomers();
  }

  // =====================================================
  // SEARCH
  // =====================================================

  Future<List<Customer>> searchCustomers(String query) {
    return repository.searchCustomers(query);
  }

  // =====================================================
  // WATCH ALL
  // =====================================================

  Stream<List<Customer>> watchAllCustomers() {
    return repository.watchAllCustomers();
  }

  // =====================================================
  // WATCH ACTIVE
  // =====================================================

  Stream<List<Customer>> watchActiveCustomers() {
    return repository.watchActiveCustomers();
  }

  // =====================================================
  // WATCH SEARCH
  // =====================================================

  Stream<List<Customer>> watchSearchCustomers(String query) {
    return repository.watchSearchCustomers(query);
  }

  // =====================================================
  // WATCH BY ID
  // =====================================================

  Stream<Customer?> watchCustomerById(int id) {
    return repository.watchCustomerById(id);
  }

  // =====================================================
  // CHECK CUSTOMER CODE
  // =====================================================

  Future<bool> isCustomerCodeExists(
    String code, {
    int? excludedId,
  }) {
    return repository.isCustomerCodeExists(
      code,
      excludedId: excludedId,
    );
  }

  // =====================================================
  // ACTIVATE
  // =====================================================

  Future<int> activateCustomer(int id) {
    return repository.activateCustomer(id);
  }

  // =====================================================
  // DEACTIVATE
  // =====================================================

  Future<int> deactivateCustomer(int id) {
    return repository.deactivateCustomer(id);
  }

  // =====================================================
  // DELETE
  // =====================================================

  Future<int> deleteCustomerPermanently(int id) {
    return repository.deleteCustomerPermanently(id);
  }

  // =====================================================
  // TOTAL COUNT
  // =====================================================

  Future<int> getCustomersCount() {
    return repository.getCustomersCount();
  }

  // =====================================================
  // ACTIVE COUNT
  // =====================================================

  Future<int> getActiveCustomersCount() {
    return repository.getActiveCustomersCount();
  }
}