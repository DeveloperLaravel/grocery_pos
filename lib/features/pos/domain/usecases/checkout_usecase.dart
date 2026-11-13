
import 'package:injectable/injectable.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../entities/cart_item.dart';
import '../entities/sale_receipt.dart';
import '../repositories/pos_repository.dart';

@lazySingleton
class CheckoutUseCase {
  final PosRepository _repository;

  CheckoutUseCase(this._repository);

  TaskEither<Failure, SaleReceipt> call({
    required List<CartItem> items,
    required double discount,
    required double paid,
    required String paymentMethod,
  }) {
    return _repository.checkout(
      items: items,
      discount: discount,
      paid: paid,
      paymentMethod: paymentMethod,
    );
  }
}
