import 'sale_item.dart';

class Sale {
  final int id;
  final String invoiceNumber;
  final double subtotal;
  final double discount;
  final double total;
  final double paidAmount;
  final String paymentMethod;
  final DateTime createdAt;
  final List<SaleItem> items;

  const Sale({
    required this.id,
    required this.invoiceNumber,
    required this.subtotal,
    required this.discount,
    required this.total,
    required this.paidAmount,
    required this.paymentMethod,
    required this.createdAt,
    required this.items,
  });

  double get remainingAmount {
    final value = total - paidAmount;
    return value > 0 ? value : 0;
  }

  double get changeAmount {
    final value = paidAmount - total;
    return value > 0 ? value : 0;
  }
}