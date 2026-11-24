
class ProductUnit {
  final int id;
  final int productId;

  final String unitName;
  final String? unitSymbol;

  final double conversionFactor;

  final double salePrice;
  final double purchasePrice;

  final bool isBaseUnit;
  final bool isDefault;
  final bool isActive;

  final int sortOrder;

  final DateTime createdAt;
  final DateTime updatedAt;

  const ProductUnit({
    required this.id,
    required this.productId,
    required this.unitName,
    this.unitSymbol,
    required this.conversionFactor,
    required this.salePrice,
    required this.purchasePrice,
    required this.isBaseUnit,
    required this.isDefault,
    required this.isActive,
    required this.sortOrder,
    required this.createdAt,
    required this.updatedAt,
  });

  double toBaseQuantity(double quantity) {
    if (quantity <= 0) {
      throw ArgumentError('الكمية غير صحيحة');
    }

    if (conversionFactor <= 0) {
      throw StateError('معامل التحويل غير صالح');
    }

    return quantity * conversionFactor;
  }

  double fromBaseQuantity(double quantity) {
    if (conversionFactor <= 0) {
      throw StateError('معامل التحويل غير صالح');
    }

    return quantity / conversionFactor;
  }
}
