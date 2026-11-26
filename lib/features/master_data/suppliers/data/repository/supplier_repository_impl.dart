import 'package:injectable/injectable.dart';

import '../../domain/entities/supplier.dart';
import '../../domain/repositories/supplier_repository.dart';
import '../database/suppliers_local_data_source.dart';

@LazySingleton(as: SupplierRepository)
class SupplierRepositoryImpl implements SupplierRepository {
  final SupplierLocalDataSource _localDataSource;

  SupplierRepositoryImpl(this._localDataSource);

  // =====================================================
  // 1. CRUD
  // =====================================================

  @override
  Future<int> insertSupplier(Supplier supplier) {
    return _localDataSource.insertSupplier(supplier);
  }

  @override
  Future<int> updateSupplier({
    required int id,
    required Supplier supplier,
  }) {
    return _localDataSource.updateSupplier(
      id: id,
      supplier: supplier,
    );
  }

  @override
  Future<int> deleteSupplier(int id) {
    return _localDataSource.deleteSupplier(id);
  }

  @override
  Future<int> archiveSupplier(int id) {
    return _localDataSource.archiveSupplier(id);
  }

  // =====================================================
  // 2. Get
  // =====================================================

  @override
  Future<List<Supplier>> getAllSuppliers() {
    return _localDataSource.getAllSuppliers();
  }

  @override
  Future<List<Supplier>> getActiveSuppliers() {
    return _localDataSource.getActiveSuppliers();
  }

  @override
  Future<Supplier?> getSupplierById(int id) {
    return _localDataSource.getSupplierById(id);
  }

  @override
  Future<Supplier?> getSupplierByCode(String code) {
    return _localDataSource.getSupplierByCode(code);
  }

  // =====================================================
  // 3. Watch
  // =====================================================

  @override
  Stream<List<Supplier>> watchAllSuppliers() {
    return _localDataSource.watchAllSuppliers();
  }

  @override
  Stream<List<Supplier>> watchActiveSuppliers() {
    return _localDataSource.watchActiveSuppliers();
  }

  @override
  Stream<Supplier?> watchSupplierById(int id) {
    return _localDataSource.watchSupplierById(id);
  }

  // =====================================================
  // 4. Search
  // =====================================================

  @override
  Future<List<Supplier>> searchSuppliers(String query) {
    return _localDataSource.searchSuppliers(query);
  }

  @override
  Stream<List<Supplier>> watchSearchSuppliers(String query) {
    return _localDataSource.watchSearchSuppliers(query);
  }

  // =====================================================
  // 5. Classification
  // =====================================================

  @override
  Future<List<Supplier>> getSuppliersByCategory(String category) {
    return _localDataSource.getSuppliersByCategory(category);
  }

  @override
  Future<List<Supplier>> getSuppliersByLevel(String level) {
    return _localDataSource.getSuppliersByLevel(level);
  }

  @override
  Future<List<Supplier>> getSuppliersByType(String type) {
    return _localDataSource.getSuppliersByType(type);
  }

  @override
  Future<List<Supplier>> getPreferredSuppliers() {
    return _localDataSource.getPreferredSuppliers();
  }

  @override
  Future<List<Supplier>> getCreditSuppliers() {
    return _localDataSource.getCreditSuppliers();
  }

  @override
  Future<List<Supplier>> getSuppliersWithDebt() {
    return _localDataSource.getSuppliersWithDebt();
  }

  // =====================================================
  // 6. Pagination
  // =====================================================

  @override
  Future<List<Supplier>> getSuppliersPaginated({
    required int limit,
    required int offset,
  }) {
    return _localDataSource.getSuppliersPaginated(
      limit: limit,
      offset: offset,
    );
  }

  // =====================================================
  // 7. Financial
  // =====================================================

  @override
  Future<int> updateSupplierBalance({
    required int id,
    required double balance,
  }) {
    return _localDataSource.updateSupplierBalance(
      id: id,
      balance: balance,
    );
  }

  @override
  Future<double> getTotalSupplierBalance() {
    return _localDataSource.getTotalSupplierBalance();
  }

  // =====================================================
  // 8. Rating
  // =====================================================

  @override
  Future<int> updateSupplierRating({
    required int id,
    required double rating,
  }) {
    return _localDataSource.updateSupplierRating(
      id: id,
      rating: rating,
    );
  }

  // =====================================================
  // 9. Preferred
  // =====================================================

  @override
  Future<int> togglePreferredStatus({
    required int id,
    required bool isPreferred,
  }) {
    return _localDataSource.togglePreferredStatus(
      id: id,
      isPreferred: isPreferred,
    );
  }

  // =====================================================
  // 10. Activity
  // =====================================================

  @override
  Future<int> toggleSupplierStatus({
    required int id,
    required bool isActive,
  }) {
    return _localDataSource.toggleSupplierStatus(
      id: id,
      isActive: isActive,
    );
  }

  @override
  Future<int> updateLastPurchaseAt({
    required int id,
    required DateTime date,
  }) {
    return _localDataSource.updateLastPurchaseAt(
      id: id,
      date: date,
    );
  }

  @override
  Future<int> updateLastPaymentAt({
    required int id,
    required DateTime date,
  }) {
    return _localDataSource.updateLastPaymentAt(
      id: id,
      date: date,
    );
  }

  // =====================================================
  // 11. Statistics
  // =====================================================

  @override
  Future<int> countSuppliers() {
    return _localDataSource.countSuppliers();
  }

  @override
  Future<int> countActiveSuppliers() {
    return _localDataSource.countActiveSuppliers();
  }

  // =====================================================
  // 12. Validation
  // =====================================================

  @override
  Future<bool> supplierCodeExists(
    String code, {
    int? excludeId,
  }) {
    return _localDataSource.supplierCodeExists(
      code,
      excludeId: excludeId,
    );
  }
}