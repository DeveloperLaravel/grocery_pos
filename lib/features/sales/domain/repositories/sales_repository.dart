import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';

import '../entities/cart_item.dart';
import '../entities/sale.dart';

abstract class SalesRepository {
  TaskEither<Failure, Sale> createSale({
    required List<CartItem> items,
    required double discount,
    required double paidAmount,
    required String paymentMethod,
  });

  TaskEither<Failure, List<Sale>> getSales({
    int limit = 100,
  });

  TaskEither<Failure, Sale> getSaleDetails(int saleId);
TaskEither<Failure, bool> cancelSale(int saleId);
  Stream<List<Sale>> watchSales({
    int limit = 100,
  });
}