
class LowStockProduct {
  final int id;
  final String name;
  final String barcode;
  final double quantity;
  final double minStock;
  final double salePrice;

  const LowStockProduct({
    required this.id,
    required this.name,
    required this.barcode,
    required this.quantity,
    required this.minStock,
    required this.salePrice,
  });

  bool get isOutOfStock => quantity <= 0;

  bool get isLowStock => quantity > 0 && quantity <= minStock;

  double get shortageQuantity {
    return (minStock - quantity).clamp(0.0, double.infinity);
  }
}
