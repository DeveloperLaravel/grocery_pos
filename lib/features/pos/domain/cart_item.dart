import 'package:grocery_pos/features/products/domain/product_entity.dart';

class CartItem {
  final ProductEntity product;
  final double quantity;
  const CartItem({required this.product, required this.quantity});
  double get total => product.salePrice * quantity;
  CartItem copyWith({double? quantity}) => CartItem(product: product, quantity: quantity ?? this.quantity);
}
