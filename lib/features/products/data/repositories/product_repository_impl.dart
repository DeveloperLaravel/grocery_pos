
import 'package:injectable/injectable.dart';

import '../../domain/entities/product/product.dart';
import '../../domain/entities/product/product_unit.dart';
import '../../domain/entities/product/product_barcode.dart';
import '../../domain/entities/product/product_image.dart';
import '../../domain/entities/parties/category.dart';
import '../../domain/entities/parties/brand.dart';


import '../../domain/repositories/product_repository.dart';
import '../database/product_local_data_source.dart';

import '../mapper/product/product_mapper.dart';
import '../mapper/product/product_unit_mapper.dart';
import '../mapper/product/product_barcode_mapper.dart';
import '../mapper/product/product_image_mapper.dart';

import '../mapper/parties/category_mapper.dart';
import '../mapper/parties/brand_mapper.dart';

@LazySingleton(as: ProductsRepository)
class ProductRepositoryImpl implements ProductsRepository {
  final ProductsLocalDataSource _localDataSource;

  const ProductRepositoryImpl(this._localDataSource);

  // =========================================================
  // PRODUCTS
  // =========================================================

  @override
  Future<List<Product>> getAllProducts() async {
    final models = await _localDataSource.getAllProducts();

    return models.map(ProductMapper.toEntity).toList();
  }

  @override
  Stream<List<Product>> watchAllProducts() {
    return _localDataSource.watchAllProducts().map(
      (models) => models.map(ProductMapper.toEntity).toList(),
    );
  }

  @override
  Future<Product?> getProductById(int id) async {
    final model = await _localDataSource.getProductById(id);

    if (model == null) return null;

    return ProductMapper.toEntity(model);
  }

  @override
  Stream<Product?> watchProductById(int id) {
    return _localDataSource.watchProductById(id).map(
      (model) => model == null
          ? null
          : ProductMapper.toEntity(model),
    );
  }

  @override
  Future<List<Product>> searchProducts(String query) async {
    final models = await _localDataSource.searchProducts(query);

    return models.map(ProductMapper.toEntity).toList();
  }

  @override
  Stream<List<Product>> watchProductsByCategory(int categoryId) {
    return _localDataSource.watchProductsByCategory(categoryId).map(
      (models) => models.map(ProductMapper.toEntity).toList(),
    );
  }

  @override
  Stream<List<Product>> watchProductsByBrand(int brandId) {
    return _localDataSource.watchProductsByBrand(brandId).map(
      (models) => models.map(ProductMapper.toEntity).toList(),
    );
  }

  @override
  Future<int> insertProduct(Product product) {
    final model = ProductMapper.fromEntity(product);

    return _localDataSource.insertProduct(model);
  }

  @override
  Future<int> createProductWithBaseUnit({
    required Product product,
    required String unitName,
  }) {
    final model = ProductMapper.fromEntity(product);

    return _localDataSource.createProductWithBaseUnit(
      product: model,
      unitName: unitName,
    );
  }


@override
Future<Product> updateProduct(int id, Product product) async {
  final model = ProductMapper.fromEntity(product);

  final updatedModel = await _localDataSource.updateProduct(
    id,
    model,
  );

  return ProductMapper.toEntity(updatedModel);
}


  @override
  Future<int> deleteProduct(int id) {
    return _localDataSource.deleteProduct(id);
  }

  // =========================================================
  // PRODUCT UNITS
  // =========================================================

  @override
  Future<List<ProductUnit>> getProductUnits(int productId) async {
    final models = await _localDataSource.getProductUnits(productId);

    return models.map(ProductUnitMapper.toEntity).toList();
  }

  @override
  Stream<List<ProductUnit>> watchProductUnits(int productId) {
    return _localDataSource.watchProductUnits(productId).map(
      (models) => models.map(ProductUnitMapper.toEntity).toList(),
    );
  }

  @override
  Future<ProductUnit?> getUnitById(int id) async {
    final model = await _localDataSource.getUnitById(id);

    if (model == null) return null;

    return ProductUnitMapper.toEntity(model);
  }

  @override
  Future<int> insertProductUnit(ProductUnit unit) {
    final model = ProductUnitMapper.fromEntity(unit);

    return _localDataSource.insertProductUnit(model);
  }

  @override
  Future<bool> updateProductUnit(int id, ProductUnit unit) {
    final model = ProductUnitMapper.fromEntity(unit);

    return _localDataSource.updateProductUnit(id, model);
  }

  @override
  Future<void> setBaseUnit({
    required int productId,
    required int unitId,
  }) {
    return _localDataSource.setBaseUnit(
      productId: productId,
      unitId: unitId,
    );
  }

  @override
  Future<void> setDefaultUnit({
    required int productId,
    required int unitId,
  }) {
    return _localDataSource.setDefaultUnit(
      productId: productId,
      unitId: unitId,
    );
  }

  @override
  Future<int> deleteProductUnit(int id) {
    return _localDataSource.deleteProductUnit(id);
  }

