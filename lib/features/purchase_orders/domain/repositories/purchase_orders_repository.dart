
import '../entities/purchase_order.dart';
import '../entities/purchase_item.dart';
import '../entities/purchase_line_input.dart';
import '../entities/purchase_order_details.dart';

abstract class PurchaseOrderRepository {
  // Create
  Future<int> createPurchaseOrder({
    required int supplierId,
    required String invoiceNumber,
    String? supplierInvoiceNumber,
    DateTime? purchaseDate,
    DateTime? expectedDeliveryDate,
    double discount = 0,
    double tax = 0,
    double shippingCost = 0,
    double additionalCost = 0,
    String? notes,
    String? internalNotes,
    required List<PurchaseLineInput> items,
  });

  // Read
  Future<PurchaseOrder?> getPurchaseOrderById(int id);

  Future<PurchaseOrderDetails?> getPurchaseOrderDetails(int id);

  Future<List<PurchaseOrder>> getPurchaseOrders({
    int? supplierId,
    String? status,
    DateTime? fromDate,
    DateTime? toDate,
  });

  Stream<List<PurchaseOrder>> watchPurchaseOrders({
    int? supplierId,
    String? status,
  });

  Future<List<PurchaseItem>> getPurchaseItems(int orderId);

  // Items
  Future<int> addPurchaseItem({
    required int orderId,
    required PurchaseLineInput item,
  });

  Future<void> updatePurchaseItem({
    required int itemId,
    required double quantity,
    double? unitPrice,
  });

  Future<void> deletePurchaseItem(int itemId);

  // Workflow
  Future<void> confirmPurchaseOrder(int orderId);

  Future<void> cancelPurchaseOrder(int orderId);

  Future<void> recalculateOrder(int orderId);
}
