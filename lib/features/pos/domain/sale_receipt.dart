import 'package:grocery_pos/features/pos/domain/cart_item.dart';

class SaleReceipt {
  final int saleId;
  final String invoiceNumber;
  final DateTime date;
  final List<CartItem> items;
  final double subtotal;
  final double discount;
  final double total;
  final double paid;
  const SaleReceipt({required this.saleId, required this.invoiceNumber, required this.date, required this.items, required this.subtotal, required this.discount, required this.total, required this.paid});
  double get change => paid - total;
}
