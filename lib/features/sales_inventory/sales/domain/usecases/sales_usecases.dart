
import 'package:injectable/injectable.dart';

import '../entities/sale.dart';
import '../entities/sale_details.dart';
import '../entities/sale_item.dart';
import '../entities/sale_payment.dart';
import '../repositories/sales_repository.dart';

@lazySingleton
class SalesUseCases {
  final SalesRepository repository;

  SalesUseCases(this.repository);

  // Sales
  Future<List<Sale>> getAll() =>
      repository.getAllSales();

  Stream<List<Sale>> watchAll() =>
      repository.watchAllSales();

  Future<Sale?> getById(int id) =>
      repository.getSaleById(id);

  Stream<Sale?> watchById(int id) =>
      repository.watchSaleById(id);

  Future<Sale?> getByInvoice(String invoice) =>
      repository.getSaleByInvoice(invoice);

  Future<List<Sale>> search(String query) =>
      repository.searchSales(query);

  Future<List<Sale>> getBetween(
    DateTime start,
    DateTime end,
  ) =>
      repository.getSalesBetween(start, end);

  Stream<List<Sale>> watchBetween(
    DateTime start,
    DateTime end,
  ) =>
      repository.watchSalesBetween(start, end);

  Future<List<Sale>> getByPaymentStatus(String status) =>
      repository.getSalesByPaymentStatus(status);

  Future<List<Sale>> getUnpaid() =>
      repository.getUnpaidSales();

  // Details
  Future<SaleDetails?> getDetails(int id) =>
      repository.getSaleDetails(id);

  Stream<SaleDetails?> watchDetails(int id) =>
      repository.watchSaleDetails(id);

  // Items
  Future<List<SaleItem>> getItems(int id) =>
      repository.getSaleItems(id);

  Stream<List<SaleItem>> watchItems(int id) =>
      repository.watchSaleItems(id);

  // Payments
  Future<List<SalePayment>> getPayments(int id) =>
      repository.getSalePayments(id);

  Stream<List<SalePayment>> watchPayments(int id) =>
      repository.watchSalePayments(id);
}

@lazySingleton
class SalesStatisticsUseCase {
  final SalesRepository repository;

  SalesStatisticsUseCase(this.repository);

  Future<int> getCount() =>
      repository.getSalesCount();

  Future<double> getTotalSales() =>
      repository.getTotalSales();

  Future<double> getTotalPaid() =>
      repository.getTotalPaid();

  Future<double> getTotalRemaining() =>
      repository.getTotalRemaining();
}

@lazySingleton
class CompleteSaleUseCase {
  final SalesRepository repository;

  CompleteSaleUseCase(this.repository);

  Future<int> call({
    required Sale sale,
    required List<SaleItem> items,
    required List<SalePayment> payments,
  }) {
    return repository.completeSale(
      sale: sale,
      items: items,
      payments: payments,
    );
  }
}
