
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../entities/cart_item.dart';
import '../entities/sale_receipt.dart';
import '../pos_repository.dart';

class CheckoutUseCase {
  final PosRepository repository;

  CheckoutUseCase(this.repository);

  TaskEither<Failure, SaleReceipt> call({
    required List<CartItem> items,
    required double discount,
    required double paid,
    required String paymentMethod,
  }) {
    return repository.checkout(
      items: items,
      discount: discount,
      paid: paid,
      paymentMethod: paymentMethod,
    );
  }
}
