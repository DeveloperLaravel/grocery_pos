
import 'product_entity.dart';

class CartItem {
  final ProductEntity product;
  final double quantity;

  const CartItem({
    required this.product,
    required this.quantity,
  });

  double get unitPrice => product.salePrice;

  double get unitCost => product.costPrice;

  double get total => unitPrice * quantity;

  double get totalCost => unitCost * quantity;

  double get profit => total - totalCost;

  CartItem copyWith({
    ProductEntity? product,
    double? quantity,
  }) {
    return CartItem(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }
}
