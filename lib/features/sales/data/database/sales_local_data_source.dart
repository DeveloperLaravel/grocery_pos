import '../../domain/entities/cart_item.dart';
import '../models/sale_model.dart';

abstract class SalesLocalDataSource {
  Future<SaleModel> createSale({
    required List<CartItem> items,
    required double discount,
    required double paidAmount,
    required String paymentMethod,
  });

  Future<List<SaleModel>> getSales({
    int limit = 100,
  });
  Future<SaleModel?> getSaleDetails(int saleId);
 Future<bool> cancelSale(int saleId);
  Stream<List<SaleModel>> watchSales({
    int limit = 100,
  });
}