  // =========================================================
  // PRODUCT BARCODES
  // =========================================================

  @override
  Future<List<ProductBarcode>> getProductBarcodes(int productId) async {
    final models = await _localDataSource.getProductBarcodes(productId);

    return models.map(ProductBarcodeMapper.toEntity).toList();
  }

  @override
  Stream<List<ProductBarcode>> watchProductBarcodes(int productId) {
    return _localDataSource.watchProductBarcodes(productId).map(
      (models) => models.map(ProductBarcodeMapper.toEntity).toList(),
    );
  }

  @override
  Future<ProductBarcode?> getBarcode(String barcode) async {
    final model = await _localDataSource.getBarcode(barcode);

    if (model == null) return null;

    return ProductBarcodeMapper.toEntity(model);
  }

  @override
  Future<Product?> getProductByBarcode(String barcode) async {
    final model = await _localDataSource.getProductByBarcode(barcode);

    if (model == null) return null;

    return ProductMapper.toEntity(model);
  }

  @override
  Future<int> insertProductBarcode(ProductBarcode barcode) {
    final model = ProductBarcodeMapper.fromEntity(barcode);

    return _localDataSource.insertProductBarcode(model);
  }

  @override
  Future<void> setDefaultBarcode({
    required int productId,
    required int barcodeId,
  }) {
    return _localDataSource.setDefaultBarcode(
      productId: productId,
      barcodeId: barcodeId,
    );
  }

  @override
  Future<int> deleteProductBarcode(int id) {
    return _localDataSource.deleteProductBarcode(id);
  }
@override
Future<void> toggleProductBarcode({
  required int id,
  required bool isActive,
}) async {
  await _localDataSource.toggleProductBarcode(
    id: id,
    isActive: isActive,
  );
}
  // =========================================================
  // PRODUCT IMAGES
  // =========================================================

  @override
  Future<List<ProductImage>> getProductImages(int productId) async {
    final models = await _localDataSource.getProductImages(productId);

    return models.map(ProductImageMapper.toEntity).toList();
  }

  @override
  Stream<List<ProductImage>> watchProductImages(int productId) {
    return _localDataSource.watchProductImages(productId).map(
      (models) => models.map(ProductImageMapper.toEntity).toList(),
    );
  }

  @override
  Future<int> insertProductImage(ProductImage image) {
    final model = ProductImageMapper.fromEntity(image);

    return _localDataSource.insertProductImage(model);
  }

  @override
  Future<void> setPrimaryImage({
    required int productId,
    required int imageId,
  }) {
    return _localDataSource.setPrimaryImage(
      productId: productId,
      imageId: imageId,
    );
  }

  @override
  Future<int> deleteProductImage(int id) {
    return _localDataSource.deleteProductImage(id);
  }

  // =========================================================
  // CATEGORIES
  // =========================================================

  @override
  Future<List<Category>> getAllCategories() async {
    final models = await _localDataSource.getAllCategories();

    return models.map(CategoryMapper.toEntity).toList();
  }

  @override
  Stream<List<Category>> watchAllCategories() {
    return _localDataSource.watchAllCategories().map(
      (models) => models.map(CategoryMapper.toEntity).toList(),
    );
  }

  @override
  Future<List<Category>> getRootCategories() async {
    final models = await _localDataSource.getRootCategories();

    return models.map(CategoryMapper.toEntity).toList();
  }

  @override
  Future<List<Category>> getChildCategories(int parentId) async {
    final models = await _localDataSource.getChildCategories(parentId);

    return models.map(CategoryMapper.toEntity).toList();
  }

  @override
  Future<int> insertCategory(Category category) {
    final model = CategoryMapper.fromEntity(category);

    return _localDataSource.insertCategory(model);
  }

  @override
  Future<bool> updateCategory(int id, Category category) {
    final model = CategoryMapper.fromEntity(category);

    return _localDataSource.updateCategory(id, model);
  }

  @override
  Future<int> deleteCategory(int id) {
    return _localDataSource.deleteCategory(id);
  }

  // =========================================================
  // BRANDS
  // =========================================================

  @override
  Future<List<Brand>> getAllBrands() async {
    final models = await _localDataSource.getAllBrands();

    return models.map(BrandMapper.toEntity).toList();
  }

  @override
  Stream<List<Brand>> watchAllBrands() {
    return _localDataSource.watchAllBrands().map(
      (models) => models.map(BrandMapper.toEntity).toList(),
    );
  }

  @override
  Future<int> insertBrand(Brand brand) {
    final model = BrandMapper.fromEntity(brand);

    return _localDataSource.insertBrand(model);
  }

  @override
  Future<bool> updateBrand(int id, Brand brand) {
    final model = BrandMapper.fromEntity(brand);

    return _localDataSource.updateBrand(id, model);
  }

  @override
  Future<int> deleteBrand(int id) {
    return _localDataSource.deleteBrand(id);
  }
}
