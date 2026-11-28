
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../app_database.dart';
import '../tables/master_data/products/products_table.dart';
import '../tables/sales_inventory/inventory/product_stocks_table.dart';
import '../tables/sales_inventory/sales/sales_table.dart';

part 'home_dao.g.dart';

@DriftAccessor(
  tables: [
    Products,
    ProductStocks,
    Sales,
  ],
)
@lazySingleton
class HomeDao extends DatabaseAccessor<AppDatabase>
    with _$HomeDaoMixin {
  HomeDao(super.db);

  // عدد المنتجات
  Future<int> getProductsCount() async {
    final countExpression = products.id.count();

    final query = selectOnly(products)
      ..addColumns([countExpression]);

    final row = await query.getSingle();

    return row.read(countExpression) ?? 0;
  }

  // عدد فواتير اليوم
  Future<int> getTodaySalesCount() async {
    final now = DateTime.now();

    final start = DateTime(now.year, now.month, now.day);
    final end = start.add(const Duration(days: 1));

    final countExpression = sales.id.count();

    final query = selectOnly(sales)
      ..addColumns([countExpression])
      ..where(
        sales.createdAt.isBiggerOrEqualValue(start) &
        sales.createdAt.isSmallerThanValue(end),
      );

    final row = await query.getSingle();

    return row.read(countExpression) ?? 0;
  }

  // إجمالي مبيعات اليوم
  Future<double> getTodaySalesTotal() async {
    final now = DateTime.now();

    final start = DateTime(now.year, now.month, now.day);
    final end = start.add(const Duration(days: 1));

    final totalExpression = sales.total.sum();

    final query = selectOnly(sales)
      ..addColumns([totalExpression])
      ..where(
        sales.createdAt.isBiggerOrEqualValue(start) &
        sales.createdAt.isSmallerThanValue(end),
      );

    final row = await query.getSingle();

    return (row.read(totalExpression) ?? 0).toDouble();
  }

  // عدد المنتجات منخفضة المخزون
  Future<int> getLowStockCount() async {
    final lowStocks = await (select(productStocks)
          ..where(
            (table) =>
                table.availableQuantity.isSmallerOrEqual(table.minStock) &
                table.isActive.equals(true),
          ))
        .get();

    return lowStocks.map((stock) => stock.productId).toSet().length;
  }

  // آخر خمس فواتير
  Future<List<SaleDb>> getRecentSales() {
    final query = select(sales)
      ..orderBy([
        (table) => OrderingTerm.desc(table.createdAt),
      ])
      ..limit(5);

    return query.get();
  }

  // المنتجات منخفضة المخزون
  Future<List<ProductDb>> getLowStockProducts() async {
    final lowStocks = await (select(productStocks)
          ..where(
            (table) =>
                table.availableQuantity.isSmallerOrEqual(table.minStock) &
                table.isActive.equals(true),
          )
          ..orderBy([
            (table) => OrderingTerm.asc(table.availableQuantity),
          ]))
        .get();

    final productIds = lowStocks
        .map((stock) => stock.productId)
        .toSet()
        .take(5)
        .toList();

    if (productIds.isEmpty) {
      return [];
    }

    return (select(products)
          ..where((table) => table.id.isIn(productIds)))
        .get();
  }
}
