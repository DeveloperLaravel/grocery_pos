
import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../tables/sales_inventory/purchases/supplier_products_table.dart';

part 'supplier_products_dao.g.dart';

@DriftAccessor(
  tables: [
    SupplierProducts,
  ],
)
class SupplierProductsDao extends DatabaseAccessor<AppDatabase>
    with _$SupplierProductsDaoMixin {
  SupplierProductsDao(super.db);

  // =========================
  // READ
  // =========================

  Future<List<SupplierProductDb>> getAllSupplierProducts() {
    return (select(supplierProducts)
          ..orderBy([
            (t) => OrderingTerm.desc(t.createdAt),
          ]))
        .get();
  }

  Stream<List<SupplierProductDb>> watchAllSupplierProducts() {
    return (select(supplierProducts)
          ..orderBy([
            (t) => OrderingTerm.desc(t.createdAt),
          ]))
        .watch();
  }

  Future<SupplierProductDb?> getById(int id) {
    return (select(supplierProducts)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Future<List<SupplierProductDb>> getBySupplierId(
    int supplierId,
  ) {
    return (select(supplierProducts)
          ..where(
            (t) => t.supplierId.equals(supplierId),
          ))
        .get();
  }

  Stream<List<SupplierProductDb>> watchBySupplierId(
    int supplierId,
  ) {
    return (select(supplierProducts)
          ..where(
            (t) => t.supplierId.equals(supplierId),
          ))
        .watch();
  }

  Future<List<SupplierProductDb>> getByProductId(
    int productId,
  ) {
    return (select(supplierProducts)
          ..where(
            (t) => t.productId.equals(productId),
          ))
        .get();
  }

  /// الموردون المفضلون النشطون لمنتج معين.
  Future<List<SupplierProductDb>> getPreferredByProductId(
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

  Future<SupplierProductDb?> getBySupplierAndProduct({
    required int supplierId,
    required int productId,
  }) {
    return (select(supplierProducts)
          ..where(
            (t) =>
                t.supplierId.equals(supplierId) &
                t.productId.equals(productId),
          ))
        .getSingleOrNull();
  }

  // =========================
  // CHECK
  // =========================

  Future<bool> exists({
    required int supplierId,
    required int productId,
    int? productUnitId,
  }) async {
    final query = select(supplierProducts)
      ..where(
        (t) =>
            t.supplierId.equals(supplierId) &
            t.productId.equals(productId),
      );

    if (productUnitId == null) {
      query.where(
        (t) => t.productUnitId.isNull(),
      );
    } else {
      query.where(
        (t) => t.productUnitId.equals(productUnitId),
      );
    }

    query.limit(1);

    return await query.getSingleOrNull() != null;
  }

  // =========================
  // CREATE
  // =========================

  Future<int> createSupplierProduct(
    SupplierProductsCompanion entry,
  ) {
    return into(supplierProducts).insert(entry);
  }

  // =========================
  // UPDATE
  // =========================

  Future<int> updateSupplierProduct({
    required int id,
    required SupplierProductsCompanion entry,
  }) {
    return (update(supplierProducts)
          ..where((t) => t.id.equals(id)))
        .write(
      entry.copyWith(
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  // =========================
  // STATUS
  // =========================

  Future<int> changeStatus({
    required int id,
    required bool isActive,
  }) {
    return (update(supplierProducts)
          ..where((t) => t.id.equals(id)))
        .write(
      SupplierProductsCompanion(
        isActive: Value(isActive),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  // =========================
  // DELETE
  // =========================

  Future<int> deleteSupplierProduct(int id) {
    return (delete(supplierProducts)
          ..where((t) => t.id.equals(id)))
        .go();
  }

  Future<int> deleteBySupplierId(int supplierId) {
    return (delete(supplierProducts)
          ..where(
            (t) => t.supplierId.equals(supplierId),
          ))
        .go();
  }

  // =========================
  // COUNT
  // =========================

  Future<int> getCount({
    int? supplierId,
    int? productId,
  }) async {
    final count = supplierProducts.id.count();

    final query = selectOnly(supplierProducts)
      ..addColumns([count]);

    if (supplierId != null) {
      query.where(
        supplierProducts.supplierId.equals(supplierId),
      );
    }

    if (productId != null) {
      query.where(
        supplierProducts.productId.equals(productId),
      );
    }

    final result = await query.getSingle();

    return result.read(count) ?? 0;
  }
}
