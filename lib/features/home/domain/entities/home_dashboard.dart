
import 'recent_sale.dart';
import 'low_stock_product.dart';

class HomeDashboard {
  final int productsCount;
  final int todaySalesCount;
  final double todaySalesTotal;
  final int lowStockCount;

  final List<RecentSale> recentSales;
  final List<LowStockProduct> lowStockProducts;

  const HomeDashboard({
    required this.productsCount,
    required this.todaySalesCount,
    required this.todaySalesTotal,
    required this.lowStockCount,
    required this.recentSales,
    required this.lowStockProducts,
  });

  factory HomeDashboard.empty() {
    return const HomeDashboard(
      productsCount: 0,
      todaySalesCount: 0,
      todaySalesTotal: 0.0,
      lowStockCount: 0,
      recentSales: [],
      lowStockProducts: [],
    );
  }
}
