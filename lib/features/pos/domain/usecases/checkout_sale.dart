import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:grocery_pos/core/error/failure.dart';
import 'package:grocery_pos/features/pos/domain/cart_item.dart';
import 'package:grocery_pos/features/pos/domain/pos_repository.dart';
import 'package:grocery_pos/features/pos/domain/sale_receipt.dart';

class CheckoutParams {
  final List<CartItem> items;
  final double discount;
  final double paid;
  final String paymentMethod;
  const CheckoutParams({required this.items, required this.discount, required this.paid, required this.paymentMethod});
}

@injectable
class CheckoutSale {
  final PosRepository repository;
  CheckoutSale(this.repository);
  TaskEither<Failure, SaleReceipt> call(CheckoutParams p) => repository.checkout(p.items, p.discount, p.paid, p.paymentMethod);
}
