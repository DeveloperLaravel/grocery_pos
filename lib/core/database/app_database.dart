import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:injectable/injectable.dart';

import '../config/app_config.dart';
import '../constants/app_constants.dart';

part 'app_database.g.dart';

@DataClassName('ProductDb')
class Products extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 150)();
  TextColumn get barcode => text().unique().withLength(min: 1, max: 100)();
  RealColumn get costPrice => real().withDefault(const Constant(0))();
  RealColumn get salePrice => real()();
  RealColumn get quantity => real().withDefault(const Constant(0))();
  RealColumn get minStock => real().withDefault(
        const Constant(AppConfig.defaultMinStock),
      )();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

@DataClassName('SaleDb')
class Sales extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get invoiceNumber => text().unique()();
  RealColumn get subtotal => real()();
  RealColumn get discount => real().withDefault(const Constant(0))();
  RealColumn get total => real()();
  RealColumn get paidAmount => real()();
  TextColumn get paymentMethod => text().withDefault(
        const Constant(AppConstants.cashPayment),
      )();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

@DataClassName('SaleItemDb')
class SaleItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get saleId => integer().references(
        Sales,
        #id,
        onDelete: KeyAction.cascade,
      )();
  IntColumn get productId => integer().references(Products, #id)();
  TextColumn get productName => text()();
  RealColumn get quantity => real()();
  RealColumn get unitPrice => real()();
  RealColumn get costPrice => real()();
  RealColumn get total => real()();
}

@DataClassName('StockMovementDb')
class StockMovements extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get productId => integer().references(Products, #id)();
  TextColumn get type => text()();
  RealColumn get quantity => real()();
  TextColumn get reference => text().nullable()();
  TextColumn get note => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
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
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

@DataClassName('ReturnItemDb')
class ReturnItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get returnId => integer().references(
        Returns,
        #id,
        onDelete: KeyAction.cascade,
      )();
  IntColumn get productId => integer().references(Products, #id)();
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
  AppDatabase() : super(driftDatabase(name: AppConstants.databaseName));

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (migrator) async {
          await migrator.createAll();
        },
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );

  Future<void> seedIfEmpty() async {
    final countExpression = products.id.count();
    final count = await (selectOnly(products)..addColumns([countExpression]))
        .map((row) => row.read(countExpression) ?? 0)
        .getSingle();

    if (count > 0) return;

    await batch((batch) {
      batch.insertAll(products, [
        ProductsCompanion.insert(
          name: 'حليب',
          barcode: '100001',
          salePrice: 4.5,
          costPrice: const Value(3.4),
          quantity: const Value(30),
          minStock: const Value(5),
        ),
        ProductsCompanion.insert(
          name: 'أرز',
          barcode: '100002',
          salePrice: 6,
          costPrice: const Value(4.5),
          quantity: const Value(40),
          minStock: const Value(8),
        ),
        ProductsCompanion.insert(
          name: 'عصير',
          barcode: '100003',
          salePrice: 2.5,
          costPrice: const Value(1.7),
          quantity: const Value(25),
          minStock: const Value(6),
        ),
        ProductsCompanion.insert(
          name: 'سكر',
          barcode: '100004',
          salePrice: 5,
          costPrice: const Value(4),
          quantity: const Value(4),
          minStock: const Value(5),
        ),
      ]);
    });
  }

  Future<ProductDb?> findProductByBarcode(String barcode) {
    return (select(products)..where((row) => row.barcode.equals(barcode)))
        .getSingleOrNull();
  }

  Stream<List<ProductDb>> watchLowStockProducts() {
    final query = select(products)
      ..where((row) => row.quantity.isSmallerOrEqual(row.minStock))
      ..orderBy([
        (row) => OrderingTerm.asc(row.quantity),
        (row) => OrderingTerm.asc(row.name),
      ]);
    return query.watch();
  }

  Future<void> closeDatabase() => close();
}
