
import 'package:injectable/injectable.dart';

import '../../../../../core/database/daos/master_data/products/products_dao.dart';


import '../mapper/parties/brand_mapper.dart';
import '../mapper/parties/category_mapper.dart';
import '../mapper/product/product_barcode_mapper.dart';
import '../mapper/product/product_image_mapper.dart';
import '../mapper/product/product_mapper.dart';
import '../mapper/product/product_unit_mapper.dart';
import '../models/parties/brand_model.dart';
import '../models/parties/category_model.dart';
import '../models/product/product_barcode_model.dart';
import '../models/product/product_image_model.dart';
import '../models/product/product_model.dart';
import '../models/product/product_unit_model.dart';
import 'product_local_data_source.dart';

@LazySingleton(as: ProductsLocalDataSource)
class ProductsLocalDataSourceImpl
    implements ProductsLocalDataSource {
  final ProductsDao _dao;

  const ProductsLocalDataSourceImpl(this._dao);

  // =========================================================
  // PRODUCTS
  // =========================================================

  @override
  Future<List<ProductModel>> getAllProducts() async {
    final result = await _dao.getAllProducts();

    return result.map(ProductMapper.fromDb).toList();
  }

  @override
  Stream<List<ProductModel>> watchAllProducts() {
    return _dao.watchAllProducts().map(
      (products) => products.map(ProductMapper.fromDb).toList(),
    );
  }

  @override
  Future<ProductModel?> getProductById(int id) async {
    final result = await _dao.getProductById(id);

    if (result == null) return null;

    return ProductMapper.fromDb(result);
  }

  @override
  Stream<ProductModel?> watchProductById(int id) {
    return _dao.watchProductById(id).map(
      (product) => product == null
          ? null
          : ProductMapper.fromDb(product),
    );
  }

  @override
  Future<List<ProductModel>> searchProducts(String query) async {
    final normalizedQuery = query.trim();

    if (normalizedQuery.isEmpty) {
      return getAllProducts();
    }

    final result = await _dao.searchProducts(normalizedQuery);

    return result.map(ProductMapper.fromDb).toList();
  }

  @override
  Stream<List<ProductModel>> watchProductsByCategory(
    int categoryId,
  ) {
    return _dao.watchProductsByCategory(categoryId).map(
      (products) => products.map(ProductMapper.fromDb).toList(),
    );
  }

  @override
  Stream<List<ProductModel>> watchProductsByBrand(
    int brandId,
  ) {
    return _dao.watchProductsByBrand(brandId).map(
      (products) => products.map(ProductMapper.fromDb).toList(),
    );
  }

  @override
  Future<int> insertProduct(ProductModel model) {
    final companion = ProductMapper.toCompanion(
      ProductMapper.toEntity(model),
    );

    return _dao.insertProduct(companion);
  }

  @override
  Future<int> createProductWithBaseUnit({
    required ProductModel product,
    required String unitName,
  }) {
    final companion = ProductMapper.toCompanion(
      ProductMapper.toEntity(product),
    );

    return _dao.createProductWithBaseUnit(
      product: companion,
      unitName: unitName,
    );
  }

  @override
@override
Future<ProductModel> updateProduct(
  int id,
  ProductModel model,
) async {
  final entity = ProductMapper.toEntity(model);

  final companion = ProductMapper.toCompanion(entity);

  final updatedProduct = await _dao.updateProduct(
    id,
    companion,
  );

  return ProductMapper.fromDb(updatedProduct);
}
  @override
  Future<int> deleteProduct(int id) {
    return _dao.deleteProduct(id);
  }

  // =========================================================
  // PRODUCT UNITS
  // =========================================================

  @override
  Future<List<ProductUnitModel>> getProductUnits(
    int productId,
  ) async {
    final result = await _dao.getProductUnits(productId);

    return result.map(ProductUnitMapper.fromDb).toList();
  }

  @override
  Stream<List<ProductUnitModel>> watchProductUnits(
    int productId,
  ) {
    return _dao.watchProductUnits(productId).map(
      (units) => units.map(ProductUnitMapper.fromDb).toList(),
    );
  }

  @override
  Future<ProductUnitModel?> getUnitById(int id) async {
    final result = await _dao.getUnitById(id);

    if (result == null) return null;

    return ProductUnitMapper.fromDb(result);
  }

  @override
  Future<int> insertProductUnit(ProductUnitModel model) {
    final companion = ProductUnitMapper.toCompanion(model);

    return _dao.insertProductUnit(companion);
  }

  @override
  Future<bool> updateProductUnit(
    int id,
    ProductUnitModel model,
  ) {
    final companion = ProductUnitMapper.toCompanion(model);

    return _dao.updateProductUnit(id, companion);
  }

  @override
  Future<void> setBaseUnit({
    required int productId,
    required int unitId,
  }) {
    return _dao.setBaseUnit(
      productId: productId,
      unitId: unitId,
    );
  }

  @override
  Future<void> setDefaultUnit({
    required int productId,
    required int unitId,
  }) {
    return _dao.setDefaultUnit(
      productId: productId,
      unitId: unitId,
    );
  }

  @override
  Future<int> deleteProductUnit(int id) {
    return _dao.deleteProductUnit(id);
  }

  // =========================================================
  // PRODUCT BARCODES
  // =========================================================

  @override
  Future<List<ProductBarcodeModel>> getProductBarcodes(
    int productId,
  ) async {
    final result = await _dao.getProductBarcodes(productId);

    return result.map(ProductBarcodeMapper.fromDb).toList();
  }

  @override
  Stream<List<ProductBarcodeModel>> watchProductBarcodes(
    int productId,
  ) {
    return _dao.watchProductBarcodes(productId).map(
      (barcodes) =>
          barcodes.map(ProductBarcodeMapper.fromDb).toList(),
    );
  }

  @override
  Future<ProductBarcodeModel?> getBarcode(String barcode) async {
    final result = await _dao.getBarcode(barcode.trim());

    if (result == null) return null;

    return ProductBarcodeMapper.fromDb(result);
  }

  @override
  Future<ProductModel?> getProductByBarcode(String barcode) async {
    final result = await _dao.getProductByBarcode(barcode.trim());

    if (result == null) return null;

    return ProductMapper.fromDb(result);
  }

  @override
  Future<int> insertProductBarcode(ProductBarcodeModel model) {
    final companion = ProductBarcodeMapper.toCompanion(model);

    return _dao.insertProductBarcode(companion);
  }

  @override
  Future<void> setDefaultBarcode({
    required int productId,
    required int barcodeId,
  }) {
    return _dao.setDefaultBarcode(
      productId: productId,
      barcodeId: barcodeId,
    );
  }

  @override
  Future<int> deleteProductBarcode(int id) {
    return _dao.deleteProductBarcode(id);
  }

@override
Future<void> toggleProductBarcode({
  required int id,
  required bool isActive,
}) async {
  await _dao.toggleProductBarcode(
    id: id,
    isActive: isActive,
  );
}
  // =========================================================
  // PRODUCT IMAGES
  // =========================================================

  @override
  Future<List<ProductImageModel>> getProductImages(
    int productId,
  ) async {
    final result = await _dao.getProductImages(productId);

    return result.map(ProductImageMapper.fromDb).toList();
  }

  @override
  Stream<List<ProductImageModel>> watchProductImages(
    int productId,
  ) {
    return _dao.watchProductImages(productId).map(
      (images) => images.map(ProductImageMapper.fromDb).toList(),
    );
  }

  @override
  Future<int> insertProductImage(ProductImageModel model) {
    final companion = ProductImageMapper.toCompanion(model);

    return _dao.insertProductImage(companion);
  }

  @override
  Future<void> setPrimaryImage({
    required int productId,
    required int imageId,
  }) {
    return _dao.setPrimaryImage(
      productId: productId,
      imageId: imageId,
    );
  }

  @override
  Future<int> deleteProductImage(int id) {
    return _dao.deleteProductImage(id);
  }

  // =========================================================
  // CATEGORIES
  // =========================================================

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    final result = await _dao.getAllCategories();

    return result.map(CategoryMapper.fromDb).toList();
  }

  @override
  Stream<List<CategoryModel>> watchAllCategories() {
    return _dao.watchAllCategories().map(
      (categories) =>
          categories.map(CategoryMapper.fromDb).toList(),
    );
  }

  @override
  Future<List<CategoryModel>> getRootCategories() async {
    final result = await _dao.getRootCategories();

    return result.map(CategoryMapper.fromDb).toList();
  }

  @override
  Future<List<CategoryModel>> getChildCategories(int parentId) async {
    final result = await _dao.getChildCategories(parentId);

    return result.map(CategoryMapper.fromDb).toList();
  }

  @override
  Future<int> insertCategory(CategoryModel model) {
    final companion = CategoryMapper.toCompanion(model);

    return _dao.insertCategory(companion);
  }

  @override
  Future<bool> updateCategory(
    int id,
    CategoryModel model,
  ) {
    final companion = CategoryMapper.toCompanion(model);

    return _dao.updateCategory(id, companion);
  }

  @override
  Future<int> deleteCategory(int id) {
    return _dao.deleteCategory(id);
  }

  // =========================================================
  // BRANDS
  // =========================================================

  @override
  Future<List<BrandModel>> getAllBrands() async {
    final result = await _dao.getAllBrands();

    return result.map(BrandMapper.fromDb).toList();
  }

  @override
  Stream<List<BrandModel>> watchAllBrands() {
    return _dao.watchAllBrands().map(
      (brands) => brands.map(BrandMapper.fromDb).toList(),
    );
  }

  @override
  Future<int> insertBrand(BrandModel model) {
    final companion = BrandMapper.toCompanion(model);

    return _dao.insertBrand(companion);
  }

  @override
  Future<bool> updateBrand(
    int id,
    BrandModel model,
  ) {
    final companion = BrandMapper.toCompanion(model);

    return _dao.updateBrand(id, companion);
  }

  @override
  Future<int> deleteBrand(int id) {
    return _dao.deleteBrand(id);
  }
}
