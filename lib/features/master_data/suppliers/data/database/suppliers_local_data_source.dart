import '../../domain/entities/supplier.dart';

abstract class SupplierLocalDataSource {

  // CRUD
  Future<int> insertSupplier(Supplier supplier);

  Future<int> updateSupplier({
    required int id,
    required Supplier supplier,
  });

  Future<int> deleteSupplier(int id);

  Future<int> archiveSupplier(int id);

  // Get
  Future<List<Supplier>> getAllSuppliers();

  Future<List<Supplier>> getActiveSuppliers();

  Future<Supplier?> getSupplierById(int id);

  Future<Supplier?> getSupplierByCode(String code);

  // Watch
  Stream<List<Supplier>> watchAllSuppliers();

  Stream<List<Supplier>> watchActiveSuppliers();

  Stream<Supplier?> watchSupplierById(int id);

  // Search
  Future<List<Supplier>> searchSuppliers(String query);

  Stream<List<Supplier>> watchSearchSuppliers(String query);

  // Classification
  Future<List<Supplier>> getSuppliersByCategory(String category);

  Future<List<Supplier>> getSuppliersByLevel(String level);

  Future<List<Supplier>> getSuppliersByType(String type);

  Future<List<Supplier>> getPreferredSuppliers();

  Future<List<Supplier>> getCreditSuppliers();

  Future<List<Supplier>> getSuppliersWithDebt();

  // Pagination
  Future<List<Supplier>> getSuppliersPaginated({
    required int limit,
    required int offset,
  });

  // Financial
  Future<int> updateSupplierBalance({
    required int id,
    required double balance,
  });

  Future<double> getTotalSupplierBalance();

  // Rating
  Future<int> updateSupplierRating({
    required int id,
    required double rating,
  });

  // Preferred
  Future<int> togglePreferredStatus({
    required int id,
    required bool isPreferred,
  });

  // Activity
  Future<int> toggleSupplierStatus({
    required int id,
    required bool isActive,
  });

  Future<int> updateLastPurchaseAt({
    required int id,
    required DateTime date,
  });

  Future<int> updateLastPaymentAt({
    required int id,
    required DateTime date,
  });

  // Statistics
  Future<int> countSuppliers();

  Future<int> countActiveSuppliers();

  // Validation
  Future<bool> supplierCodeExists(
    String code, {
    int? excludeId,
  });
}