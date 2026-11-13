
class ProductEntity {
  final int? id;
  final String name;
  final String barcode;

  final double costPrice;
  final double salePrice;

  final double quantity;
  final double minStock;

  final DateTime? createdAt;
  final DateTime? updatedAt;

  const ProductEntity({
    this.id,
    required this.name,
    required this.barcode,
    required this.costPrice,
    required this.salePrice,
    required this.quantity,
    required this.minStock,
    this.createdAt,
    this.updatedAt,
  });

  // الربح للوحدة الواحدة.
  double get profit => salePrice - costPrice;

  // إجمالي قيمة المخزون بسعر التكلفة.
  double get stockCostValue => quantity * costPrice;

  // إجمالي قيمة المخزون بسعر البيع.
  double get stockSaleValue => quantity * salePrice;

  // هل المنتج منخفض المخزون؟
  bool get isLowStock => quantity <= minStock;

  // هل المنتج نفد؟
  bool get isOutOfStock => quantity <= 0;

  // هامش الربح كنسبة مئوية.
  double get profitMargin {
    if (salePrice <= 0) return 0;

    return (profit / salePrice) * 100;
  }

  ProductEntity copyWith({
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
    return ProductEntity(
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
}
