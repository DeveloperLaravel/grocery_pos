

import '../../../../core/database/app_database.dart';
import '../models/checkout_item_model.dart';

abstract interface class PosLocalDataSource {
  // Products

  Future<List<ProductDb>> getProducts({
    String query = '',
  });

  Future<ProductDb?> getProductByBarcode(String barcode);

  Future<ProductDb?> getProductById(int id);

  Future<int> addProduct(ProductsCompanion product);

  Future<bool> updateProduct({
    required int id,
    required ProductsCompanion product,
  });

  Future<bool> deleteProduct(int id);

  // Stock

  Future<void> adjustStock({
    required int productId,
    required double delta,
    required String note,
  });

  // Sales

  Future<int> checkout({
    required List<CheckoutItemModel> items,
    required double discount,
    required double paid,
    required String paymentMethod,
  });

  Future<SaleDb?> getSaleById(int saleId);

  Future<List<SaleItemDb>> getSaleItems(int saleId);

  // Returns

  Future<void> returnSaleItem({
    required int saleId,
    required int productId,
    required double quantity,
    required double refundAmount,
  });
}
