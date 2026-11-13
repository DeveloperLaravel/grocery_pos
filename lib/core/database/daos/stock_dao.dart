
import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/products_table.dart';

part 'stock_dao.g.dart';

@DriftAccessor(
  tables: [Products],
)
class StockDao extends DatabaseAccessor<AppDatabase>
    with _$StockDaoMixin {
  StockDao(super.db);

  // مراقبة المنتجات منخفضة المخزون
  Stream<List<ProductDb>> watchLowStockProducts() {
    final query = select(products)
      ..where(
        (row) =>
            row.quantity.isSmallerOrEqual(row.minStock),
      )
      ..orderBy([
        (row) => OrderingTerm.asc(row.quantity),
        (row) => OrderingTerm.asc(row.name),
      ]);

    return query.watch();
  }

  // جلب جميع المنتجات
  Future<List<ProductDb>> getAllProducts() {
    return select(products).get();
  }

  // مراقبة جميع المنتجات
  Stream<List<ProductDb>> watchAllProducts() {
    return select(products).watch();
  }
}
