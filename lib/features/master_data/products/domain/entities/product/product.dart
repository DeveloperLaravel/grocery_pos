
class Product {
  final int id;
  final String name;
  final String? description;
  final int? categoryId;
  final int? brandId;
  final String productType;
  final String baseUnit;
  final bool allowDecimalQuantity;
  final double costPrice;
  final double salePrice;
  final double minStock;
  final double quantity;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Product({
    required this.id,
    required this.name,
    this.description,
    this.categoryId,
    this.brandId,
    required this.productType,
    required this.baseUnit,
    required this.allowDecimalQuantity,
    required this.costPrice,
    required this.salePrice,
    required this.minStock,
    required this.quantity,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });
}
