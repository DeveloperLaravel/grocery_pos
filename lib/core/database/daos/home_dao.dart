
import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/master_data/products/products_table.dart';
import '../tables/sales_inventory/sales/sales_table.dart';

part 'home_dao.g.dart';

@DriftAccessor(
  tables: [
    Products,
    Sales,
  ],
)
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

    final totalExpression = sales.rowId.sum();

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
    final countExpression = products.id.count();

    final query = selectOnly(products)
      ..addColumns([countExpression])
      ..where(
        products.quantity.isSmallerOrEqual(
          products.minStock,
        ),
      );

    final row = await query.getSingle();

    return row.read(countExpression) ?? 0;
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
  Future<List<ProductDb>> getLowStockProducts() {
    final query = select(products)
      ..where(
        (table) => table.quantity.isSmallerOrEqual(
          table.minStock,
        ),
      )
      ..orderBy([
        (table) => OrderingTerm.asc(table.quantity),
      ])
      ..limit(5);

    return query.get();
  }
}
