
import '../../../../core/database/app_database.dart';

abstract class ProductLocalDataSource {
  // Retrieve all products
  Future<List<ProductDb>> getAllProducts();

  // Observe products in real time
  Stream<List<ProductDb>> watchAllProducts();

  // Retrieve product by ID
  Future<ProductDb?> getProductById(int id);

  // Retrieve product by barcode
  Future<ProductDb?> getProductByBarcode(String barcode);

  // Insert a new product
  Future<int> insertProduct(ProductsCompanion product);

  // Update an existing product
  Future<bool> updateProduct(
    int id,
    ProductsCompanion product,
  );

  // Delete a product
  Future<bool> deleteProduct(int id);
}
