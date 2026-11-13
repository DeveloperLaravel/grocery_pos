
class SaleReceiptItem {
  final int productId;
  final String productName;

  final double quantity;

  final double unitPrice;
  final double costPrice;

  final double total;

  const SaleReceiptItem({
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.unitPrice,
    required this.costPrice,
    required this.total,
  });

  // الربح للوحدة.
  double get unitProfit => unitPrice - costPrice;

  // إجمالي الربح لهذا السطر.
  double get totalProfit => total - (costPrice * quantity);

  SaleReceiptItem copyWith({
    int? productId,
    String? productName,
    double? quantity,
    double? unitPrice,
    double? costPrice,
    double? total,
  }) {
    return SaleReceiptItem(
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
      costPrice: costPrice ?? this.costPrice,
      total: total ?? this.total,
    );
  }
}
