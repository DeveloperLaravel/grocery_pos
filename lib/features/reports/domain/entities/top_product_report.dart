
class TopProductReport {
  final int productId;
  final String productName;
  final double quantitySold;
  final double salesTotal;
  final double costTotal;
  final double grossProfit;

  const TopProductReport({
    required this.productId,
    required this.productName,
    required this.quantitySold,
    required this.salesTotal,
    required this.costTotal,
    required this.grossProfit,
  });
}
