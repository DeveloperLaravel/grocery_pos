
import '../models/purchase_order_model.dart';
import '../models/purchase_item_model.dart';
import '../models/purchase_order_details_model.dart';
import '../models/purchase_line_input_model.dart';

abstract class PurchaseOrderLocalDataSource {
  Future<int> createPurchaseOrder({
    required int supplierId,
    required String invoiceNumber,
    String? supplierInvoiceNumber,
    DateTime? purchaseDate,
    DateTime? expectedDeliveryDate,
    double discount,
    double tax,
    double shippingCost,
    double additionalCost,
    String? notes,
    String? internalNotes,
    required List<PurchaseLineInputModel> items,
  });

  Future<PurchaseOrderModel?> getPurchaseOrderById(int id);

  Future<PurchaseOrderDetailsModel?> getPurchaseOrderDetails(int id);

  Future<List<PurchaseOrderModel>> getPurchaseOrders({
    int? supplierId,
    String? status,
    DateTime? fromDate,
    DateTime? toDate,
  });

  Stream<List<PurchaseOrderModel>> watchPurchaseOrders({
    int? supplierId,
    String? status,
  });

  Future<List<PurchaseItemModel>> getPurchaseItems(int orderId);

  Future<int> addPurchaseItem({
    required int orderId,
    required PurchaseLineInputModel item,
  });

  Future<void> updatePurchaseItem({
    required int itemId,
    required double quantity,
    double? unitPrice,
  });

  Future<void> deletePurchaseItem(int itemId);

  Future<void> confirmPurchaseOrder(int orderId);

  Future<void> cancelPurchaseOrder(int orderId);

  Future<void> recalculateOrder(int orderId);
}
