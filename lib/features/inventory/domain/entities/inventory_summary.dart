class InventorySummary {
  final int productsCount;
  final int lowStockCount;
  final double totalUnits;
  final double stockCostValue;
  final double stockSaleValue;

  const InventorySummary({
    required this.productsCount,
    required this.lowStockCount,
    required this.totalUnits,
    required this.stockCostValue,
    required this.stockSaleValue,
  });

  static const empty = InventorySummary(
    productsCount: 0,
    lowStockCount: 0,
    totalUnits: 0,
    stockCostValue: 0,
    stockSaleValue: 0,
  );

  double get potentialProfit =>
      stockSaleValue - stockCostValue;
}