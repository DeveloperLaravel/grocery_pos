import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:grocery_pos/core/error/failure.dart';

import '../../data/models/sale_item_model.dart';

class CheckoutParams {
  final List<SaleItemModel> items;
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
