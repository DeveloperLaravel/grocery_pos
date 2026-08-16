import 'package:fpdart/fpdart.dart';
import 'package:grocery_pos/core/error/failure.dart';
import 'package:grocery_pos/features/pos/domain/cart_item.dart';
import 'package:grocery_pos/features/pos/domain/sale_receipt.dart';
import 'package:grocery_pos/features/products/domain/product_entity.dart';

abstract interface class PosRepository {
  TaskEither<Failure, List<ProductEntity>> getProducts({String query = ''});
  TaskEither<Failure, ProductEntity?> findByBarcode(String barcode);
  TaskEither<Failure, ProductEntity> saveProduct(ProductEntity product);
  TaskEither<Failure, Unit> deleteProduct(int id);
  TaskEither<Failure, Unit> adjustStock(int productId, double delta, String note);
  TaskEither<Failure, SaleReceipt> checkout(List<CartItem> items, double discount, double paid, String paymentMethod);
  TaskEither<Failure, Unit> returnSaleItem({required int saleId, required int productId, required double quantity, required double refundAmount});
}
