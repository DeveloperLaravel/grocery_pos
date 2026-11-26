
import 'package:injectable/injectable.dart';

import '../../../../../core/database/app_database.dart';
import '../mappers/customer_mapper.dart';
import '../models/customer_model.dart';
import 'customer_local_data_source.dart';

@LazySingleton(as: CustomerLocalDataSource)
class CustomerLocalDataSourceImpl
    implements CustomerLocalDataSource {
  final AppDatabase _database;

  const CustomerLocalDataSourceImpl(this._database);

  // =====================================================
  // 1. Get All Customers
  // =====================================================

  @override
  Future<List<CustomerModel>> getCustomers() async {
    final result = await _database.customersDao.getAllCustomers();

    return result.map(CustomerMapper.fromDb).toList();
  }

  // =====================================================
  // 2. Watch Customers
  // =====================================================

  @override
  Stream<List<CustomerModel>> watchCustomers() {
    return _database.customersDao.watchAllCustomers().map(
      (customers) => customers.map(CustomerMapper.fromDb).toList(),
    );
  }

  // =====================================================
  // 3. Get Customer By ID
  // =====================================================

  @override
  Future<CustomerModel?> getCustomerById(int id) async {
    final result = await _database.customersDao.getCustomerById(id);

    if (result == null) return null;

    return CustomerMapper.fromDb(result);
  }

  // =====================================================
  // 4. Search Customers
  // =====================================================

  @override
  Future<List<CustomerModel>> searchCustomers(String query) async {
    final result = await _database.customersDao.searchCustomers(query);

    return result.map(CustomerMapper.fromDb).toList();
  }

  // =====================================================
  // 5. Insert Customer
  // =====================================================

  @override
  Future<int> insertCustomer(CustomerModel customer) async {
    return _database.customersDao.insertCustomer(
      CustomerMapper.toCompanion(customer),
    );
  }

  // =====================================================
  // 6. Update Customer
  // =====================================================

@override
Future<bool> updateCustomer(CustomerModel customer) async {
  final result = await _database.customersDao.updateCustomer(
    id: customer.id,
    customer: CustomerMapper.toCompanion(customer),
  );

  return result > 0;
}
  // =====================================================
  // 7. Delete Customer
  // =====================================================

  @override
  Future<bool> deleteCustomer(int id) async {
    final deletedRows = await _database.customersDao.deleteCustomer(id);

    return deletedRows > 0;
  }

  // =====================================================
  // 8. Toggle Customer Status
  // =====================================================

@override
Future<bool> toggleCustomerStatus({
  required int id,
  required bool isActive,
}) async {
  final result = await _database.customersDao.toggleCustomerStatus(
    id: id,
    isActive: isActive,
  );

  return result > 0;
}
}
