class InventoryItem {
  final int id;
  final String name;
  final String barcode;
  final double costPrice;
  final double salePrice;
  final double quantity;
  final double minStock;
  final DateTime createdAt;
  final DateTime updatedAt;

  const InventoryItem({
    required this.id,
    required this.name,
    required this.barcode,
    required this.costPrice,
    required this.salePrice,
    required this.quantity,
    required this.minStock,
    required this.createdAt,
    required this.updatedAt,
  });

  bool get isLowStock => quantity <= minStock;

  bool get isOutOfStock => quantity <= 0;

  double get stockValue => quantity * costPrice;

  double get potentialSalesValue => quantity * salePrice;
}