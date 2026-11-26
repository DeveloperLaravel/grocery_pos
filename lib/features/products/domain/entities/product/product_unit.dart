
class ProductUnit {
  final int id;
  final int productId;
  final String unitName;
  final double conversionFactor;
  final double costPrice;
  final double salePrice;
  final bool isBaseUnit;
  final bool isDefault;
  final bool isActive;
  final int sortOrder;

  const ProductUnit({
    required this.id,
    required this.productId,
    required this.unitName,
    required this.conversionFactor,
    required this.costPrice,
    required this.salePrice,
    required this.isBaseUnit,
    required this.isDefault,
    required this.isActive,
    required this.sortOrder,
  });
}
