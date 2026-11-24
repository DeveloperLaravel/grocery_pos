
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../core/database/daos/sales_inventory/sales/checkout_dao.dart';
import '../../../../../core/database/daos/sales_inventory/sales/sales_dao.dart';


import '../models/sale_model.dart';
import '../models/sale_item_model.dart';
import '../models/sale_payment_model.dart';
import '../models/sale_details_model.dart';

import '../mappers/sale_mapper.dart';
import '../mappers/sale_item_mapper.dart';
import '../mappers/sale_payment_mapper.dart';
import 'sales_local_data_source.dart';

@LazySingleton(as: SalesLocalDataSource)
class SalesLocalDataSourceImpl implements SalesLocalDataSource {
  final SalesDao _salesDao;
  final CheckoutDao _checkoutDao;

  SalesLocalDataSourceImpl(
    this._salesDao,
    this._checkoutDao,
  );

  // =====================================================
  // Sales
  // =====================================================

  @override
  Future<List<SaleModel>> getAllSales() async {
    final result = await _salesDao.getAllSales();

    return result.map((e) => e.toModel()).toList();
  }

  @override
  Stream<List<SaleModel>> watchAllSales() {
    return _salesDao.watchAllSales().map(
      (rows) => rows.map((e) => e.toModel()).toList(),
    );
  }

  @override
  Future<SaleModel?> getSaleById(int id) async {
    final result = await _salesDao.getSaleById(id);

    return result?.toModel();
  }

  @override
  Stream<SaleModel?> watchSaleById(int id) {
    return _salesDao.watchSaleById(id).map(
      (e) => e?.toModel(),
    );
  }

  @override
  Future<SaleModel?> getSaleByInvoice(
    String invoiceNumber,
  ) async {
    final result = await _salesDao.getSaleByInvoice(
      invoiceNumber,
    );

    return result?.toModel();
  }

  // =====================================================
  // Details
  // =====================================================

  @override
  Future<SaleDetailsModel?> getSaleDetails(
    int saleId,
  ) async {
    final sale = await _salesDao.getSaleById(saleId);

    if (sale == null) return null;

    final results = await Future.wait([
      _salesDao.getSaleItems(saleId),
      _salesDao.getSalePayments(saleId),
    ]);

    final items = results[0] as List<dynamic>;
    final payments = results[1] as List<dynamic>;

    return SaleDetailsModel(
      sale: sale.toModel(),
      items: items
          .map((e) => (e as dynamic).toModel() as SaleItemModel)
          .toList(),
      payments: payments
          .map((e) => (e as dynamic).toModel() as SalePaymentModel)
          .toList(),
    );
  }

  @override
  Stream<SaleDetailsModel?> watchSaleDetails(
    int saleId,
  ) {
    return Rx.combineLatest3(
      _salesDao.watchSaleById(saleId),
      _salesDao.watchSaleItems(saleId),
      _salesDao.watchSalePayments(saleId),
      (sale, items, payments) {
        if (sale == null) return null;

        return SaleDetailsModel(
          sale: sale.toModel(),
          items: items.map((e) => e.toModel()).toList(),
          payments: payments.map((e) => e.toModel()).toList(),
        );
      },
    );
  }

  // =====================================================
  // Items
  // =====================================================

  @override
  Future<List<SaleItemModel>> getSaleItems(int saleId) async {
    final result = await _salesDao.getSaleItems(saleId);

    return result.map((e) => e.toModel()).toList();
  }

  @override
  Stream<List<SaleItemModel>> watchSaleItems(int saleId) {
    return _salesDao.watchSaleItems(saleId).map(
      (rows) => rows.map((e) => e.toModel()).toList(),
    );
  }

  // =====================================================
  // Payments
  // =====================================================

  @override
  Future<List<SalePaymentModel>> getSalePayments(
    int saleId,
  ) async {
    final result = await _salesDao.getSalePayments(saleId);

    return result.map((e) => e.toModel()).toList();
  }

  @override
  Stream<List<SalePaymentModel>> watchSalePayments(
    int saleId,
  ) {
    return _salesDao.watchSalePayments(saleId).map(
      (rows) => rows.map((e) => e.toModel()).toList(),
    );
  }

  // =====================================================
  // Search
  // =====================================================

  @override
  Future<List<SaleModel>> searchSales(String query) async {
    final result = await _salesDao.searchSales(query);

    return result.map((e) => e.toModel()).toList();
  }

  @override
  Future<List<SaleModel>> getSalesBetween(
    DateTime startDate,
    DateTime endDate,
  ) async {
    final result = await _salesDao.getSalesBetween(
      startDate,
      endDate,
    );

    return result.map((e) => e.toModel()).toList();
  }

  @override
  Stream<List<SaleModel>> watchSalesBetween(
    DateTime startDate,
    DateTime endDate,
  ) {
    return _salesDao.watchSalesBetween(
      startDate,
      endDate,
    ).map(
      (rows) => rows.map((e) => e.toModel()).toList(),
    );
  }

  @override
  Future<List<SaleModel>> getSalesByPaymentStatus(
    String status,
  ) async {
    final result = await _salesDao.getSalesByPaymentStatus(
      status,
    );

    return result.map((e) => e.toModel()).toList();
  }

  @override
  Future<List<SaleModel>> getUnpaidSales() async {
    final result = await _salesDao.getUnpaidSales();

    return result.map((e) => e.toModel()).toList();
  }

  // =====================================================
  // Statistics
  // =====================================================

  @override
  Future<int> getSalesCount() {
    return _salesDao.getSalesCount();
  }

  @override
  Future<double> getTotalSales() {
    return _salesDao.getTotalSales();
  }

  @override
  Future<double> getTotalPaid() {
    return _salesDao.getTotalPaid();
  }

  @override
  Future<double> getTotalRemaining() {
    return _salesDao.getTotalRemaining();
  }

  // =====================================================
  // Checkout
  // =====================================================

  @override
  Future<int> completeSale({
    required SaleModel sale,
    required List<SaleItemModel> items,
    required List<SalePaymentModel> payments,
  }) {
    return _checkoutDao.completeSale(
      sale: sale.toCompanion(),
      items: items.map((e) => e.toCompanion()).toList(),
      payments: payments.map((e) => e.toCompanion()).toList(),
    );
  }
}
