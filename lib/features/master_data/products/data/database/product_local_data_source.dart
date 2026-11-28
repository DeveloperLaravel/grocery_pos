
import '../models/parties/brand_model.dart';
import '../models/parties/category_model.dart';
import '../models/product/product_barcode_model.dart';
import '../models/product/product_image_model.dart';
import '../models/product/product_model.dart';
import '../models/product/product_unit_model.dart';

abstract class ProductsLocalDataSource {
  // =========================================================
  // PRODUCTS
  // =========================================================

  Future<List<ProductModel>> getAllProducts();

  Stream<List<ProductModel>> watchAllProducts();

  Future<ProductModel?> getProductById(int id);

  Stream<ProductModel?> watchProductById(int id);

  Future<List<ProductModel>> searchProducts(String query);

  Stream<List<ProductModel>> watchProductsByCategory(int categoryId);

  Stream<List<ProductModel>> watchProductsByBrand(int brandId);

  Future<int> insertProduct(ProductModel model);

  Future<int> createProductWithBaseUnit({
    required ProductModel product,
    required String unitName,
  });

  Future<ProductModel> updateProduct(
    int id,
    ProductModel model,
  );

  Future<int> deleteProduct(int id);

  // =========================================================
  // PRODUCT UNITS
  // =========================================================

  Future<List<ProductUnitModel>> getProductUnits(int productId);

  Stream<List<ProductUnitModel>> watchProductUnits(int productId);

  Future<ProductUnitModel?> getUnitById(int id);

  Future<int> insertProductUnit(ProductUnitModel model);

  Future<bool> updateProductUnit(
    int id,
    ProductUnitModel model,
  );

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

  Future<List<ProductBarcodeModel>> getProductBarcodes(
    int productId,
  );

  Stream<List<ProductBarcodeModel>> watchProductBarcodes(
    int productId,
  );

  Future<ProductBarcodeModel?> getBarcode(String barcode);

  Future<ProductModel?> getProductByBarcode(String barcode);

  Future<int> insertProductBarcode(ProductBarcodeModel model);

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

  Future<List<ProductImageModel>> getProductImages(int productId);

  Stream<List<ProductImageModel>> watchProductImages(int productId);

  Future<int> insertProductImage(ProductImageModel model);

  Future<void> setPrimaryImage({
    required int productId,
    required int imageId,
  });

  Future<int> deleteProductImage(int id);

  // =========================================================
  // CATEGORIES
  // =========================================================

  Future<List<CategoryModel>> getAllCategories();

  Stream<List<CategoryModel>> watchAllCategories();

  Future<List<CategoryModel>> getRootCategories();

  Future<List<CategoryModel>> getChildCategories(int parentId);

  Future<int> insertCategory(CategoryModel model);

  Future<bool> updateCategory(
    int id,
    CategoryModel model,
  );

  Future<int> deleteCategory(int id);

  // =========================================================
  // BRANDS
  // =========================================================

  Future<List<BrandModel>> getAllBrands();

  Stream<List<BrandModel>> watchAllBrands();

  Future<int> insertBrand(BrandModel model);

  Future<bool> updateBrand(
    int id,
    BrandModel model,
  );

  Future<int> deleteBrand(int id);
}
