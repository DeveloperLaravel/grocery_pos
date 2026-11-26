
import '../entities/supplier.dart';

abstract class SupplierRepository {
  Future<int> insertSupplier(Supplier supplier);

  Future<int> updateSupplier({
    required int id,
    required Supplier supplier,
  });

  Future<int> deleteSupplier(int id);
  Future<int> archiveSupplier(int id);

  Future<List<Supplier>> getAllSuppliers();
  Future<List<Supplier>> getActiveSuppliers();

  Stream<List<Supplier>> watchAllSuppliers();
  Stream<List<Supplier>> watchActiveSuppliers();

  Future<Supplier?> getSupplierById(int id);
  Stream<Supplier?> watchSupplierById(int id);
  Future<Supplier?> getSupplierByCode(String code);

  Future<List<Supplier>> searchSuppliers(String query);
  Stream<List<Supplier>> watchSearchSuppliers(String query);

  Future<List<Supplier>> getSuppliersByCategory(String category);
  Future<List<Supplier>> getSuppliersByLevel(String level);
  Future<List<Supplier>> getPreferredSuppliers();
  Future<List<Supplier>> getSuppliersWithDebt();
  Future<List<Supplier>> getCreditSuppliers();
  Future<List<Supplier>> getSuppliersByType(String supplierType);

  Future<List<Supplier>> getSuppliersPaginated({
    required int limit,
    required int offset,
  });

  Future<int> updateSupplierBalance({
    required int id,
    required double balance,
  });

  Future<int> updateSupplierRating({
    required int id,
    required double rating,
  });

  Future<int> togglePreferredStatus({
    required int id,
    required bool isPreferred,
  });

  Future<int> updateLastPurchaseAt({
    required int id,
    required DateTime date,
  });

  Future<int> updateLastPaymentAt({
    required int id,
    required DateTime date,
  });

  Future<int> toggleSupplierStatus({
    required int id,
    required bool isActive,
  });

  Future<int> countSuppliers();
  Future<int> countActiveSuppliers();
  Future<double> getTotalSupplierBalance();

  Future<bool> supplierCodeExists(
    String code, {
    int? excludeId,
  });
}
