
class Product {
  // Product ID
  final int? id;

  // Product Information
  final String name;
  final String barcode;

  // Pricing
  final double costPrice;
  final double salePrice;

  // Inventory
  final double quantity;
  final double minStock;

  // Timestamps
  final DateTime createdAt;
  final DateTime updatedAt;

  const Product({
    this.id,
    required this.name,
    required this.barcode,
    this.costPrice = 0.0,
    required this.salePrice,
    this.quantity = 0.0,
    this.minStock = 5.0,
    required this.createdAt,
    required this.updatedAt,
  });

  // Copy Product with updated values
  Product copyWith({
    int? id,
    String? name,
    String? barcode,
    double? costPrice,
    double? salePrice,
    double? quantity,
    double? minStock,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      barcode: barcode ?? this.barcode,
      costPrice: costPrice ?? this.costPrice,
      salePrice: salePrice ?? this.salePrice,
      quantity: quantity ?? this.quantity,
      minStock: minStock ?? this.minStock,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  // Calculate profit per unit
  double get profit => salePrice - costPrice;

  // Calculate total inventory value
  double get totalCostValue => quantity * costPrice;

  // Calculate total selling value
  double get totalSaleValue => quantity * salePrice;

  // Check low stock
  bool get isLowStock => quantity <= minStock;

  // Check available stock
  bool get isAvailable => quantity > 0;
}