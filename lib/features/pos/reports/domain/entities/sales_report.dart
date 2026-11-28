
class SalesReport {
  final int salesCount;
  final double grossSales;
  final double discounts;
  final double salesTotal;
  final double returnsTotal;
  final double netSales;
  final double costOfGoodsSold;
  final double netProfit;
  final double averageSale;

  const SalesReport({
    required this.salesCount,
    required this.grossSales,
    required this.discounts,
    required this.salesTotal,
    required this.returnsTotal,
    required this.netSales,
    required this.costOfGoodsSold,
    required this.netProfit,
    required this.averageSale,
  });

  double get profitMargin {
    if (netSales <= 0) return 0;
    return (netProfit / netSales) * 100;
  }
}
