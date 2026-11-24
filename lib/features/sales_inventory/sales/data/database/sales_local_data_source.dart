
import '../models/sale_model.dart';
import '../models/sale_item_model.dart';
import '../models/sale_payment_model.dart';
import '../models/sale_details_model.dart';

abstract interface class SalesLocalDataSource {
  // Sales
  Future<List<SaleModel>> getAllSales();

  Stream<List<SaleModel>> watchAllSales();

  Future<SaleModel?> getSaleById(int id);

  Stream<SaleModel?> watchSaleById(int id);

  Future<SaleModel?> getSaleByInvoice(String invoiceNumber);

  // Details
  Future<SaleDetailsModel?> getSaleDetails(int saleId);

  Stream<SaleDetailsModel?> watchSaleDetails(int saleId);

  // Items
  Future<List<SaleItemModel>> getSaleItems(int saleId);

  Stream<List<SaleItemModel>> watchSaleItems(int saleId);

  // Payments
  Future<List<SalePaymentModel>> getSalePayments(int saleId);

  Stream<List<SalePaymentModel>> watchSalePayments(int saleId);

  // Search
  Future<List<SaleModel>> searchSales(String query);

  Future<List<SaleModel>> getSalesBetween(
    DateTime startDate,
    DateTime endDate,
  );

  Stream<List<SaleModel>> watchSalesBetween(
    DateTime startDate,
    DateTime endDate,
  );

  Future<List<SaleModel>> getSalesByPaymentStatus(
    String status,
  );

  Future<List<SaleModel>> getUnpaidSales();

  // Statistics
  Future<int> getSalesCount();

  Future<double> getTotalSales();

  Future<double> getTotalPaid();

  Future<double> getTotalRemaining();

  // Checkout
  Future<int> completeSale({
    required SaleModel sale,
    required List<SaleItemModel> items,
    required List<SalePaymentModel> payments,
  });
}
