
class TopProductReport {
  final int productId;
  final String productName;
  final double quantitySold;
  final double salesTotal;
  final double costTotal;
  final double profit;

  const TopProductReport({
    required this.productId,
    required this.productName,
    required this.quantitySold,
    required this.salesTotal,
    required this.costTotal,
    required this.profit,
  });

  double get profitMargin {
    if (salesTotal <= 0) return 0;
    return (profit / salesTotal) * 100;
  }
}
