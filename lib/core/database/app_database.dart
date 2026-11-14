
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import 'daos/reports_dao.dart';
import 'daos/sales_dao.dart';
import 'database_connection.dart';

// =========================================
// Tables
// =========================================

import 'tables/products_table.dart';
import 'tables/sales_table.dart';
import 'tables/sale_items_table.dart';
import 'tables/stock_movements_table.dart';
import 'tables/returns_table.dart';
import 'tables/return_items_table.dart';

// =========================================
// DAOs
// =========================================

import 'daos/products_dao.dart';
import 'daos/stock_dao.dart';
import 'daos/database_maintenance_dao.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Products,
    Sales,
    SaleItems,
    StockMovements,
    Returns,
    ReturnItems,
  ],
  daos: [
    ProductsDao,
    StockDao,
    ReportsDao,
    SalesDao,
    DatabaseMaintenanceDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(openConnection());

  // =========================================
  // Database Version
  // =========================================

  @override
  int get schemaVersion => 1;

  // =========================================
  // Migration Strategy
  // =========================================

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (migrator) async {
          // إنشاء جميع الجداول عند إنشاء قاعدة البيانات لأول مرة.
          await migrator.createAll();
        },

        onUpgrade: (migrator, from, to) async {
          // أضف تغييرات قاعدة البيانات هنا عند زيادة schemaVersion.
        },

        beforeOpen: (details) async {
          // تفعيل العلاقات بين الجداول في SQLite.
          await customStatement(
            'PRAGMA foreign_keys = ON',
          );
        },
      );
}
