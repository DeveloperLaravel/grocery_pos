
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';

import '../entities/cart_item.dart';
import '../entities/product_entity.dart';
import '../entities/sale_receipt.dart';

abstract interface class PosRepository {
  // Products

  TaskEither<Failure, List<ProductEntity>> getProducts({
    String query = '',
  });

  TaskEither<Failure, ProductEntity?> getProductByBarcode(
    String barcode,
  );

  TaskEither<Failure, ProductEntity?> getProductById(int id);

  TaskEither<Failure, ProductEntity> addProduct(
    ProductEntity product,
  );

  TaskEither<Failure, ProductEntity> updateProduct({
    required int id,
    required ProductEntity product,
  });

  TaskEither<Failure, Unit> deleteProduct(int id);

  // Stock

  TaskEither<Failure, Unit> adjustStock({
    required int productId,
    required double delta,
    required String note,
  });

  // Sales

  TaskEither<Failure, SaleReceipt> checkout({
    required List<CartItem> items,
    required double discount,
    required double paid,
    required String paymentMethod,
  });

  // Returns

  TaskEither<Failure, Unit> returnSaleItem({
    required int saleId,
    required int productId,
    required double quantity,
    required double refundAmount,
  });
}
