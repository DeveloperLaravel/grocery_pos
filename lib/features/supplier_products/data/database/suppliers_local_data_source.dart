import '../models/supplier_product_model.dart';

abstract class SupplierProductsLocalDataSource {
  Future<List<SupplierProductModel>> getAll();

  Stream<List<SupplierProductModel>> watchAll();

  Future<List<SupplierProductModel>> getBySupplierId(
    int supplierId,
  );

  Stream<List<SupplierProductModel>> watchBySupplierId(
    int supplierId,
  );

  Future<List<SupplierProductModel>> getByProductId(
    int productId,
  );

  Future<SupplierProductModel?> getById(int id);

  Future<int> create(
    SupplierProductModel supplierProduct,
  );

  Future<void> update(
    SupplierProductModel supplierProduct,
  );

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