
import '../models/purchase_order_model.dart';
import '../models/purchase_item_model.dart';
import '../models/purchase_order_details_model.dart';
import '../models/purchase_line_input_model.dart';

abstract class PurchaseOrderLocalDataSource {
  // =====================================================
  // CREATE
  // =====================================================

  Future<int> createPurchaseOrder({
    required int supplierId,
    required String invoiceNumber,
    required List<PurchaseLineInputModel> items,
    String? supplierInvoiceNumber,
    DateTime? purchaseDate,
    DateTime? expectedDeliveryDate,
    double discount = 0,
    double tax = 0,
    double shippingCost = 0,
    double additionalCost = 0,
    String? notes,
    String? internalNotes,
  });

  // =====================================================
  // READ
  // =====================================================

  Future<PurchaseOrderModel?> getPurchaseOrderById(int id);

  Future<PurchaseOrderDetailsModel?> getPurchaseOrderDetails(int id);

  Future<List<PurchaseOrderModel>> getPurchaseOrders({
    int? supplierId,
    String? status,
    DateTime? fromDate,
    DateTime? toDate,
    int? limit,
    int? offset,
  });

  Stream<List<PurchaseOrderModel>> watchPurchaseOrders({
    int? supplierId,
    String? status,
    DateTime? fromDate,
    DateTime? toDate,
  });

  Future<List<PurchaseItemModel>> getPurchaseItems(int orderId);

  Future<PurchaseItemModel?> getPurchaseItemById(int itemId);

  // =====================================================
  // ITEMS
  // =====================================================

  Future<int> addPurchaseItem({
    required int purchaseOrderId,
    required PurchaseLineInputModel item,
  });

  Future<bool> updatePurchaseItem({
    required int purchaseItemId,
    required double quantity,
    required double unitPrice,
  });

  Future<bool> deletePurchaseItem(int purchaseItemId);

  // =====================================================
  // WORKFLOW
  // =====================================================

  Future<bool> confirmPurchaseOrder(int orderId);

  Future<bool> cancelPurchaseOrder(int orderId);

  Future<void> recalculateOrder(int orderId);
}
