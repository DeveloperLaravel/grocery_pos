
import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/products_table.dart';
import '../tables/return_items_table.dart';
import '../tables/returns_table.dart';
import '../tables/sale_items_table.dart';
import '../tables/sales_table.dart';
import '../tables/stock_movements_table.dart';

part 'database_maintenance_dao.g.dart';

@DriftAccessor(
  tables: [
    Products,
    Sales,
    SaleItems,
    StockMovements,
    Returns,
    ReturnItems,
  ],
)
class DatabaseMaintenanceDao
    extends DatabaseAccessor<AppDatabase>
    with _$DatabaseMaintenanceDaoMixin {
  DatabaseMaintenanceDao(super.db);

  // حذف المنتجات فقط
  //
  // سيفشل إذا كانت هناك منتجات مرتبطة بفواتير
  // أو مرتجعات بسبب العلاقات الخارجية.
  Future<void> clearProducts() async {
    await attachedDatabase.transaction(() async {
      await delete(stockMovements).go();

      await delete(products).go();
    });
  }

  // حذف جميع بيانات البرنامج
  Future<void> clearAllData() async {
    await attachedDatabase.transaction(() async {
      // أولاً تفاصيل المرتجعات
      await delete(returnItems).go();

      // ثانياً المرتجعات
      await delete(returns).go();

      // ثالثاً حركات المخزون
      await delete(stockMovements).go();

      // رابعاً تفاصيل الفواتير
      await delete(saleItems).go();

      // خامساً الفواتير
      await delete(sales).go();

      // أخيراً المنتجات
      await delete(products).go();
    });
  }
}
