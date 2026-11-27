import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../tables/master_data/parties/customers_table.dart';
import '../../../tables/sales_inventory/pos/cash_registers_table.dart';
import '../../../tables/sales_inventory/pos/cashier_shifts_table.dart';
import '../../../tables/sales_inventory/pos/pos_held_sale_items_table.dart';
import '../../../tables/sales_inventory/pos/pos_held_sales_table.dart';
import '../../../tables/sales_inventory/pos/pos_terminals_table.dart';

part 'pos_held_sales_dao.g.dart';

@DriftAccessor(
  tables: [
    PosHeldSales,
    PosHeldSaleItems,
    PosTerminals,
    CashRegisters,
    CashierShifts,
    Customers,
  ],
)
class PosHeldSalesDao extends DatabaseAccessor<AppDatabase>
    with _$PosHeldSalesDaoMixin {
  PosHeldSalesDao(super.db);

  Future<List<PosHeldSaleDb>> getHeldSales({
    int? terminalId,
    int? registerId,
    int? cashierId,
    String status = 'held',
  }) {
    final query = select(posHeldSales)
      ..where((t) => t.status.equals(status));

    if (terminalId != null) {
      query.where((t) => t.terminalId.equals(terminalId));
    }
    if (registerId != null) {
      query.where((t) => t.registerId.equals(registerId));
    }
    if (cashierId != null) {
      query.where((t) => t.cashierId.equals(cashierId));
    }
    query.orderBy([(t) => OrderingTerm.desc(t.heldAt)]);
    return query.get();
  }

  Stream<List<PosHeldSaleDb>> watchHeldSales({
    int? terminalId,
    int? registerId,
    int? cashierId,
  }) {
    final query = select(posHeldSales)
      ..where((t) => t.status.equals('held'));

    if (terminalId != null) {
      query.where((t) => t.terminalId.equals(terminalId));
    }
    if (registerId != null) {
      query.where((t) => t.registerId.equals(registerId));
    }
    if (cashierId != null) {
      query.where((t) => t.cashierId.equals(cashierId));
    }
    query.orderBy([(t) => OrderingTerm.desc(t.heldAt)]);
    return query.watch();
  }

  Future<PosHeldSaleDb?> getHeldSaleById(int id) {
    return (select(posHeldSales)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Future<List<PosHeldSaleItemDb>> getHeldSaleItems(int heldSaleId) {
    return (select(posHeldSaleItems)
          ..where((t) => t.heldSaleId.equals(heldSaleId))
          ..orderBy([(t) => OrderingTerm.asc(t.sortOrder)]))
        .get();
  }

  /// يحفظ رأس الفاتورة وجميع تفاصيلها كوحدة واحدة.
  Future<int> createHeldSale({
    required PosHeldSalesCompanion sale,
    required List<PosHeldSaleItemsCompanion> items,
  }) {
    return transaction(() async {
      if (items.isEmpty) {
        throw ArgumentError('لا يمكن تعليق فاتورة بدون منتجات.');
      }
      if ((sale.total.present && sale.total.value < 0) ||
          (sale.subtotal.present && sale.subtotal.value < 0) ||
          (sale.discountAmount.present && sale.discountAmount.value < 0) ||
          (sale.taxAmount.present && sale.taxAmount.value < 0)) {
        throw ArgumentError('القيم المالية للفاتورة لا يمكن أن تكون سالبة.');
      }

      final terminalId = sale.terminalId.value;
      final registerId = sale.registerId.value;

      final terminal = await (select(posTerminals)
            ..where((t) => t.id.equals(terminalId)))
          .getSingleOrNull();
      if (terminal == null) {
        throw StateError('جهاز نقطة البيع غير موجود.');
      }

      final register = await (select(cashRegisters)
            ..where((t) => t.id.equals(registerId)))
          .getSingleOrNull();
      if (register == null || register.terminalId != terminalId) {
        throw StateError('الصندوق لا يتبع جهاز نقطة البيع المحدد.');
      }

      final shiftId = sale.shiftId.present ? sale.shiftId.value : null;
      if (shiftId != null) {
        final shift = await (select(cashierShifts)
              ..where((t) => t.id.equals(shiftId)))
            .getSingleOrNull();
        if (shift == null ||
            shift.status != 'open' ||
            shift.registerId != registerId) {
          throw StateError('الوردية غير صالحة لهذه الفاتورة المعلقة.');
        }
      }

      final heldSaleId = await into(posHeldSales).insert(sale);
      final itemRows = items
          .map((item) => item.copyWith(
                heldSaleId: Value(heldSaleId),
              ))
          .toList();

      await batch((batch) {
        batch.insertAll(posHeldSaleItems, itemRows);
      });

      return heldSaleId;
    });
  }

  /// يغيّر الحالة إلى resumed ويعيد رأس الفاتورة.
  /// تفاصيل الفاتورة تسترجع بواسطة getHeldSaleItems.
  Future<PosHeldSaleDb> resumeHeldSale(int heldSaleId) {
    return transaction(() async {
      final sale = await (select(posHeldSales)
            ..where((t) => t.id.equals(heldSaleId)))
          .getSingleOrNull();

      if (sale == null) {
        throw StateError('الفاتورة المعلقة غير موجودة.');
      }
      if (sale.status != 'held') {
        throw StateError('الفاتورة ليست معلقة حالياً.');
      }

      await (update(posHeldSales)
            ..where((t) => t.id.equals(heldSaleId)))
          .write(
        PosHeldSalesCompanion(
          status: const Value('resumed'),
          resumedAt: Value(DateTime.now()),
          updatedAt: Value(DateTime.now()),
        ),
      );

      return (select(posHeldSales)
            ..where((t) => t.id.equals(heldSaleId)))
          .getSingle();
    });
  }

  Future<int> cancelHeldSale({
    required int heldSaleId,
    required String reason,
    int? updatedBy,
  }) {
    return transaction(() async {
      final sale = await (select(posHeldSales)
            ..where((t) => t.id.equals(heldSaleId)))
          .getSingleOrNull();

      if (sale == null) {
        throw StateError('الفاتورة المعلقة غير موجودة.');
      }
      if (sale.status != 'held') {
        throw StateError('يمكن إلغاء الفواتير المعلقة فقط.');
      }

      return (update(posHeldSales)
            ..where((t) => t.id.equals(heldSaleId)))
          .write(
        PosHeldSalesCompanion(
          status: const Value('cancelled'),
          cancelledAt: Value(DateTime.now()),
          cancellationReason: Value(reason),
          updatedBy: Value(updatedBy),
          updatedAt: Value(DateTime.now()),
        ),
      );
    });
  }

  Future<int> deleteHeldSalePermanently(int heldSaleId) {
    // الحذف الفعلي يحذف التفاصيل تلقائياً عبر onDelete: cascade.
    return (delete(posHeldSales)
          ..where((t) =>
              t.id.equals(heldSaleId) & t.status.equals('cancelled')))
        .go();
  }
}
