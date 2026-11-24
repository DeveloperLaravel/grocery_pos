
import '../entities/supplier.dart';

abstract interface class SupplierRepository {
  Future<List<Supplier>> getAllSuppliers();

  Stream<List<Supplier>> watchAllSuppliers();

  Future<Supplier?> getSupplierById(int id);

  Future<List<Supplier>> searchSuppliers(String query);

  Future<int> createSupplier(Supplier supplier);

  Future<bool> updateSupplier(int id, Supplier supplier);

  Future<bool> deleteSupplier(int id);

  Future<bool> updateSupplierStatus(int id, bool isActive);
}
