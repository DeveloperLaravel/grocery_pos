
import 'package:injectable/injectable.dart';

import '../../domain/entities/sale.dart';
import '../../domain/entities/sale_item.dart';
import '../../domain/entities/sale_payment.dart';
import '../../domain/entities/sale_details.dart';

import '../../domain/repositories/sales_repository.dart';

import '../database/sales_local_data_source.dart';

import '../mappers/sale_mapper.dart';
import '../mappers/sale_item_mapper.dart';
import '../mappers/sale_payment_mapper.dart';
import '../mappers/sale_details_mapper.dart';

@LazySingleton(as: SalesRepository)
class SalesRepositoryImpl implements SalesRepository {
  final SalesLocalDataSource _localDataSource;

  SalesRepositoryImpl(this._localDataSource);

  // =====================================================
  // Sales
  // =====================================================

  @override
  Future<List<Sale>> getAllSales() async {
    final result = await _localDataSource.getAllSales();

    return result.map((e) => e.toEntity()).toList();
  }

  @override
  Stream<List<Sale>> watchAllSales() {
    return _localDataSource.watchAllSales().map(
      (rows) => rows.map((e) => e.toEntity()).toList(),
    );
  }

  @override
  Future<Sale?> getSaleById(int id) async {
    final result = await _localDataSource.getSaleById(id);

    return result?.toEntity();
  }

  @override
  Stream<Sale?> watchSaleById(int id) {
    return _localDataSource.watchSaleById(id).map(
      (e) => e?.toEntity(),
    );
  }

  @override
  Future<Sale?> getSaleByInvoice(String invoiceNumber) async {
    final result = await _localDataSource.getSaleByInvoice(
      invoiceNumber,
    );

    return result?.toEntity();
  }

  // =====================================================
  // Details
  // =====================================================

  @override
  Future<SaleDetails?> getSaleDetails(int saleId) async {
    final result = await _localDataSource.getSaleDetails(saleId);

    return result?.toEntity();
  }

  @override
  Stream<SaleDetails?> watchSaleDetails(int saleId) {
    return _localDataSource.watchSaleDetails(saleId).map(
      (e) => e?.toEntity(),
    );
  }

  // =====================================================
  // Items
  // =====================================================

  @override
  Future<List<SaleItem>> getSaleItems(int saleId) async {
    final result = await _localDataSource.getSaleItems(saleId);

    return result.map((e) => e.toEntity()).toList();
  }

  @override
  Stream<List<SaleItem>> watchSaleItems(int saleId) {
    return _localDataSource.watchSaleItems(saleId).map(
      (rows) => rows.map((e) => e.toEntity()).toList(),
    );
  }

  // =====================================================
  // Payments
  // =====================================================

  @override
  Future<List<SalePayment>> getSalePayments(int saleId) async {
    final result = await _localDataSource.getSalePayments(saleId);

    return result.map((e) => e.toEntity()).toList();
  }

  @override
  Stream<List<SalePayment>> watchSalePayments(int saleId) {
    return _localDataSource.watchSalePayments(saleId).map(
      (rows) => rows.map((e) => e.toEntity()).toList(),
    );
  }

  // =====================================================
  // Search
  // =====================================================

  @override
  Future<List<Sale>> searchSales(String query) async {
    final result = await _localDataSource.searchSales(query);

    return result.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<Sale>> getSalesBetween(
    DateTime startDate,
    DateTime endDate,
  ) async {
    final result = await _localDataSource.getSalesBetween(
      startDate,
      endDate,
    );

    return result.map((e) => e.toEntity()).toList();
  }

  @override
  Stream<List<Sale>> watchSalesBetween(
    DateTime startDate,
    DateTime endDate,
  ) {
    return _localDataSource.watchSalesBetween(
      startDate,
      endDate,
    ).map(
      (rows) => rows.map((e) => e.toEntity()).toList(),
    );
  }

  @override
  Future<List<Sale>> getSalesByPaymentStatus(
    String status,
  ) async {
    final result = await _localDataSource.getSalesByPaymentStatus(
      status,
    );

    return result.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<Sale>> getUnpaidSales() async {
    final result = await _localDataSource.getUnpaidSales();

    return result.map((e) => e.toEntity()).toList();
  }

  // =====================================================
  // Statistics
  // =====================================================

  @override
  Future<int> getSalesCount() {
    return _localDataSource.getSalesCount();
  }

  @override
  Future<double> getTotalSales() {
    return _localDataSource.getTotalSales();
  }

  @override
  Future<double> getTotalPaid() {
    return _localDataSource.getTotalPaid();
  }

  @override
  Future<double> getTotalRemaining() {
    return _localDataSource.getTotalRemaining();
  }

  // =====================================================
  // Checkout
  // =====================================================

  @override
  Future<int> completeSale({
    required Sale sale,
    required List<SaleItem> items,
    required List<SalePayment> payments,
  }) {
    return _localDataSource.completeSale(
      sale: sale.toModel(),
      items: items.map((e) => e.toModel()).toList(),
      payments: payments.map((e) => e.toModel()).toList(),
    );
  }
}
