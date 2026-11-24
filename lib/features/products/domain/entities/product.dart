
class Product {
  final int id;
  final String name;
  final String? description;

  final int? categoryId;
  final int? brandId;

  final String? barcode;

  final String productType;
  final String baseUnit;
  final bool allowDecimalQuantity;

  final double costPrice;
  final double salePrice;

  final double quantity;
  final double minStock;

  final String? imagePath;
  final String? imageName;
  final DateTime? imageUpdatedAt;

  final bool isActive;

  final DateTime createdAt;
  final DateTime updatedAt;

  const Product({
    required this.id,
    required this.name,
    this.description,
    this.categoryId,
    this.brandId,
    this.barcode,
    required this.productType,
    required this.baseUnit,
    required this.allowDecimalQuantity,
    required this.costPrice,
    required this.salePrice,
    required this.quantity,
    required this.minStock,
    this.imagePath,
    this.imageName,
    this.imageUpdatedAt,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  bool get isLowStock => quantity <= minStock;

  bool get hasBarcode =>
      barcode != null && barcode!.trim().isNotEmpty;

  double get stockValue => quantity * costPrice;

  double get potentialSalesValue => quantity * salePrice;
}
