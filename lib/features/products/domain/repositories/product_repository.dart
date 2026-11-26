
import '../entities/product/product.dart';
import '../entities/product/product_unit.dart';
import '../entities/product/product_barcode.dart';
import '../entities/product/product_image.dart';
import '../entities/parties/category.dart';
import '../entities/parties/brand.dart';

abstract class ProductsRepository {
  // =========================================================
  // PRODUCTS
  // =========================================================

  Future<List<Product>> getAllProducts();

  Stream<List<Product>> watchAllProducts();

  Future<Product?> getProductById(int id);

  Stream<Product?> watchProductById(int id);

  Future<List<Product>> searchProducts(String query);

  Stream<List<Product>> watchProductsByCategory(int categoryId);

  Stream<List<Product>> watchProductsByBrand(int brandId);

  Future<int> insertProduct(Product product);

  Future<int> createProductWithBaseUnit({
    required Product product,
    required String unitName,
  });

  Future<Product> updateProduct(int id, Product product);

  Future<int> deleteProduct(int id);

  // =========================================================
  // PRODUCT UNITS
  // =========================================================

  Future<List<ProductUnit>> getProductUnits(int productId);

  Stream<List<ProductUnit>> watchProductUnits(int productId);

  Future<ProductUnit?> getUnitById(int id);

  Future<int> insertProductUnit(ProductUnit unit);

  Future<bool> updateProductUnit(int id, ProductUnit unit);

  Future<void> setBaseUnit({
    required int productId,
    required int unitId,
  });

  Future<void> setDefaultUnit({
    required int productId,
    required int unitId,
  });

  Future<int> deleteProductUnit(int id);

  // =========================================================
  // PRODUCT BARCODES
  // =========================================================

  Future<List<ProductBarcode>> getProductBarcodes(int productId);

  Stream<List<ProductBarcode>> watchProductBarcodes(int productId);

  Future<ProductBarcode?> getBarcode(String barcode);

  Future<Product?> getProductByBarcode(String barcode);

  Future<int> insertProductBarcode(ProductBarcode barcode);

  Future<void> setDefaultBarcode({
    required int productId,
    required int barcodeId,
  });
  Future<void> toggleProductBarcode({
  required int id,
  required bool isActive,
});

  Future<int> deleteProductBarcode(int id);

  // =========================================================
  // PRODUCT IMAGES
  // =========================================================

  Future<List<ProductImage>> getProductImages(int productId);

  Stream<List<ProductImage>> watchProductImages(int productId);

  Future<int> insertProductImage(ProductImage image);

  Future<void> setPrimaryImage({
    required int productId,
    required int imageId,
  });

  Future<int> deleteProductImage(int id);

  // =========================================================
  // CATEGORIES
  // =========================================================

  Future<List<Category>> getAllCategories();

  Stream<List<Category>> watchAllCategories();

  Future<List<Category>> getRootCategories();

  Future<List<Category>> getChildCategories(int parentId);

  Future<int> insertCategory(Category category);

  Future<bool> updateCategory(int id, Category category);

  Future<int> deleteCategory(int id);

  // =========================================================
  // BRANDS
  // =========================================================

  Future<List<Brand>> getAllBrands();

  Stream<List<Brand>> watchAllBrands();

  Future<int> insertBrand(Brand brand);

  Future<bool> updateBrand(int id, Brand brand);

  Future<int> deleteBrand(int id);
}
