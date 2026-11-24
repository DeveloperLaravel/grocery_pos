
import 'package:drift/drift.dart';

import '../../../../utils/barcode/internal_barcode_generator.dart';
import '../../../app_database.dart';
import '../../../tables/master_data/products/products_table.dart';
import '../../../tables/master_data/products/product_barcodes_table.dart';

part 'products_dao.g.dart';

@DriftAccessor(
  tables: [
    Products,
    ProductBarcodes,
  ],
)
class ProductsDao extends DatabaseAccessor<AppDatabase>
    with _$ProductsDaoMixin {
  ProductsDao(super.db);

  // =====================================================
  // Get All Products
  // =====================================================

  Future<List<ProductDb>> getAllProducts() {
    return (select(products)
          ..orderBy([
            (t) => OrderingTerm.desc(t.createdAt),
          ]))
        .get();
  }

  // =====================================================
  // Get Active Products
  // =====================================================

  Future<List<ProductDb>> getActiveProducts() {
    return (select(products)
          ..where((t) => t.isActive.equals(true))
          ..orderBy([
            (t) => OrderingTerm.desc(t.createdAt),
          ]))
        .get();
  }

  // =====================================================
  // Watch All Products
  // =====================================================

  Stream<List<ProductDb>> watchAllProducts() {
    return (select(products)
          ..orderBy([
            (t) => OrderingTerm.desc(t.createdAt),
          ]))
        .watch();
  }

  // =====================================================
  // Watch Active Products
  // =====================================================

  Stream<List<ProductDb>> watchActiveProducts() {
    return (select(products)
          ..where((t) => t.isActive.equals(true))
          ..orderBy([
            (t) => OrderingTerm.desc(t.createdAt),
          ]))
        .watch();
  }

  // =====================================================
  // Get Product By ID
  // =====================================================

  Future<ProductDb?> getProductById(int id) {
    return (select(products)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  // =====================================================
  // Add Product
  // =====================================================

  /// إضافة منتج مع إنشاء باركود داخلي تلقائياً.
  ///
  /// يتم حفظ المنتج والباركود داخل transaction واحدة.
  Future<int> addProduct(ProductsCompanion entry) {
    return addProductWithInternalBarcode(entry);
  }

  // =====================================================
  // Add Product With Internal Barcode
  // =====================================================

  /// إضافة منتج مع إجبار النظام على إنشاء باركود داخلي.
  Future<int> addProductWithInternalBarcode(
    ProductsCompanion entry,
  ) async {
    final barcode = InternalBarcodeGenerator.generate().trim();

    if (barcode.isEmpty) {
      throw StateError('الباركود الداخلي الناتج غير صالح.');
    }

    return _insertProductWithBarcode(
      entry: entry,
      barcode: barcode,
      barcodeType: 'internal',
    );
  }

  // =====================================================
  // Add Product With External Barcode
  // =====================================================

  /// إضافة منتج باستخدام باركود خارجي.
  Future<int> addProductWithExternalBarcode({
    required ProductsCompanion entry,
    required String barcode,
  }) async {
    final value = barcode.trim();

    if (value.isEmpty) {
      throw ArgumentError('يجب إدخال باركود صحيح.');
    }

    return _insertProductWithBarcode(
      entry: entry,
      barcode: value,
      barcodeType: 'external',
    );
  }

  // =====================================================
  // Private Insert Product With Barcode
  // =====================================================

  Future<int> _insertProductWithBarcode({
    required ProductsCompanion entry,
    required String barcode,
    required String barcodeType,
  }) async {
    final value = barcode.trim();

    if (value.isEmpty) {
      throw ArgumentError('الباركود غير صالح.');
    }

    return attachedDatabase.transaction(() async {
      // 1. التحقق من عدم استخدام الباركود.
      await _ensureBarcodeAvailable(value);

      // 2. إضافة المنتج.
      final productId = await into(products).insert(entry);

      // 3. إضافة الباركود الافتراضي.
      await into(productBarcodes).insert(
        ProductBarcodesCompanion.insert(
          productId: productId,
          barcode: value,
          barcodeType: Value(barcodeType),
          isDefault: const Value(true),
        ),
      );

      return productId;
    });
  }

  // =====================================================
  // Ensure Barcode Available
  // =====================================================

  Future<void> _ensureBarcodeAvailable(String barcode) async {
    final existingBarcode = await (select(productBarcodes)
          ..where(
            (t) => t.barcode.equals(barcode),
          ))
        .getSingleOrNull();

    if (existingBarcode != null) {
      throw StateError('هذا الباركود مسجل مسبقاً.');
    }
  }

  // =====================================================
  // Get Product By Barcode
  // =====================================================

  /// البحث عن المنتج باستخدام أي باركود نشط تابع له.
  Future<ProductDb?> getProductByBarcode(String barcode) async {
    final value = barcode.trim();

    if (value.isEmpty) return null;

    final query = select(products).join([
      innerJoin(
        productBarcodes,
        productBarcodes.productId.equalsExp(products.id),
      ),
    ])
      ..where(
        productBarcodes.barcode.equals(value) &
            productBarcodes.isActive.equals(true) &
            products.isActive.equals(true),
      );

    final row = await query.getSingleOrNull();

    return row?.readTableOrNull(products);
  }

  // =====================================================
  // Search Products
  // =====================================================

  /// البحث بالاسم.
  ///
  /// البحث بالباركود يتم عبر getProductByBarcode.
  Future<List<ProductDb>> searchProducts(String query) {
    final value = query.trim();

    if (value.isEmpty) {
      return getAllProducts();
    }

    return (select(products)
          ..where(
            (t) =>
                t.name.contains(value) &
                t.isActive.equals(true),
          )
          ..orderBy([
            (t) => OrderingTerm.desc(t.createdAt),
          ]))
        .get();
  }

  // =====================================================
  // Update Product
  // =====================================================

  /// تعديل بيانات المنتج فقط.
  ///
  /// لا يتم تعديل الباركود من هذا DAO.
  Future<bool> updateProductById(
    int id,
    ProductsCompanion entry,
  ) async {
    final rows = await (update(products)
          ..where((t) => t.id.equals(id)))
        .write(
      entry.copyWith(
        updatedAt: Value(DateTime.now()),
      ),
    );

    return rows > 0;
  }

  // =====================================================
  // Set Product Active
  // =====================================================

  Future<bool> setProductActive({
    required int id,
    required bool isActive,
  }) async {
    final rows = await (update(products)
          ..where((t) => t.id.equals(id)))
        .write(
      ProductsCompanion(
        isActive: Value(isActive),
        updatedAt: Value(DateTime.now()),
      ),
    );

    return rows > 0;
  }

  // =====================================================
  // Delete Product
  // =====================================================

  /// الحذف الفعلي.
  ///
  /// انتبه: قد يؤدي إلى حذف الباركودات التابعة بسبب CASCADE.
  Future<bool> deleteProduct(int id) async {
    final rows = await (delete(products)
          ..where((t) => t.id.equals(id)))
        .go();

    return rows > 0;
  }
}