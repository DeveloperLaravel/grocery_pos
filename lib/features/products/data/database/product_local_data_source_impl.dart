
import 'package:injectable/injectable.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/database/daos/products_dao.dart';

import 'product_local_data_source.dart';

@LazySingleton(as: ProductLocalDataSource)
class ProductLocalDataSourceImpl
    implements ProductLocalDataSource {
  final ProductsDao _productsDao;

  ProductLocalDataSourceImpl(
    this._productsDao,
  );

  // Get all products
  @override
  Future<List<ProductDb>> getAllProducts() {
    return _productsDao.getAllProducts();
  }

  // Watch products in real time
  @override
  Stream<List<ProductDb>> watchAllProducts() {
    return _productsDao.watchAllProducts();
  }

  // Get product by ID
  @override
  Future<ProductDb?> getProductById(int id) {
    return _productsDao.getProductById(id);
  }

  // Get product by barcode
  @override
  Future<ProductDb?> getProductByBarcode(String barcode) {
    return _productsDao.findProductByBarcode(barcode);
  }

  // Insert product
  @override
  Future<int> insertProduct(
    ProductsCompanion product,
  ) {
    return _productsDao.insertProduct(product);
  }

  // Update product
  @override
  Future<bool> updateProduct(
    int id,
    ProductsCompanion product,
  ) {
    return _productsDao.updateProduct(id, product);
  }

  // Delete product
  @override
  Future<bool> deleteProduct(int id) {
    return _productsDao.deleteProductById(id);
  }
}
