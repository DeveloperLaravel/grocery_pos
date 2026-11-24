
import '../entities/product.dart';
import '../entities/product_unit.dart';
import '../entities/product_barcode.dart';
import '../entities/product_image.dart';

abstract interface class ProductRepository {
  // =========================================================
  // Products
  // =========================================================

  /// جلب جميع المنتجات.
  Future<List<Product>> getAllProducts();

  /// مراقبة المنتجات عند حدوث تغييرات في قاعدة البيانات.
  Stream<List<Product>> watchAllProducts();

  /// جلب منتج بواسطة المعرف.
  Future<Product?> getProductById(int id);

  /// جلب منتج بواسطة الباركود.
  Future<Product?> getProductByBarcode(String barcode);

  /// البحث في المنتجات.
  Future<List<Product>> searchProducts(String query);

  /// إضافة منتج جديد وإرجاع معرفه.
  Future<int> createProduct(Product product);

  /// تحديث بيانات منتج.
  Future<bool> updateProduct(Product product);

  /// حذف أو تعطيل منتج.
  Future<bool> deleteProduct(int id);

  // =========================================================
  // Product Units
  // =========================================================

  /// جلب وحدات منتج معين.
  Future<List<ProductUnit>> getProductUnits(int productId);

  /// إضافة وحدة جديدة للمنتج.
  Future<int> addProductUnit(ProductUnit unit);

  /// تحديث وحدة المنتج.
  Future<bool> updateProductUnit(ProductUnit unit);

  /// حذف أو تعطيل وحدة المنتج.
  Future<bool> deleteProductUnit(int id);

  /// تحديد الوحدة الافتراضية للمنتج.
  Future<void> setDefaultProductUnit({
    required int productId,
    required int unitId,
  });

  // =========================================================
  // Product Barcodes
  // =========================================================

  /// جلب جميع باركودات المنتج.
  Future<List<ProductBarcode>> getProductBarcodes(int productId);

  /// البحث عن باركود.
  Future<ProductBarcode?> getBarcode(String barcode);

  /// إضافة باركود جديد للمنتج.
  Future<int> addProductBarcode(ProductBarcode barcode);

  /// حذف باركود.
  Future<bool> deleteProductBarcode(int id);

  /// تحديد الباركود الافتراضي.
  Future<void> setDefaultBarcode(int id);

  // =========================================================
  // Product Images
  // =========================================================

  /// جلب صور المنتج.
  Future<List<ProductImage>> getProductImages(int productId);

  /// إضافة صورة للمنتج.
  Future<int> addProductImage(ProductImage image);

  /// حذف صورة.
  Future<bool> deleteProductImage(int id);

  /// تحديد الصورة الرئيسية.
  Future<void> setPrimaryImage(int id);
}
