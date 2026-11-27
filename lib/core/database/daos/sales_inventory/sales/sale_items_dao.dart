
import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../tables/sales_inventory/sales/sales_table.dart';
import '../../../tables/sales_inventory/sales/sale_items_table.dart';

part 'sale_items_dao.g.dart';

@DriftAccessor(
  tables: [
    Sales,
    SaleItems,
  ],
)
class SaleItemsDao extends DatabaseAccessor<AppDatabase>
    with _$SaleItemsDaoMixin {
  SaleItemsDao(super.db);

  // =========================================
  // 1. Insert Sale Item
  // =========================================

  Future<int> insertSaleItem(
    SaleItemsCompanion item,
  ) {
    _validateItem(item);

    return into(saleItems).insert(item);
  }

  // =========================================
  // 2. Insert Multiple Items
  // =========================================

  Future<List<int>> insertSaleItems(
    List<SaleItemsCompanion> items,
  ) async {
    if (items.isEmpty) return [];

    for (final item in items) {
      _validateItem(item);
    }

    return transaction(() async {
      final ids = <int>[];

      for (final item in items) {
        ids.add(await into(saleItems).insert(item));
      }

      return ids;
    });
  }

  // =========================================
  // 3. Update Sale Item
  // =========================================

  Future<bool> updateSaleItem({
    required int itemId,
    required SaleItemsCompanion item,
  }) async {
    _validateItem(item);

    final rows = await (update(saleItems)
          ..where((tbl) => tbl.id.equals(itemId)))
        .write(item);

    return rows > 0;
  }

  // =========================================
  // 4. Get Item By ID
  // =========================================

  Future<SaleItemDb?> getSaleItemById(int itemId) {
    return (select(saleItems)
          ..where((tbl) => tbl.id.equals(itemId)))
        .getSingleOrNull();
  }

  // =========================================
  // 5. Get Items By Sale ID
  // =========================================

  Future<List<SaleItemDb>> getItemsBySaleId(
    int saleId,
  ) {
    return (select(saleItems)
          ..where((tbl) => tbl.saleId.equals(saleId))
          ..orderBy([
            (tbl) => OrderingTerm.asc(tbl.id),
          ]))
        .get();
  }

  // =========================================
  // 6. Watch Items By Sale ID
  // =========================================

  Stream<List<SaleItemDb>> watchItemsBySaleId(
    int saleId,
  ) {
    return (select(saleItems)
          ..where((tbl) => tbl.saleId.equals(saleId))
          ..orderBy([
            (tbl) => OrderingTerm.asc(tbl.id),
          ]))
        .watch();
  }

  // =========================================
  // 7. Get Items By Product
  // =========================================

  Future<List<SaleItemDb>> getItemsByProduct(
    int productId,
  ) {
    return (select(saleItems)
          ..where((tbl) => tbl.productId.equals(productId))
          ..orderBy([
            (tbl) => OrderingTerm.desc(tbl.id),
          ]))
        .get();
  }

  // =========================================
  // 8. Delete Item
  // =========================================

  Future<bool> deleteSaleItem(int itemId) async {
    final rows = await (delete(saleItems)
          ..where((tbl) => tbl.id.equals(itemId)))
        .go();

    return rows > 0;
  }

  // =========================================
  // 9. Delete All Items By Sale
  // =========================================
  // Useful for draft invoices only.

  Future<int> deleteItemsBySaleId(int saleId) async {
    return (delete(saleItems)
          ..where((tbl) => tbl.saleId.equals(saleId)))
        .go();
  }

  // =========================================
  // 10. Get Items Count
  // =========================================

  Future<int> getItemsCount(int saleId) async {
    final count = saleItems.id.count();

    final query = selectOnly(saleItems)
      ..addColumns([count])
      ..where(saleItems.saleId.equals(saleId));

    final row = await query.getSingle();

    return row.read(count) ?? 0;
  }

  // =========================================
  // 11. Calculate Sale Subtotal
  // =========================================

  Future<double> calculateSubtotal(int saleId) async {
    final items = await getItemsBySaleId(saleId);

    return items.fold<double>(
      0.0,
      (sum, item) => sum + item.subtotal,
    );
  }

  // =========================================
  // 12. Calculate Sale Total
  // =========================================

  Future<double> calculateTotal(int saleId) async {
    final items = await getItemsBySaleId(saleId);

    return items.fold<double>(
      0.0,
      (sum, item) => sum + item.total,
    );
  }

  // =========================================
  // 13. Validate Item
  // =========================================

  void _validateItem(SaleItemsCompanion item) {
    if (item.quantity.present && item.quantity.value <= 0) {
      throw ArgumentError('الكمية يجب أن تكون أكبر من صفر');
    }

    if (item.unitPrice.present && item.unitPrice.value < 0) {
      throw ArgumentError('سعر البيع لا يمكن أن يكون سالباً');
    }

    if (item.costPrice.present && item.costPrice.value < 0) {
      throw ArgumentError('سعر التكلفة لا يمكن أن يكون سالباً');
    }

    if (item.conversionFactor.present &&
        item.conversionFactor.value <= 0) {
      throw ArgumentError('معامل التحويل يجب أن يكون أكبر من صفر');
    }

    if (item.discountAmount.present &&
        item.discountAmount.value < 0) {
      throw ArgumentError('الخصم لا يمكن أن يكون سالباً');
    }

    if (item.taxAmount.present && item.taxAmount.value < 0) {
      throw ArgumentError('الضريبة لا يمكن أن تكون سالبة');
    }

    if (item.total.present && item.total.value < 0) {
      throw ArgumentError('الإجمالي لا يمكن أن يكون سالباً');
    }
  }
}
