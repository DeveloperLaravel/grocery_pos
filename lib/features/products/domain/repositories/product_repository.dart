
import '../entities/product.dart';

abstract class ProductRepository {
  // Get all products
  Future<List<Product>> getAllProducts();

  // Watch products in real time
  Stream<List<Product>> watchAllProducts();

  // Get product by ID
  Future<Product?> getProductById(int id);

  // Get product by barcode
  Future<Product?> getProductByBarcode(String barcode);

  // Add product
  Future<int> addProduct(Product product);

  // Update product
  Future<bool> updateProduct(Product product);

  // Delete product
  Future<bool> deleteProduct(int id);
}