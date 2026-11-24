
class SaleLineInput {
  final int productId;
  final int? productUnitId;

  /// الكمية بالوحدة المختارة، وليس بالوحدة الأساسية.
  final double quantity;

  const SaleLineInput({
    required this.productId,
    this.productUnitId,
    required this.quantity,
  });
}
