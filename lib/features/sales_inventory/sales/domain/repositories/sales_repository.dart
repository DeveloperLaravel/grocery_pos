
import '../entities/sale.dart';
import '../entities/sale_item.dart';
import '../entities/sale_payment.dart';
import '../entities/sale_details.dart';

abstract interface class SalesRepository {
  // Sales
  Future<List<Sale>> getAllSales();

  Stream<List<Sale>> watchAllSales();

  Future<Sale?> getSaleById(int id);

  Stream<Sale?> watchSaleById(int id);

  Future<Sale?> getSaleByInvoice(String invoiceNumber);

  // Details
  Future<SaleDetails?> getSaleDetails(int saleId);

  Stream<SaleDetails?> watchSaleDetails(int saleId);

  // Items
  Future<List<SaleItem>> getSaleItems(int saleId);

  Stream<List<SaleItem>> watchSaleItems(int saleId);

  // Payments
  Future<List<SalePayment>> getSalePayments(int saleId);

  Stream<List<SalePayment>> watchSalePayments(int saleId);

  // Search
  Future<List<Sale>> searchSales(String query);

  Future<List<Sale>> getSalesBetween(
    DateTime startDate,
    DateTime endDate,
  );

  Stream<List<Sale>> watchSalesBetween(
    DateTime startDate,
    DateTime endDate,
  );

  Future<List<Sale>> getSalesByPaymentStatus(String status);

  Future<List<Sale>> getUnpaidSales();

  // Statistics
  Future<int> getSalesCount();

  Future<double> getTotalSales();

  Future<double> getTotalPaid();

  Future<double> getTotalRemaining();

  // Checkout
  Future<int> completeSale({
    required Sale sale,
    required List<SaleItem> items,
    required List<SalePayment> payments,
  });
}
