
class ReturnItemEntity {
  final int id;
  final int returnId;
  final int productId;

  final double quantity;
  final double refundAmount;

  const ReturnItemEntity({
    required this.id,
    required this.returnId,
    required this.productId,
    required this.quantity,
    required this.refundAmount,
  });

  double get refundPerUnit {
    if (quantity <= 0) return 0;

    return refundAmount / quantity;
  }

  ReturnItemEntity copyWith({
    int? id,
    int? returnId,
    int? productId,
    double? quantity,
    double? refundAmount,
  }) {
    return ReturnItemEntity(
      id: id ?? this.id,
      returnId: returnId ?? this.returnId,
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
      refundAmount: refundAmount ?? this.refundAmount,
    );
  }
}
