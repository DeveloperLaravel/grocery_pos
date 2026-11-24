
import '../models/product_model.dart';

abstract interface class ProductLocalDataSource {
  /// جلب جميع المنتجات.
  Future<List<ProductModel>> getAllProducts();

  /// مراقبة المنتجات لحظياً.
  Stream<List<ProductModel>> watchAllProducts();

  /// جلب منتج بواسطة المعرف.
  Future<ProductModel?> getProductById(int id);

  /// البحث باستخدام أي باركود فعال مرتبط بالمنتج.
  Future<ProductModel?> getProductByBarcode(String barcode);

  /// البحث بالاسم أو الباركود.
  Future<List<ProductModel>> searchProducts(String query);

  /// إنشاء منتج وإرجاع المعرف.
  Future<int> createProduct(ProductModel model);

  /// تعديل بيانات المنتج.
  Future<bool> updateProduct(ProductModel model);

  /// تعطيل المنتج.
  Future<bool> deleteProduct(int id);
}
