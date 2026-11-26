
import 'package:drift/drift.dart';

import '../../../app_database.dart';

part 'supplier_products_dao.g.dart';

@DriftAccessor(tables: [SupplierProducts])
class SupplierProductsDao extends DatabaseAccessor<AppDatabase>
    with _$SupplierProductsDaoMixin {
  SupplierProductsDao(super.db);

  // Insert
  Future<int> insertSupplierProduct(
    SupplierProductsCompanion item,
  ) {
    return into(supplierProducts).insert(item);
  }

  // Update
  Future<bool> updateSupplierProduct(
    SupplierProductsCompanion item,
  ) {
    return update(supplierProducts).replace(item);
  }

  // Get By ID
  Future<SupplierProductDb?> getById(int id) {
    return (select(supplierProducts)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  // Get Products By Supplier
  Future<List<SupplierProductDb>> getBySupplier(
    int supplierId,
  ) {
    return (select(supplierProducts)
          ..where(
            (t) => t.supplierId.equals(supplierId),
          )
          ..orderBy([
            (t) => OrderingTerm.asc(t.id),
          ]))
        .get();
  }

  // Watch Products By Supplier
  Stream<List<SupplierProductDb>> watchBySupplier(
    int supplierId,
  ) {
    return (select(supplierProducts)
          ..where(
            (t) =>
                t.supplierId.equals(supplierId) &
                t.isActive.equals(true),
          )
          ..orderBy([
            (t) => OrderingTerm.asc(t.id),
          ]))
        .watch();
  }

  // Get Suppliers By Product
  Future<List<SupplierProductDb>> getByProduct(
    int productId,
  ) {
    return (select(supplierProducts)
          ..where(
            (t) => t.productId.equals(productId),
          ))
        .get();
  }

  // Get Preferred Suppliers
  Future<List<SupplierProductDb>> getPreferredSuppliers(
    int productId,
  ) {
    return (select(supplierProducts)
          ..where(
            (t) =>
                t.productId.equals(productId) &
                t.isPreferred.equals(true) &
                t.isActive.equals(true),
          ))
        .get();
  }

  // Get Active Products
  Future<List<SupplierProductDb>> getActiveProducts() {
    return (select(supplierProducts)
          ..where((t) => t.isActive.equals(true)))
        .get();
  }

  // Search Supplier Product Code
  Future<List<SupplierProductDb>> searchSupplierProductCode(
    String code,
  ) {
    return (select(supplierProducts)
          ..where(
            (t) =>
                t.supplierProductCode.contains(code) &
                t.isActive.equals(true),
          ))
        .get();
  }

  // Update Last Purchase Information
  Future<int> updatePurchaseHistory({
    required int id,
    required double price,
    required DateTime purchasedAt,
  }) {
    return (update(supplierProducts)
          ..where((t) => t.id.equals(id)))
        .write(
      SupplierProductsCompanion(
        lastPurchaseAt: Value(purchasedAt),
        lastPurchasedPrice: Value(price),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  // Archive
  Future<int> archive(int id) {
    return (update(supplierProducts)
          ..where((t) => t.id.equals(id)))
        .write(
      SupplierProductsCompanion(
        isActive: const Value(false),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  // Delete
  Future<int> deleteSupplierProduct(int id) {
    return (delete(supplierProducts)
          ..where((t) => t.id.equals(id)))
        .go();
  }
}
