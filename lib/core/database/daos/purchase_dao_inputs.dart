class PurchaseLineDbInput {
  final int productId;
  final int? productUnitId;
  final double quantity;
  final double? unitPrice;
  final String? notes;

  const PurchaseLineDbInput({
    required this.productId,
    this.productUnitId,
    required this.quantity,
    this.unitPrice,
    this.notes,
  });
}