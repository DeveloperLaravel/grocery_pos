import '../models/purchase_order_model.dart';
import '../models/purchase_item_model.dart';
import '../models/purchase_line_input_model.dart';
import '../models/purchase_order_details_model.dart';

import '../models/purchase_payment_model.dart';

import '../models/purchase_receipt_model.dart';
import '../models/purchase_receipt_item_model.dart';
import '../models/purchase_receipt_item_input_model.dart';
import '../models/purchase_receipt_details_model.dart';

abstract class PurchaseLocalDataSource {
  // =====================================================
  // PURCHASE ORDERS
  // =====================================================

  Future<int> createPurchaseOrder({
    required int supplierId,
    required String invoiceNumber,
    String? supplierInvoiceNumber,
    required DateTime purchaseDate,
    DateTime? expectedDeliveryDate,
    required List<PurchaseLineInputModel> items,
    double discount = 0,
    double tax = 0,
    double shippingCost = 0,
    double additionalCost = 0,
    String? notes,
    String? internalNotes,
  });

  Future<List<PurchaseOrderModel>> getPurchaseOrders();

  Future<PurchaseOrderModel?> getPurchaseOrderById(int orderId);

  Future<PurchaseOrderDetailsModel?> getPurchaseOrderDetails(
    int orderId,
  );

  Future<List<PurchaseItemModel>> getPurchaseItems(int orderId);

  Future<void> updatePurchaseOrder({
    required int orderId,
    required int supplierId,
    required String invoiceNumber,
    String? supplierInvoiceNumber,
    required DateTime purchaseDate,
    DateTime? expectedDeliveryDate,
    required List<PurchaseLineInputModel> items,
    double discount = 0,
    double tax = 0,
    double shippingCost = 0,
    double additionalCost = 0,
    String? notes,
    String? internalNotes,
  });

  Future<void> updatePurchaseStatus({
    required int orderId,
    required String status,
  });

  Future<void> deletePurchaseOrder(int orderId);

  // =====================================================
  // PURCHASE PAYMENTS
  // =====================================================

  Future<int> createPurchasePayment({
    required int purchaseOrderId,
    required String paymentNumber,
    required double amount,
    required DateTime paymentDate,
    required String paymentMethod,
    String? referenceNumber,
    String? notes,
  });

  Future<List<PurchasePaymentModel>> getPurchasePayments(
    int orderId,
  );

  Future<void> deletePurchasePayment(int paymentId);

  // =====================================================
  // PURCHASE RECEIPTS
  // =====================================================

  Future<int> createPurchaseReceipt({
    required int purchaseOrderId,
    required String receiptNumber,
    required List<PurchaseReceiptItemInputModel> items,
    required DateTime receivedAt,
    String? notes,
  });

  Future<List<PurchaseReceiptModel>> getPurchaseReceipts(
    int orderId,
  );

  Future<PurchaseReceiptDetailsModel?> getPurchaseReceiptDetails(
    int receiptId,
  );

  Future<List<PurchaseReceiptItemModel>> getPurchaseReceiptItems(
    int receiptId,
  );

  Future<void> deletePurchaseReceipt(int receiptId);
}