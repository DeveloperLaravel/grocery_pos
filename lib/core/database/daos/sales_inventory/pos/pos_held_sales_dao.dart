
import 'package:drift/drift.dart';
import 'package:rxdart/rxdart.dart';

import '../../../app_database.dart';
import '../../../tables/sales_inventory/pos/pos_held_sales_table.dart';
import '../../../tables/sales_inventory/pos/pos_held_sale_items_table.dart';

part 'pos_held_sales_dao.g.dart';

@DriftAccessor(
  tables: [
    PosHeldSales,
    PosHeldSaleItems,
  ],
)
class PosHeldSalesDao extends DatabaseAccessor<AppDatabase>
    with _$PosHeldSalesDaoMixin {
  PosHeldSalesDao(super.db);

  // =====================================================
  // Get All
  // =====================================================

  Future<List<PosHeldSaleDb>> getAll() {
    return (select(posHeldSales)
          ..orderBy([
            (t) => OrderingTerm.desc(t.heldAt),
          ]))
        .get();
  }

  Stream<List<PosHeldSaleDb>> watchAll() {
    return (select(posHeldSales)
          ..orderBy([
            (t) => OrderingTerm.desc(t.heldAt),
          ]))
        .watch();
  }

  // =====================================================
  // Get By ID
  // =====================================================

  Future<PosHeldSaleDb?> getById(int id) {
    return (select(posHeldSales)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Stream<PosHeldSaleDb?> watchById(int id) {
    return (select(posHeldSales)
          ..where((t) => t.id.equals(id)))
        .watchSingleOrNull();
  }

  // =====================================================
  // Get By Store
  // =====================================================

  Future<List<PosHeldSaleDb>> getByStoreId(int storeId) {
    return (select(posHeldSales)
          ..where((t) => t.storeId.equals(storeId))
          ..orderBy([
            (t) => OrderingTerm.desc(t.heldAt),
          ]))
        .get();
  }

  Stream<List<PosHeldSaleDb>> watchByStoreId(
    int storeId,
  ) {
    return (select(posHeldSales)
          ..where((t) => t.storeId.equals(storeId))
          ..orderBy([
            (t) => OrderingTerm.desc(t.heldAt),
          ]))
        .watch();
  }

  // =====================================================
  // Get By Cashier
  // =====================================================

  Future<List<PosHeldSaleDb>> getByCashierId(
    int cashierId,
  ) {
    return (select(posHeldSales)
          ..where((t) => t.cashierId.equals(cashierId))
          ..orderBy([
            (t) => OrderingTerm.desc(t.heldAt),
          ]))
        .get();
  }

  // =====================================================
  // Search
  // =====================================================

  Future<List<PosHeldSaleDb>> search(String query) {
    final value = '%${query.trim()}%';

    return (select(posHeldSales)
          ..where(
            (t) =>
                t.holdNumber.like(value) |
                t.notes.like(value),
          )
          ..orderBy([
            (t) => OrderingTerm.desc(t.heldAt),
          ]))
        .get();
  }

  // =====================================================
  // Get Items
  // =====================================================

  Future<List<PosHeldSaleItemDb>> getItems(
    int heldSaleId,
  ) {
    return (select(posHeldSaleItems)
          ..where(
            (t) => t.heldSaleId.equals(heldSaleId),
          )
          ..orderBy([
            (t) => OrderingTerm.asc(t.id),
          ]))
        .get();
  }

  Stream<List<PosHeldSaleItemDb>> watchItems(
    int heldSaleId,
  ) {
    return (select(posHeldSaleItems)
          ..where(
            (t) => t.heldSaleId.equals(heldSaleId),
          )
          ..orderBy([
            (t) => OrderingTerm.asc(t.id),
          ]))
        .watch();
  }

  // =====================================================
  // Get Sale With Items
  // =====================================================

  Future<({
    PosHeldSaleDb sale,
    List<PosHeldSaleItemDb> items,
  })?> getDetails(int id) async {
    final sale = await getById(id);

    if (sale == null) {
      return null;
    }

    final items = await getItems(id);

    return (
      sale: sale,
      items: items,
    );
  }

  // =====================================================
  // Watch Sale With Items
  // =====================================================

  Stream<({
    PosHeldSaleDb? sale,
    List<PosHeldSaleItemDb> items,
  })> watchDetails(int id) {
    return Rx.combineLatest2(
      watchById(id),
      watchItems(id),
      (sale, items) => (
        sale: sale,
        items: items,
      ),
    );
  }

  // =====================================================
  // Create Held Sale
  // =====================================================

  Future<int> create({
    required PosHeldSalesCompanion sale,
    required List<PosHeldSaleItemsCompanion> items,
  }) {
    return attachedDatabase.transaction(() async {
      if (items.isEmpty) {
        throw ArgumentError(
          'لا يمكن تعليق فاتورة بدون منتجات',
        );
      }

      if (!sale.holdNumber.present ||
          !sale.storeId.present ||
          !sale.cashierId.present) {
        throw ArgumentError(
          'بيانات الفاتورة المعلقة غير مكتملة',
        );
      }

      final saleId = await into(posHeldSales).insert(sale);

      for (final item in items) {
        await into(posHeldSaleItems).insert(
          item.copyWith(
            heldSaleId: Value(saleId),
          ),
        );
      }

      return saleId;
    });
  }

  // =====================================================
  // Update Sale
  // =====================================================

  Future<bool> updateSale({
    required int id,
    required PosHeldSalesCompanion data,
  }) async {
    final count = await (update(posHeldSales)
          ..where((t) => t.id.equals(id)))
        .write(
      data.copyWith(
        updatedAt: Value(DateTime.now()),
      ),
    );

    return count > 0;
  }

  // =====================================================
  // Replace Items
  // =====================================================

  Future<void> replaceItems({
    required int heldSaleId,
    required List<PosHeldSaleItemsCompanion> items,
  }) {
    return attachedDatabase.transaction(() async {
      final sale = await getById(heldSaleId);

      if (sale == null) {
        throw StateError(
          'الفاتورة المعلقة غير موجودة',
        );
      }

      if (items.isEmpty) {
        throw ArgumentError(
          'لا يمكن حفظ فاتورة بدون منتجات',
        );
      }

      await (delete(posHeldSaleItems)
            ..where(
              (t) => t.heldSaleId.equals(heldSaleId),
            ))
          .go();

      for (final item in items) {
        await into(posHeldSaleItems).insert(
          item.copyWith(
            id: const Value.absent(),
            heldSaleId: Value(heldSaleId),
          ),
        );
      }

      await (update(posHeldSales)
            ..where((t) => t.id.equals(heldSaleId)))
          .write(
        PosHeldSalesCompanion(
          updatedAt: Value(DateTime.now()),
        ),
      );
    });
  }

  // =====================================================
  // Update Sale With Items
  // =====================================================

  Future<void> updateWithItems({
    required int id,
    required PosHeldSalesCompanion sale,
    required List<PosHeldSaleItemsCompanion> items,
  }) {
    return attachedDatabase.transaction(() async {
      final existing = await getById(id);

      if (existing == null) {
        throw StateError(
          'الفاتورة المعلقة غير موجودة',
        );
      }

      if (items.isEmpty) {
        throw ArgumentError(
          'لا يمكن حفظ فاتورة بدون منتجات',
        );
      }

      await (update(posHeldSales)
            ..where((t) => t.id.equals(id)))
          .write(
        sale.copyWith(
          updatedAt: Value(DateTime.now()),
        ),
      );

      await (delete(posHeldSaleItems)
            ..where(
              (t) => t.heldSaleId.equals(id),
            ))
          .go();

      for (final item in items) {
        await into(posHeldSaleItems).insert(
          item.copyWith(
            id: const Value.absent(),
            heldSaleId: Value(id),
          ),
        );
      }
    });
  }

  // =====================================================
  // Delete Held Sale
  // =====================================================

  Future<int> deleteById(int id) {
    return (delete(posHeldSales)
          ..where((t) => t.id.equals(id)))
        .go();
  }

  // =====================================================
  // Count
  // =====================================================

  Future<int> count() async {
    final countExpression = posHeldSales.id.count();

    final query = selectOnly(posHeldSales)
      ..addColumns([countExpression]);

    return await query
        .map((row) => row.read(countExpression) ?? 0)
        .getSingle();
  }

  Future<int> countByStoreId(int storeId) async {
    final countExpression = posHeldSales.id.count();

    final query = selectOnly(posHeldSales)
      ..addColumns([countExpression])
      ..where(posHeldSales.storeId.equals(storeId));

    return await query
        .map((row) => row.read(countExpression) ?? 0)
        .getSingle();
  }
}
