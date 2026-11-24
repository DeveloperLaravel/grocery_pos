
import 'package:drift/drift.dart';

import '../../../app_database.dart';

import '../../../tables/sales_inventory/sales/sales_table.dart';
import '../../../tables/sales_inventory/sales/sale_items_table.dart';
import '../../../tables/sales_inventory/sales/sale_payments_table.dart';

part 'sales_dao.g.dart';

@DriftAccessor(
  tables: [
    Sales,
    SaleItems,
    SalePayments,
  ],
)
class SalesDao extends DatabaseAccessor<AppDatabase>
    with _$SalesDaoMixin {
  SalesDao(super.db);

  // =====================================================
  // Sales - Get
  // =====================================================

  Future<List<SaleDb>> getAllSales() {
    return (select(sales)
          ..orderBy([
            (t) => OrderingTerm.desc(t.saleDate),
          ]))
        .get();
  }

  Stream<List<SaleDb>> watchAllSales() {
    return (select(sales)
          ..orderBy([
            (t) => OrderingTerm.desc(t.saleDate),
          ]))
        .watch();
  }

  Future<SaleDb?> getSaleById(int id) {
    return (select(sales)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  /// مراقبة فاتورة واحدة لحظياً.
  Stream<SaleDb?> watchSaleById(int id) {
    return (select(sales)
          ..where((t) => t.id.equals(id)))
        .watchSingleOrNull();
  }

  Future<SaleDb?> getSaleByInvoice(String invoiceNumber) {
    return (select(sales)
          ..where((t) => t.invoiceNumber.equals(invoiceNumber)))
        .getSingleOrNull();
  }

  // =====================================================
  // Sale Items
  // =====================================================

  Future<List<SaleItemDb>> getSaleItems(int saleId) {
    return (select(saleItems)
          ..where((t) => t.saleId.equals(saleId))
          ..orderBy([
            (t) => OrderingTerm.asc(t.id),
          ]))
        .get();
  }

  Stream<List<SaleItemDb>> watchSaleItems(int saleId) {
    return (select(saleItems)
          ..where((t) => t.saleId.equals(saleId))
          ..orderBy([
            (t) => OrderingTerm.asc(t.id),
          ]))
        .watch();
  }

  // =====================================================
  // Sale Payments
  // =====================================================

  Future<List<SalePaymentDb>> getSalePayments(int saleId) {
    return (select(salePayments)
          ..where((t) => t.saleId.equals(saleId))
          ..orderBy([
            (t) => OrderingTerm.desc(t.paymentDate),
          ]))
        .get();
  }

  Stream<List<SalePaymentDb>> watchSalePayments(int saleId) {
    return (select(salePayments)
          ..where((t) => t.saleId.equals(saleId))
          ..orderBy([
            (t) => OrderingTerm.desc(t.paymentDate),
          ]))
        .watch();
  }

  // =====================================================
  // Payment Calculations
  // =====================================================

  Future<double> getRemainingAmount(int saleId) async {
    final sale = await getSaleById(saleId);
    return sale?.remainingAmount ?? 0;
  }

  Future<double> getPaidAmount(int saleId) async {
    final sale = await getSaleById(saleId);
    return sale?.paidAmount ?? 0;
  }

  // =====================================================
  // Sales Filtering
  // =====================================================

  Future<List<SaleDb>> getSalesBetween(
    DateTime startDate,
    DateTime endDate,
  ) {
    return (select(sales)
          ..where(
            (t) =>
                t.saleDate.isBiggerOrEqualValue(startDate) &
                t.saleDate.isSmallerOrEqualValue(endDate),
          )
          ..orderBy([
            (t) => OrderingTerm.desc(t.saleDate),
          ]))
        .get();
  }

  Stream<List<SaleDb>> watchSalesBetween(
    DateTime startDate,
    DateTime endDate,
  ) {
    return (select(sales)
          ..where(
            (t) =>
                t.saleDate.isBiggerOrEqualValue(startDate) &
                t.saleDate.isSmallerOrEqualValue(endDate),
          )
          ..orderBy([
            (t) => OrderingTerm.desc(t.saleDate),
          ]))
        .watch();
  }

  Future<List<SaleDb>> searchSales(String query) {
    final searchQuery = '%${query.trim()}%';

    return (select(sales)
          ..where(
            (t) => t.invoiceNumber.like(searchQuery),
          )
          ..orderBy([
            (t) => OrderingTerm.desc(t.saleDate),
          ]))
        .get();
  }

  Future<List<SaleDb>> getSalesByPaymentStatus(
    String paymentStatus,
  ) {
    return (select(sales)
          ..where(
            (t) => t.paymentStatus.equals(paymentStatus),
          )
          ..orderBy([
            (t) => OrderingTerm.desc(t.saleDate),
          ]))
        .get();
  }

  Future<List<SaleDb>> getUnpaidSales() {
    return (select(sales)
          ..where(
            (t) => t.remainingAmount.isBiggerThanValue(0),
          )
          ..orderBy([
            (t) => OrderingTerm.desc(t.saleDate),
          ]))
        .get();
  }

  // =====================================================
  // Sales Statistics
  // =====================================================

  Future<int> getSalesCount() async {
    final countExpression = sales.id.count();

    final query = selectOnly(sales)
      ..addColumns([countExpression]);

    final result = await query.getSingle();

    return result.read(countExpression) ?? 0;
  }

  Future<double> getTotalSales() async {
    final expression = sales.totalAmount.sum();

    final query = selectOnly(sales)
      ..addColumns([expression]);

    final result = await query.getSingle();

    return result.read(expression) ?? 0;
  }

  Future<double> getTotalPaid() async {
    final expression = sales.paidAmount.sum();

    final query = selectOnly(sales)
      ..addColumns([expression]);

    final result = await query.getSingle();

    return result.read(expression) ?? 0;
  }

  Future<double> getTotalRemaining() async {
    final expression = sales.remainingAmount.sum();

    final query = selectOnly(sales)
      ..addColumns([expression]);

    final result = await query.getSingle();

    return result.read(expression) ?? 0;
  }
}
