import 'package:drift/drift.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:grocery_pos/core/database/app_database.dart';
import 'package:grocery_pos/core/error/failure.dart';
import 'package:grocery_pos/features/inventory/domain/entities/inventory_item.dart';
import 'package:grocery_pos/features/inventory/domain/entities/inventory_summary.dart';
import 'package:grocery_pos/features/inventory/domain/entities/stock_movement_entity.dart';
import 'package:grocery_pos/features/inventory/domain/repositories/inventory_repository.dart';

@LazySingleton(as: InventoryRepository)
class InventoryRepositoryImpl implements InventoryRepository {
  final AppDatabase db;
  InventoryRepositoryImpl(this.db);

  Failure _failure(Object e) => Failure('Inventory error: $e');

  InventoryItem _mapProduct(ProductDb p) => InventoryItem(
        id: p.id,
        name: p.name,
        barcode: p.barcode,
        quantity: p.quantity,
        minStock: p.minStock,
        costPrice: p.costPrice,
        salePrice: p.salePrice,
      );

  @override
  TaskEither<Failure, List<InventoryItem>> getInventory({String query = ''}) =>
      TaskEither.tryCatch(() async {
        final normalized = query.trim().toLowerCase();
        final rows = await db.select(db.products).get();
        return rows
            .where((p) => normalized.isEmpty ||
                p.name.toLowerCase().contains(normalized) ||
                p.barcode.toLowerCase().contains(normalized))
            .map(_mapProduct)
            .toList()
          ..sort((a, b) {
            if (a.isLowStock != b.isLowStock) return a.isLowStock ? -1 : 1;
            return a.name.compareTo(b.name);
          });
      }, (e, _) => _failure(e));

  @override
  TaskEither<Failure, List<InventoryItem>> getLowStock() => TaskEither.tryCatch(
        () async {
          final rows = await db.select(db.products).get();
          return rows.map(_mapProduct).where((p) => p.isLowStock).toList();
        },
        (e, _) => _failure(e),
      );

  @override
  TaskEither<Failure, InventorySummary> getSummary() => TaskEither.tryCatch(
        () async {
          final rows = await db.select(db.products).get();
          final items = rows.map(_mapProduct).toList();
          return InventorySummary(
            productsCount: items.length,
            lowStockCount: items.where((e) => e.isLowStock).length,
            totalUnits: items.fold(0, (s, e) => s + e.quantity),
            stockCostValue: items.fold(0, (s, e) => s + e.stockCostValue),
            stockSaleValue: items.fold(0, (s, e) => s + e.stockSaleValue),
          );
        },
        (e, _) => _failure(e),
      );

  @override
  TaskEither<Failure, List<StockMovementEntity>> getMovements({int? productId}) =>
      TaskEither.tryCatch(() async {
        final movementRows = await (db.select(db.stockMovements)
              ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
            .get();
        final products = await db.select(db.products).get();
        final names = {for (final p in products) p.id: p.name};
        return movementRows
            .where((m) => productId == null || m.productId == productId)
            .map((m) => StockMovementEntity(
                  id: m.id,
                  productId: m.productId,
                  productName: names[m.productId] ?? 'منتج #${m.productId}',
                  type: m.type,
                  quantity: m.quantity,
                  reference: m.reference,
                  note: m.note,
                  createdAt: m.createdAt,
                ))
            .toList();
      }, (e, _) => _failure(e));

  @override
  TaskEither<Failure, Unit> adjustStock({
    required int productId,
    required double delta,
    required String note,
  }) => TaskEither.tryCatch(() async {
        if (delta == 0) return unit;
        await db.transaction(() async {
          final product = await (db.select(db.products)..where((t) => t.id.equals(productId))).getSingle();
          final next = product.quantity + delta;
          if (next < 0) throw StateError('الكمية لا يمكن أن تصبح سالبة');
          await (db.update(db.products)..where((t) => t.id.equals(productId))).write(
            ProductsCompanion(quantity: Value(next), updatedAt: Value(DateTime.now())),
          );
          await db.into(db.stockMovements).insert(
            StockMovementsCompanion.insert(
              productId: productId,
              type: 'adjustment',
              quantity: delta,
              note: Value(note.trim().isEmpty ? 'تسوية مخزون' : note.trim()),
            ),
          );
        });
        return unit;
      }, (e, _) => _failure(e));

  @override
  TaskEither<Failure, Unit> setStock({
    required int productId,
    required double newQuantity,
    required String note,
  }) => TaskEither.tryCatch(() async {
        if (newQuantity < 0) throw StateError('الكمية لا يمكن أن تكون سالبة');
        await db.transaction(() async {
          final product = await (db.select(db.products)..where((t) => t.id.equals(productId))).getSingle();
          final delta = newQuantity - product.quantity;
          await (db.update(db.products)..where((t) => t.id.equals(productId))).write(
            ProductsCompanion(quantity: Value(newQuantity), updatedAt: Value(DateTime.now())),
          );
          if (delta != 0) {
            await db.into(db.stockMovements).insert(
              StockMovementsCompanion.insert(
                productId: productId,
                type: 'count',
                quantity: delta,
                note: Value(note.trim().isEmpty ? 'جرد فعلي' : note.trim()),
              ),
            );
          }
        });
        return unit;
      }, (e, _) => _failure(e));

  @override
  TaskEither<Failure, Unit> updateMinStock({required int productId, required double minStock}) =>
      TaskEither.tryCatch(() async {
        if (minStock < 0) throw StateError('حد التنبيه غير صالح');
        await (db.update(db.products)..where((t) => t.id.equals(productId))).write(
          ProductsCompanion(minStock: Value(minStock), updatedAt: Value(DateTime.now())),
        );
        return unit;
      }, (e, _) => _failure(e));
}
