import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';

import '../entities/cart_item.dart';
import '../entities/sale.dart';
import '../repositories/sales_repository.dart';

class CreateSaleUseCase {
  final SalesRepository repository;

  const CreateSaleUseCase(this.repository);

  TaskEither<Failure, Sale> call({
    required List<CartItem> items,
    required double discount,
    required double paidAmount,
    required String paymentMethod,
  }) {
    return repository.createSale(
      items: items,
      discount: discount,
      paidAmount: paidAmount,
      paymentMethod: paymentMethod,
    );
  }
}