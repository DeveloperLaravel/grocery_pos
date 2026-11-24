
import 'package:injectable/injectable.dart';


import '../../../../core/database/daos/master_data/products/product_barcodes_dao.dart';
import '../../../../core/database/daos/master_data/products/products_dao.dart';
import '../mapper/product_mapper.dart';
import '../models/product_model.dart';
import 'product_local_data_source.dart';

@LazySingleton(as: ProductLocalDataSource)
class ProductLocalDataSourceImpl
    implements ProductLocalDataSource {
  final ProductsDao productsDao;
  final ProductBarcodesDao barcodesDao;

  ProductLocalDataSourceImpl({
    required this.productsDao,
    required this.barcodesDao,
  });

  // ==========================================
  // Get All Products
  // ==========================================

  @override
  Future<List<ProductModel>> getAllProducts() async {
    final rows = await productsDao.getAllProducts();

    return rows.map(ProductMapper.fromDb).toList();
  }

  // ==========================================
  // Watch All Products
  // ==========================================

  @override
  Stream<List<ProductModel>> watchAllProducts() {
    return productsDao.watchAllProducts().map(
      (rows) => rows.map(ProductMapper.fromDb).toList(),
    );
  }

  // ==========================================
  // Get Product By ID
  // ==========================================

  @override
  Future<ProductModel?> getProductById(int id) async {
    if (id <= 0) {
      return null;
    }

    final row = await productsDao.getProductById(id);

    if (row == null) {
      return null;
    }

    return ProductMapper.fromDb(row);
  }

  // ==========================================
  // Get Product By Barcode
  // ==========================================

  @override
  Future<ProductModel?> getProductByBarcode(
    String barcode,
  ) async {
    final value = barcode.trim();

    if (value.isEmpty) {
      return null;
    }

    final barcodeRow = await barcodesDao.getByBarcode(value);

    if (barcodeRow == null || !barcodeRow.isActive) {
      return null;
    }

    final productRow = await productsDao.getProductById(
      barcodeRow.productId,
    );

    if (productRow == null || !productRow.isActive) {
      return null;
    }

    return ProductMapper.fromDb(productRow);
  }

  // ==========================================
  // Search Products
  // ==========================================

  @override
  Future<List<ProductModel>> searchProducts(
    String query,
  ) async {
    final rows = await productsDao.searchProducts(query);

    return rows.map(ProductMapper.fromDb).toList();
  }

  // ==========================================
  // Create Product
  // ==========================================

  @override
  Future<int> createProduct(ProductModel model) {
    return productsDao.addProduct(
      ProductMapper.toCreateCompanionFromModel(model),
    );
  }

  // ==========================================
  // Update Product
  // ==========================================

  @override
  Future<bool> updateProduct(ProductModel model) {
    if (model.id <= 0) {
      throw ArgumentError(
        'معرف المنتج غير صالح.',
      );
    }

    return productsDao.updateProductById(
      model.id,
      ProductMapper.toUpdateCompanionFromModel(model),
    );
  }

  // ==========================================
  // Delete Product
  // ==========================================

  @override
  Future<bool> deleteProduct(int id) {
    if (id <= 0) {
      throw ArgumentError(
        'معرف المنتج غير صالح.',
      );
    }

    return productsDao.deleteProduct(id);
  }
}
