import 'package:injectable/injectable.dart';

import '../../domain/entities/supplier_product.dart';

import '../../domain/repositories/supplier_product_repository.dart';
import '../database/suppliers_local_data_source.dart';
import '../mappers/supplier_product_mapper.dart';

@LazySingleton(as: SupplierProductRepository)
class SupplierProductRepositoryImpl
    implements SupplierProductRepository {
  final SupplierProductsLocalDataSource localDataSource;

  SupplierProductRepositoryImpl(this.localDataSource);

  // =====================================================
  // Get All
  // =====================================================

  @override
  Future<List<SupplierProduct>> getAll() async {
    final models = await localDataSource.getAll();

    return models
        .map(SupplierProductMapper.toEntity)
        .toList();
  }

  // =====================================================
  // Watch All
  // =====================================================

  @override
  Stream<List<SupplierProduct>> watchAll() {
    return localDataSource.watchAll().map(
          (models) => models
              .map(SupplierProductMapper.toEntity)
              .toList(),
        );
  }

  // =====================================================
  // Get By Supplier
  // =====================================================

  @override
  Future<List<SupplierProduct>> getBySupplierId(
    int supplierId,
  ) async {
    final models = await localDataSource.getBySupplierId(
      supplierId,
    );

    return models
        .map(SupplierProductMapper.toEntity)
        .toList();
  }

  // =====================================================
  // Watch By Supplier
  // =====================================================

  @override
  Stream<List<SupplierProduct>> watchBySupplierId(
    int supplierId,
  ) {
    return localDataSource.watchBySupplierId(supplierId).map(
          (models) => models
              .map(SupplierProductMapper.toEntity)
              .toList(),
        );
  }

  // =====================================================
  // Get By Product
  // =====================================================

  @override
  Future<List<SupplierProduct>> getByProductId(
    int productId,
  ) async {
    final models = await localDataSource.getByProductId(
      productId,
    );

    return models
        .map(SupplierProductMapper.toEntity)
        .toList();
  }

  // =====================================================
  // Get By ID
  // =====================================================

  @override
  Future<SupplierProduct?> getById(int id) async {
    final model = await localDataSource.getById(id);

    if (model == null) return null;

    return SupplierProductMapper.toEntity(model);
  }

  // =====================================================
  // Create
  // =====================================================

  @override
  Future<int> create(
    SupplierProduct supplierProduct,
  ) {
    final model = SupplierProductMapper.fromEntity(
      supplierProduct,
    );

    return localDataSource.create(model);
  }

  // =====================================================
  // Update
  // =====================================================

  @override
  Future<void> update(
    SupplierProduct supplierProduct,
  ) {
    final model = SupplierProductMapper.fromEntity(
      supplierProduct,
    );

    return localDataSource.update(model);
  }

  // =====================================================
  // Delete
  // =====================================================

  @override
  Future<void> delete(int id) {
    return localDataSource.delete(id);
  }

  // =====================================================
  // Update Status
  // =====================================================

  @override
  Future<void> updateStatus({
    required int id,
    required bool isActive,
  }) {
    return localDataSource.updateStatus(
      id: id,
      isActive: isActive,
    );
  }

  // =====================================================
  // Update Preferred
  // =====================================================

  @override
  Future<void> updatePreferred({
    required int id,
    required bool isPreferred,
  }) {
    return localDataSource.updatePreferred(
      id: id,
      isPreferred: isPreferred,
    );
  }
}