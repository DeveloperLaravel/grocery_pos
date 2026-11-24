
import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../tables/master_data/products/products_table.dart';
import '../../../tables/master_data/products/product_units_table.dart';
import '../../../tables/master_data/products/product_barcodes_table.dart';

part 'product_barcodes_dao.g.dart';

@DriftAccessor(
  tables: [
    Products,
    ProductUnits,
    ProductBarcodes,
  ],
)
class ProductBarcodesDao extends DatabaseAccessor<AppDatabase>
    with _$ProductBarcodesDaoMixin {
  ProductBarcodesDao(super.db);

  // التحقق من أن الوحدة تتبع المنتج
  Future<void> _validateUnit({
    required int productId,
    required int? unitId,
  }) async {
    if (unitId == null) return;

    final unit = await (select(productUnits)
          ..where(
            (t) =>
                t.id.equals(unitId) &
                t.productId.equals(productId),
          ))
        .getSingleOrNull();

    if (unit == null) {
      throw StateError('The selected unit does not belong to this product.');
    }
  }

  // إضافة باركود
  Future<int> createBarcode(
    ProductBarcodesCompanion companion,
  ) async {
    final productId = companion.productId.value;
    final unitId = companion.productUnitId.present
        ? companion.productUnitId.value
        : null;
    final isDefault = companion.isDefault.present
        ? companion.isDefault.value
        : false;

    return transaction(() async {
      await _validateUnit(
        productId: productId,
        unitId: unitId,
      );

      if (isDefault) {
        await (update(productBarcodes)
              ..where((t) => t.productId.equals(productId)))
            .write(
          const ProductBarcodesCompanion(
            isDefault: Value(false),
          ),
        );
      }

      return into(productBarcodes).insert(companion);
    });
  }

  // تعديل باركود
  Future<bool> updateBarcode({
    required int barcodeId,
    required ProductBarcodesCompanion companion,
  }) async {
    return transaction(() async {
      final current = await getBarcodeById(barcodeId);

      if (current == null) return false;

      final productId = companion.productId.present
          ? companion.productId.value
          : current.productId;

      final unitId = companion.productUnitId.present
          ? companion.productUnitId.value
          : current.productUnitId;

      final isDefault = companion.isDefault.present
          ? companion.isDefault.value
          : current.isDefault;

      await _validateUnit(
        productId: productId,
        unitId: unitId,
      );

      if (isDefault) {
        await (update(productBarcodes)
              ..where(
                (t) =>
                    t.productId.equals(productId) &
                    t.id.isNotValue(barcodeId),
              ))
            .write(
          const ProductBarcodesCompanion(
            isDefault: Value(false),
          ),
        );
      }

      final rows = await (update(productBarcodes)
            ..where((t) => t.id.equals(barcodeId)))
          .write(
        companion.copyWith(
          updatedAt: Value(DateTime.now()),
        ),
      );

      return rows > 0;
    });
  }

  // جلب باركود حسب ID
  Future<ProductBarcodeDb?> getBarcodeById(int barcodeId) {
    return (select(productBarcodes)
          ..where((t) => t.id.equals(barcodeId)))
        .getSingleOrNull();
  }

  // البحث بواسطة نص الباركود
  Future<ProductBarcodeDb?> getBarcodeByValue(String barcode) {
    return (select(productBarcodes)
          ..where(
            (t) =>
                t.barcode.equals(barcode) &
                t.isActive.equals(true),
          ))
        .getSingleOrNull();
  }

  // جلب المنتج المرتبط بالباركود
  Future<ProductDb?> getProductByBarcode(String barcode) async {
    final query = select(products).join([
      innerJoin(
        productBarcodes,
        productBarcodes.productId.equalsExp(products.id),
      ),
    ])
      ..where(
        productBarcodes.barcode.equals(barcode) &
            productBarcodes.isActive.equals(true) &
            products.isActive.equals(true),
      );

    final row = await query.getSingleOrNull();

    return row?.readTableOrNull(products);
  }

  // جلب باركودات منتج
  Future<List<ProductBarcodeDb>> getBarcodesByProduct(
    int productId,
  ) {
    return (select(productBarcodes)
          ..where((t) => t.productId.equals(productId))
          ..orderBy([
            (t) => OrderingTerm.desc(t.isDefault),
          ]))
        .get();
  }

  // جلب الباركود الافتراضي
  Future<ProductBarcodeDb?> getDefaultBarcode(int productId) {
    return (select(productBarcodes)
          ..where(
            (t) =>
                t.productId.equals(productId) &
                t.isDefault.equals(true) &
                t.isActive.equals(true),
          ))
        .getSingleOrNull();
  }

  // مراقبة باركودات المنتج
  Stream<List<ProductBarcodeDb>> watchBarcodesByProduct(
    int productId,
  ) {
    return (select(productBarcodes)
          ..where((t) => t.productId.equals(productId)))
        .watch();
  }

  // تفعيل أو تعطيل باركود
  Future<bool> setBarcodeActive({
    required int barcodeId,
    required bool isActive,
  }) async {
    final rows = await (update(productBarcodes)
          ..where((t) => t.id.equals(barcodeId)))
        .write(
      ProductBarcodesCompanion(
        isActive: Value(isActive),
        updatedAt: Value(DateTime.now()),
      ),
    );

    return rows > 0;
  }

  // حذف باركود
  Future<int> deleteBarcode(int barcodeId) {
    return (delete(productBarcodes)
          ..where((t) => t.id.equals(barcodeId)))
        .go();
  }
}
