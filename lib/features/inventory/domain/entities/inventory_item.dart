class InventoryItem {
  final int id;
  final String name;
  final String barcode;
  final double quantity;
  final double minStock;
  final double costPrice;
  final double salePrice;

  const InventoryItem({
    required this.id,
    required this.name,
    required this.barcode,
    required this.quantity,
    required this.minStock,
    required this.costPrice,
    required this.salePrice,
  });

  bool get isLowStock => quantity <= minStock;
  double get stockCostValue => quantity * costPrice;
  double get stockSaleValue => quantity * salePrice;
}
