import '../entities/supplier_product.dart';

abstract class SupplierProductRepository {
  Future<List<SupplierProduct>> getAll();

  Stream<List<SupplierProduct>> watchAll();

  Future<List<SupplierProduct>> getBySupplierId(
    int supplierId,
  );

  Stream<List<SupplierProduct>> watchBySupplierId(
    int supplierId,
  );

  Future<List<SupplierProduct>> getByProductId(
    int productId,
  );

  Future<SupplierProduct?> getById(int id);

  Future<int> create(SupplierProduct supplierProduct);

  Future<void> update(SupplierProduct supplierProduct);

  Future<void> delete(int id);

  Future<void> updateStatus({
    required int id,
    required bool isActive,
  });

  Future<void> updatePreferred({
    required int id,
    required bool isPreferred,
  });
}