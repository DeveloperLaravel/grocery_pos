import 'package:fpdart/fpdart.dart';

import '../entities/purchase_order.dart';
import '../entities/purchase_item.dart';
import '../entities/purchase_line_input.dart';
import '../entities/purchase_order_details.dart';

abstract class PurchaseRepository {
  Future<Either<String, int>> createPurchaseOrder({
    required int supplierId,
    required String invoiceNumber,
    required List<PurchaseLineInput> items,
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

  Future<Either<String, PurchaseOrder?>> getPurchaseOrderById(int id);

  Future<Either<String, PurchaseOrderDetails?>> getPurchaseOrderDetails(
    int id,
  );

  Future<Either<String, List<PurchaseOrder>>> getPurchaseOrders({
    int? supplierId,
    String? status,
    DateTime? fromDate,
    DateTime? toDate,
    int? limit,
    int? offset,
  });

  Stream<Either<String, List<PurchaseOrder>>> watchPurchaseOrders({
    int? supplierId,
    String? status,
    DateTime? fromDate,
    DateTime? toDate,
  });

  Future<Either<String, List<PurchaseItem>>> getPurchaseItems(int orderId);

  Future<Either<String, PurchaseItem?>> getPurchaseItemById(int itemId);

  Future<Either<String, int>> addPurchaseItem({
    required int purchaseOrderId,
    required PurchaseLineInput item,
  });

  Future<Either<String, bool>> updatePurchaseItem({
    required int purchaseItemId,
    required double quantity,
    required double unitPrice,
  });

  Future<Either<String, bool>> deletePurchaseItem(int purchaseItemId);

  Future<Either<String, bool>> confirmPurchaseOrder(int orderId);

  Future<Either<String, bool>> cancelPurchaseOrder(int orderId);

  Future<Either<String, void>> recalculateOrder(int orderId);
}