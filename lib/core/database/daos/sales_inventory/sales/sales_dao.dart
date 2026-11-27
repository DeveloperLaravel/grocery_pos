
import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../tables/sales_inventory/sales/sales_table.dart';
import '../../../tables/sales_inventory/sales/sale_items_table.dart';

part 'sales_dao.g.dart';

@DriftAccessor(
  tables: [
    Sales,
    SaleItems,
  ],
)
class SalesDao extends DatabaseAccessor<AppDatabase>
    with _$SalesDaoMixin {
  SalesDao(super.db);

  // =========================================
  // 1. Insert Sale
  // =========================================

  Future<int> insertSale(SalesCompanion sale) {
    return into(sales).insert(sale);
  }

  // =========================================
  // 2. Create Sale With Items
  // =========================================

  Future<int> createSaleWithItems({
    required SalesCompanion sale,
    required List<SaleItemsCompanion> items,
  }) async {
    if (items.isEmpty) {
      throw ArgumentError('لا يمكن إنشاء فاتورة بدون منتجات');
    }

    return transaction(() async {
      final saleId = await into(sales).insert(sale);

      for (final item in items) {
        await into(saleItems).insert(
          item.copyWith(
            saleId: Value(saleId),
          ),
        );
      }

      return saleId;
    });
  }

  // =========================================
  // 3. Update Sale
  // =========================================

  Future<bool> updateSale(
    int saleId,
    SalesCompanion sale,
  ) async {
    final rows = await (update(sales)
          ..where((tbl) => tbl.id.equals(saleId)))
        .write(
      sale.copyWith(
        updatedAt: Value(DateTime.now()),
      ),
    );

    return rows > 0;
  }

  // =========================================
  // 4. Get Sale By ID
  // =========================================

  Future<SaleDb?> getSaleById(int saleId) {
    return (select(sales)
          ..where((tbl) => tbl.id.equals(saleId)))
        .getSingleOrNull();
  }

  // =========================================
  // 5. Get Sale By Invoice Number
  // =========================================

  Future<SaleDb?> getSaleByInvoiceNumber(
    String invoiceNumber,
  ) {
    return (select(sales)
          ..where(
            (tbl) => tbl.invoiceNumber.equals(invoiceNumber),
          ))
        .getSingleOrNull();
  }

  // =========================================
  // 6. Get All Sales
  // =========================================

  Future<List<SaleDb>> getAllSales({
    int? limit,
    int? offset,
  }) {
    final query = select(sales)
      ..orderBy([
        (tbl) => OrderingTerm.desc(tbl.saleDate),
      ]);

    if (limit != null) {
      query.limit(
        limit,
        offset: offset ?? 0,
      );
    }

    return query.get();
  }

  // =========================================
  // 7. Watch All Sales
  // =========================================

  Stream<List<SaleDb>> watchAllSales() {
    return (select(sales)
          ..orderBy([
            (tbl) => OrderingTerm.desc(tbl.saleDate),
          ]))
        .watch();
  }

  // =========================================
  // 8. Get Sales By Customer
  // =========================================

  Future<List<SaleDb>> getSalesByCustomer(
    int customerId,
  ) {
    return (select(sales)
          ..where(
            (tbl) => tbl.customerId.equals(customerId),
          )
          ..orderBy([
            (tbl) => OrderingTerm.desc(tbl.saleDate),
          ]))
        .get();
  }

  // =========================================
  // 9. Watch Sales By Customer
  // =========================================

  Stream<List<SaleDb>> watchSalesByCustomer(
    int customerId,
  ) {
    return (select(sales)
          ..where(
            (tbl) => tbl.customerId.equals(customerId),
          )
          ..orderBy([
            (tbl) => OrderingTerm.desc(tbl.saleDate),
          ]))
        .watch();
  }

  // =========================================
  // 10. Get Sales By Store
  // =========================================

  Future<List<SaleDb>> getSalesByStore(
    int storeId,
  ) {
    return (select(sales)
          ..where(
            (tbl) => tbl.storeId.equals(storeId),
          )
          ..orderBy([
            (tbl) => OrderingTerm.desc(tbl.saleDate),
          ]))
        .get();
  }

  // =========================================
  // 11. Search Sales
  // =========================================

  Future<List<SaleDb>> searchSales(String keyword) {
    final value = keyword.trim();

    if (value.isEmpty) {
      return getAllSales();
    }

    return (select(sales)
          ..where(
            (tbl) => tbl.invoiceNumber.contains(value),
          )
          ..orderBy([
            (tbl) => OrderingTerm.desc(tbl.saleDate),
          ]))
        .get();
  }

  // =========================================
  // 12. Get Sales Between Dates
  // =========================================

  Future<List<SaleDb>> getSalesBetweenDates({
    required DateTime startDate,
    required DateTime endDate,
  }) {
    return (select(sales)
          ..where(
            (tbl) =>
                tbl.saleDate.isBiggerOrEqualValue(startDate) &
                tbl.saleDate.isSmallerOrEqualValue(endDate),
          )
          ..orderBy([
            (tbl) => OrderingTerm.desc(tbl.saleDate),
          ]))
        .get();
  }

  // =========================================
  // 13. Update Sale Status
  // =========================================

  Future<bool> updateSaleStatus({
    required int saleId,
    required String status,
  }) async {
    final rows = await (update(sales)
          ..where((tbl) => tbl.id.equals(saleId)))
        .write(
      SalesCompanion(
        status: Value(status),
        updatedAt: Value(DateTime.now()),
      ),
    );

    return rows > 0;
  }

  // =========================================
  // 14. Cancel Sale
  // =========================================

  Future<bool> cancelSale({
    required int saleId,
    required String reason,
  }) async {
    return transaction(() async {
      final sale = await getSaleById(saleId);

      if (sale == null) return false;

      if (sale.status == 'cancelled') return false;

      if (sale.status == 'returned' ||
          sale.status == 'partially_returned') {
        throw StateError('لا يمكن إلغاء فاتورة مسترجعة');
      }

      final rows = await (update(sales)
            ..where((tbl) => tbl.id.equals(saleId)))
          .write(
        SalesCompanion(
          status: const Value('cancelled'),
          cancellationReason: Value(reason),
          updatedAt: Value(DateTime.now()),
        ),
      );

      return rows > 0;
    });
  }

  // =========================================
  // 15. Delete Sale
  // =========================================
  // Use only for draft invoices.
  // Do not delete completed sales.

  Future<bool> deleteDraftSale(int saleId) async {
    return transaction(() async {
      final sale = await getSaleById(saleId);

      if (sale == null || sale.status != 'draft') {
        return false;
      }

      final rows = await (delete(sales)
            ..where((tbl) => tbl.id.equals(saleId)))
          .go();

      return rows > 0;
    });
  }

  // =========================================
  // 16. Count Sales
  // =========================================

  Future<int> getSalesCount() async {
    final count = sales.id.count();

    final query = selectOnly(sales)
      ..addColumns([count]);

    final row = await query.getSingle();

    return row.read(count) ?? 0;
  }
}
