
import 'sale_receipt_item.dart';

class SaleReceipt {
  final int id;
  final String invoiceNumber;

  final double subtotal;
  final double discount;
  final double total;

  final double paidAmount;
  final String paymentMethod;

  final DateTime createdAt;

  final List<SaleReceiptItem> items;

  const SaleReceipt({
    required this.id,
    required this.invoiceNumber,
    required this.subtotal,
    required this.discount,
    required this.total,
    required this.paidAmount,
    required this.paymentMethod,
    required this.createdAt,
    this.items = const [],
  });

  // المبلغ المتبقي.
  double get remainingAmount {
    return (total - paidAmount)
        .clamp(0, double.infinity)
        .toDouble();
  }

  // المبلغ الزائد المدفوع.
  double get changeAmount {
    return (paidAmount - total)
        .clamp(0, double.infinity)
        .toDouble();
  }

  // عدد المنتجات في الفاتورة بوحداتها.
  double get totalQuantity {
    return items.fold(
      0,
      (sum, item) => sum + item.quantity,
    );
  }

  // عدد أنواع المنتجات المختلفة.
  int get productsCount => items.length;

  // هل الفاتورة مدفوعة بالكامل؟
  bool get isPaid => paidAmount >= total;

  // هل الفاتورة مدفوعة جزئيًا؟
  bool get isPartiallyPaid =>
      paidAmount > 0 && paidAmount < total;

  // هل الفاتورة غير مدفوعة؟
  bool get isUnpaid => paidAmount <= 0;

  SaleReceipt copyWith({
    int? id,
    String? invoiceNumber,
    double? subtotal,
    double? discount,
    double? total,
    double? paidAmount,
    String? paymentMethod,
    DateTime? createdAt,
    List<SaleReceiptItem>? items,
  }) {
    return SaleReceipt(
      id: id ?? this.id,
      invoiceNumber: invoiceNumber ?? this.invoiceNumber,
      subtotal: subtotal ?? this.subtotal,
      discount: discount ?? this.discount,
      total: total ?? this.total,
      paidAmount: paidAmount ?? this.paidAmount,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      createdAt: createdAt ?? this.createdAt,
      items: items ?? this.items,
    );
  }
}
