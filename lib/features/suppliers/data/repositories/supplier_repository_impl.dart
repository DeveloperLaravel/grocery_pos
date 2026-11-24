
import 'package:injectable/injectable.dart';

import '../../domain/entities/supplier.dart';
import '../../domain/repositories/supplier_repository.dart';
import '../database/suppliers_local_data_source.dart';

@LazySingleton(as: SupplierRepository)
class SupplierRepositoryImpl implements SupplierRepository {
  final SuppliersLocalDataSource localDataSource;

  SupplierRepositoryImpl(this.localDataSource);

  @override
  Future<List<Supplier>> getAllSuppliers() {
    return localDataSource.getAllSuppliers();
  }

  @override
  Stream<List<Supplier>> watchAllSuppliers() {
    return localDataSource.watchAllSuppliers();
  }

  @override
  Future<Supplier?> getSupplierById(int id) {
    return localDataSource.getSupplierById(id);
  }

  @override
  Future<List<Supplier>> searchSuppliers(String query) {
    return localDataSource.searchSuppliers(query);
  }

  @override
  Future<int> createSupplier(Supplier supplier) {
    return localDataSource.createSupplier(supplier);
  }

  @override
  Future<bool> updateSupplier(int id, Supplier supplier) {
    return localDataSource.updateSupplier(id, supplier);
  }

  @override
  Future<bool> deleteSupplier(int id) {
    return localDataSource.deleteSupplier(id);
  }

  @override
  Future<bool> updateSupplierStatus(int id, bool isActive) {
    return localDataSource.updateSupplierStatus(id, isActive);
  }
}
