import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:injectable/injectable.dart';

import '../config/app_config.dart';
import '../constants/app_constants.dart';

part 'app_database.g.dart';

@DataClassName('ProductDb')
class Products extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name =>
      text().withLength(min: 1, max: 150)();

  TextColumn get barcode =>
      text().unique().withLength(min: 1, max: 100)();

  RealColumn get costPrice =>
      real().withDefault(const Constant(0))();

  RealColumn get salePrice => real()();

  RealColumn get quantity =>
      real().withDefault(const Constant(0))();

  RealColumn get minStock => real().withDefault(
        const Constant(AppConfig.defaultMinStock),
      )();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();
}

@DataClassName('SaleDb')
class Sales extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get invoiceNumber => text().unique()();

  RealColumn get subtotal => real()();

  RealColumn get discount =>
      real().withDefault(const Constant(0))();

  RealColumn get total => real()();

  RealColumn get paidAmount => real()();

  TextColumn get paymentMethod => text().withDefault(
        const Constant(AppConstants.cashPayment),
      )();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
}

@DataClassName('SaleItemDb')
class SaleItems extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get saleId => integer().references(
        Sales,
        #id,
        onDelete: KeyAction.cascade,
      )();

  IntColumn get productId =>
      integer().references(Products, #id)();

  TextColumn get productName => text()();

  RealColumn get quantity => real()();

  RealColumn get unitPrice => real()();

  RealColumn get costPrice => real()();

  RealColumn get total => real()();
}

@DataClassName('StockMovementDb')
class StockMovements extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get productId =>
      integer().references(Products, #id)();

  TextColumn get type => text()();

  RealColumn get quantity => real()();

  TextColumn get reference => text().nullable()();

  TextColumn get note => text().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
}

@DataClassName('ReturnDb')
class Returns extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get saleId => integer().references(
        Sales,
        #id,
        onDelete: KeyAction.cascade,
      )();

  RealColumn get total => real()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
}

@DataClassName('ReturnItemDb')
class ReturnItems extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get returnId => integer().references(
        Returns,
        #id,
        onDelete: KeyAction.cascade,
      )();

  IntColumn get productId =>
      integer().references(Products, #id)();

  RealColumn get quantity => real()();

  RealColumn get refundAmount => real()();
}

@DriftDatabase(
  tables: [
    Products,
    Sales,
    SaleItems,
    StockMovements,
    Returns,
    ReturnItems,
  ],
)
@lazySingleton
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(
          driftDatabase(
            name: AppConstants.databaseName,
          ),
        );

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (migrator) async {
        await migrator.createAll();
      },
      beforeOpen: (details) async {
        await customStatement(
          'PRAGMA foreign_keys = ON',
        );
      },
    );
  }

  // ============================================================
  // PRODUCTS
  // ============================================================

  Future<ProductDb?> findProductByBarcode(
    String barcode,
  ) {
    final value = barcode.trim();

    if (value.isEmpty) {
      return Future.value(null);
    }

    return (select(products)
          ..where(
            (row) => row.barcode.equals(value),
          ))
        .getSingleOrNull();
  }

  /// حذف منتج إذا لم يكن مرتبطاً بفواتير أو مرتجعات.
  Future<bool> deleteProductById(
    int productId,
  ) async {
    if (productId <= 0) {
      return false;
    }

    return transaction(() async {
      // هل المنتج مستخدم في فاتورة؟
      final saleItem = await (select(saleItems)
            ..where(
              (row) => row.productId.equals(productId),
            )
            ..limit(1))
          .getSingleOrNull();

      // هل المنتج مستخدم في مرتجع؟
      final returnItem = await (select(returnItems)
            ..where(
              (row) => row.productId.equals(productId),
            )
            ..limit(1))
          .getSingleOrNull();

      if (saleItem != null || returnItem != null) {
        throw StateError(
          'لا يمكن حذف المنتج لأنه مرتبط بفواتير أو مرتجعات سابقة.',
        );
      }

      // نحذف حركات المخزون أولاً.
      await (delete(stockMovements)
            ..where(
              (row) => row.productId.equals(productId),
            ))
          .go();

      // ثم نحذف المنتج.
      final deleted = await (delete(products)
            ..where(
              (row) => row.id.equals(productId),
            ))
          .go();

      return deleted > 0;
    });
  }

  // ============================================================
  // STOCK
  // ============================================================

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

  // ============================================================
  // DELETE / RESET DATABASE DATA
  // ============================================================

  /// حذف المنتجات فقط.
  ///
  /// سيعمل فقط عندما لا توجد فواتير أو مرتجعات مرتبطة بها.
  Future<void> clearProducts() async {
    await transaction(() async {
      await delete(stockMovements).go();

      // بسبب Foreign Keys، المنتجات المستخدمة في الفواتير
      // لن يمكن حذفها بهذه الطريقة.
      await delete(products).go();
    });
  }

  /// مسح جميع بيانات البرنامج بالكامل.
  ///
  /// تحذير:
  /// المنتجات + الفواتير + المخزون + المرتجعات كلها سيتم حذفها.
  Future<void> clearAllData() async {
    await transaction(() async {
      // الترتيب مهم بسبب Foreign Keys.

      await delete(returnItems).go();
      await delete(returns).go();

      await delete(stockMovements).go();

      await delete(saleItems).go();
      await delete(sales).go();

      await delete(products).go();
    });
  }

  Future<void> closeDatabase() => close();
}