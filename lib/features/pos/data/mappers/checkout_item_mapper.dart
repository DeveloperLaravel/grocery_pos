
import '../models/checkout_item_model.dart';

class CheckoutItemMapper {
  const CheckoutItemMapper._();

  static CheckoutItemModel fromValues({
    required int productId,
    required double quantity,
  }) {
    return CheckoutItemModel(
      productId: productId,
      quantity: quantity,
    );
  }
}
