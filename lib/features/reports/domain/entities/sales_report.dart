
class SalesReport {
  final int salesCount;
  final double grossSales;
  final double discounts;
  final double netSales;
  final double returnsTotal;
  final double costOfGoodsSold;
  final double grossProfit;
  final double netProfit;
  final double averageSale;

  const SalesReport({
    required this.salesCount,
    required this.grossSales,
    required this.discounts,
    required this.netSales,
    required this.returnsTotal,
    required this.costOfGoodsSold,
    required this.grossProfit,
    required this.netProfit,
    required this.averageSale,
  });

  static const empty = SalesReport(
    salesCount: 0,
    grossSales: 0,
    discounts: 0,
    netSales: 0,
    returnsTotal: 0,
    costOfGoodsSold: 0,
    grossProfit: 0,
    netProfit: 0,
    averageSale: 0,
  );
}
