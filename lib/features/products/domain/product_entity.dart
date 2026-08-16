class ProductEntity {
  final int id;
  final String name;
  final String barcode;
  final double costPrice;
  final double salePrice;
  final double quantity;
  final double minStock;
  const ProductEntity({required this.id, required this.name, required this.barcode, required this.costPrice, required this.salePrice, required this.quantity, required this.minStock});
  bool get isLowStock => quantity <= minStock;
}
