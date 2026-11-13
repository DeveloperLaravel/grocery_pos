class SaleItem {
  final int id;
  final int saleId;
  final int productId;
  final String productName;
  final double quantity;
  final double unitPrice;
  final double costPrice;
  final double total;

  const SaleItem({
    required this.id,
    required this.saleId,
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.unitPrice,
    required this.costPrice,
    required this.total,
  });
}