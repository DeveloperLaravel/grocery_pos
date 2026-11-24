
import 'package:injectable/injectable.dart';

import '../../domain/entities/product.dart';
import '../../domain/entities/product_unit.dart';
import '../../domain/entities/product_barcode.dart';
import '../../domain/entities/product_image.dart';

import '../../domain/repositories/product_repository.dart';

import '../database/product_local_data_source.dart';
import '../database/product_units_local_data_source.dart';
import '../database/product_barcodes_local_data_source.dart';
import '../database/product_images_local_data_source.dart';

import '../mapper/product_mapper.dart';
import '../mapper/product_unit_mapper.dart';
import '../mapper/product_barcode_mapper.dart';
import '../mapper/product_image_mapper.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final ProductLocalDataSource productDataSource;
  final ProductUnitsLocalDataSource unitsDataSource;
  final ProductBarcodesLocalDataSource barcodesDataSource;
  final ProductImagesLocalDataSource imagesDataSource;

  ProductRepositoryImpl({
    required this.productDataSource,
    required this.unitsDataSource,
    required this.barcodesDataSource,
    required this.imagesDataSource,
  });

  // =========================================================
  // Products
  // =========================================================

  @override
  Future<List<Product>> getAllProducts() async {
    final models = await productDataSource.getAllProducts();

    return models
        .map(ProductMapper.toEntity)
        .toList(growable: false);
  }

  @override
  Stream<List<Product>> watchAllProducts() {
    return productDataSource.watchAllProducts().map(
      (models) => models
          .map(ProductMapper.toEntity)
          .toList(growable: false),
    );
  }

  @override
  Future<Product?> getProductById(int id) async {
    final model = await productDataSource.getProductById(id);

    if (model == null) return null;

    return ProductMapper.toEntity(model);
  }

  @override
  Future<Product?> getProductByBarcode(String barcode) async {
    final value = barcode.trim();

    if (value.isEmpty) return null;

    final model = await productDataSource.getProductByBarcode(value);

    if (model == null) return null;

    return ProductMapper.toEntity(model);
  }

  @override
  Future<List<Product>> searchProducts(String query) async {
    final models = await productDataSource.searchProducts(query);

    return models
        .map(ProductMapper.toEntity)
        .toList(growable: false);
  }

  @override
  Future<int> createProduct(Product product) {
    final model = ProductMapper.fromEntity(product);

    return productDataSource.createProduct(model);
  }

  @override
  Future<bool> updateProduct(Product product) {
    final model = ProductMapper.fromEntity(product);

    return productDataSource.updateProduct(model);
  }

  @override
  Future<bool> deleteProduct(int id) {
    return productDataSource.deleteProduct(id);
  }

  // =========================================================
  // Product Units
  // =========================================================

  @override
  Future<List<ProductUnit>> getProductUnits(int productId) async {
    final models = await unitsDataSource.getByProductId(productId);

    return models
        .map(ProductUnitMapper.toEntity)
        .toList(growable: false);
  }

  @override
  Future<int> addProductUnit(ProductUnit unit) {
    return unitsDataSource.addUnit(
      productId: unit.productId,
      unitName: unit.unitName,
      unitSymbol: unit.unitSymbol,
      conversionFactor: unit.conversionFactor,
      salePrice: unit.salePrice,
      purchasePrice: unit.purchasePrice,
      isBaseUnit: unit.isBaseUnit,
      isDefault: unit.isDefault,
      sortOrder: unit.sortOrder,
    );
  }

  @override
  Future<bool> updateProductUnit(ProductUnit unit) {
    return unitsDataSource.updateUnit(
      id: unit.id,
      unitName: unit.unitName,
      unitSymbol: unit.unitSymbol,
      conversionFactor: unit.conversionFactor,
      salePrice: unit.salePrice,
      purchasePrice: unit.purchasePrice,
      isActive: unit.isActive,
      sortOrder: unit.sortOrder,
    );
  }

  @override
  Future<bool> deleteProductUnit(int id) async {
    // deactivateUnit يرجع عدد الصفوف التي تم تعديلها.
    // نحول النتيجة إلى bool حسب عقد ProductRepository.
    final affectedRows = await unitsDataSource.deactivateUnit(id);

    return affectedRows > 0;
  }

  @override
  Future<void> setDefaultProductUnit({
    required int productId,
    required int unitId,
  }) async {
    await unitsDataSource.setDefaultUnit(
      productId: productId,
      unitId: unitId,
    );
  }

  // =========================================================
  // Product Barcodes
  // =========================================================

  @override
  Future<List<ProductBarcode>> getProductBarcodes(
    int productId,
  ) async {
    final models = await barcodesDataSource.getByProductId(productId);

    return models
        .map(ProductBarcodeMapper.toEntity)
        .toList(growable: false);
  }

  @override
  Future<ProductBarcode?> getBarcode(String barcode) async {
    final value = barcode.trim();

    if (value.isEmpty) return null;

    final model = await barcodesDataSource.getByBarcode(value);

    if (model == null) return null;

    return ProductBarcodeMapper.toEntity(model);
  }

  @override
  Future<int> addProductBarcode(ProductBarcode barcode) {
    return barcodesDataSource.addBarcode(
      productId: barcode.productId,
      productUnitId: barcode.productUnitId,
      barcode: barcode.barcode,
      barcodeType: barcode.barcodeType,
      isDefault: barcode.isDefault,
      source: barcode.source,
    );
  }

  @override
  Future<bool> deleteProductBarcode(int id) async {
    // DAO يرجع عدد الصفوف المتأثرة.
    final affectedRows = await barcodesDataSource.deleteBarcode(id);

    return affectedRows > 0;
  }

  @override
  Future<void> setDefaultBarcode(int id) {
    return barcodesDataSource.setDefaultBarcode(id);
  }

  // =========================================================
  // Product Images
  // =========================================================

  @override
  Future<List<ProductImage>> getProductImages(int productId) async {
    final models = await imagesDataSource.getByProductId(productId);

    return models
        .map(ProductImageMapper.toEntity)
        .toList(growable: false);
  }

  @override
  Future<int> addProductImage(ProductImage image) {
    return imagesDataSource.addImage(
      productId: image.productId,
      imagePath: image.imagePath,
      imageName: image.imageName,
      isPrimary: image.isPrimary,
      sortOrder: image.sortOrder,
    );
  }

  @override
  Future<bool> deleteProductImage(int id) {
    return imagesDataSource.deleteImage(id);
  }

  @override
  Future<void> setPrimaryImage(int id) async {
    // نحتاج productId أيضاً، لذلك نجلب الصورة أولاً.
    final images = await imagesDataSource.getByProductId(
      // لا يمكن تحديد productId من id وحده دون استعلام إضافي.
      // استخدم الدالة التي تجلب الصورة بالمعرف في مصدر البيانات.
      throw UnimplementedError(
        'أضف getById إلى ProductImagesLocalDataSource',
      ),
    );
  }
}
