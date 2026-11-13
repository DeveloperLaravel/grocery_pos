
import 'package:injectable/injectable.dart';

import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';

import '../database/product_local_data_source.dart';
import '../mapper/product_mapper.dart';
import '../models/product_model.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final ProductLocalDataSource _localDataSource;

  ProductRepositoryImpl(this._localDataSource);

  // Get all products
  @override
  Future<List<Product>> getAllProducts() async {
    final products = await _localDataSource.getAllProducts();

    return products
        .map((product) => ProductModel.fromDb(product).toEntity())
        .toList();
  }

  // Watch products in real time
  @override
  Stream<List<Product>> watchAllProducts() {
    return _localDataSource.watchAllProducts().map(
      (products) => products
          .map((product) => ProductModel.fromDb(product).toEntity())
          .toList(),
    );
  }

  // Get product by ID
  @override
  Future<Product?> getProductById(int id) async {
    final product = await _localDataSource.getProductById(id);

    if (product == null) return null;

    return ProductModel.fromDb(product).toEntity();
  }

  // Get product by barcode
  @override
  Future<Product?> getProductByBarcode(String barcode) async {
    final product = await _localDataSource.getProductByBarcode(barcode);

    if (product == null) return null;

    return ProductModel.fromDb(product).toEntity();
  }

  // Add product
  @override
  Future<int> addProduct(Product product) async {
    final model = product.toModel();

    final companion = model.toInsertCompanion();

    return _localDataSource.insertProduct(companion);
  }

  // Update product
  @override
  Future<bool> updateProduct(Product product) async {
    final id = product.id;

    if (id == null || id <= 0) {
      throw ArgumentError(
        'لا يمكن تحديث منتج بدون معرف صالح.',
      );
    }

    final model = product.toModel();

    final companion = model.toUpdateCompanion();

    return _localDataSource.updateProduct(
      id,
      companion,
    );
  }

  // Delete product
  @override
  Future<bool> deleteProduct(int id) {
    if (id <= 0) {
      return Future.value(false);
    }

    return _localDataSource.deleteProduct(id);
  }
}