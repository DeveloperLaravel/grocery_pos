
import 'package:injectable/injectable.dart';

import '../../domain/entities/purchase_order.dart';
import '../../domain/entities/purchase_item.dart';
import '../../domain/entities/purchase_line_input.dart';
import '../../domain/entities/purchase_order_details.dart';


import '../../domain/repositories/purchase_orders_repository.dart';
import '../database/purchase_order_local_data_source.dart';
import '../mappers/purchase_order_mapper.dart';

@LazySingleton(as: PurchaseOrderRepository)
class PurchaseOrderRepositoryImpl implements PurchaseOrderRepository {
  final PurchaseOrderLocalDataSource localDataSource;

  PurchaseOrderRepositoryImpl(this.localDataSource);

  // =====================================================
  // Create
  // =====================================================

  @override
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
  }) {
    return localDataSource.createPurchaseOrder(
      supplierId: supplierId,
      invoiceNumber: invoiceNumber,
      supplierInvoiceNumber: supplierInvoiceNumber,
      purchaseDate: purchaseDate,
      expectedDeliveryDate: expectedDeliveryDate,
      discount: discount,
      tax: tax,
      shippingCost: shippingCost,
      additionalCost: additionalCost,
      notes: notes,
      internalNotes: internalNotes,
      items: items
          .map(PurchaseOrderMapper.lineInputFromEntity)
          .toList(),
    );
  }

  // =====================================================
  // Read
  // =====================================================

  @override
  Future<PurchaseOrder?> getPurchaseOrderById(int id) async {
    final model = await localDataSource.getPurchaseOrderById(id);

    if (model == null) return null;

    return PurchaseOrderMapper.orderToEntity(model);
  }

  @override
  Future<PurchaseOrderDetails?> getPurchaseOrderDetails(int id) async {
    final model = await localDataSource.getPurchaseOrderDetails(id);

    if (model == null) return null;

    return PurchaseOrderMapper.detailsToEntity(model);
  }

  @override
  Future<List<PurchaseOrder>> getPurchaseOrders({
    int? supplierId,
    String? status,
    DateTime? fromDate,
    DateTime? toDate,
  }) async {
    final models = await localDataSource.getPurchaseOrders(
      supplierId: supplierId,
      status: status,
      fromDate: fromDate,
      toDate: toDate,
    );

    return PurchaseOrderMapper.ordersToEntities(models);
  }

  @override
  Stream<List<PurchaseOrder>> watchPurchaseOrders({
    int? supplierId,
    String? status,
  }) {
    return localDataSource
        .watchPurchaseOrders(
          supplierId: supplierId,
          status: status,
        )
        .map(PurchaseOrderMapper.ordersToEntities);
  }

  @override
  Future<List<PurchaseItem>> getPurchaseItems(int orderId) async {
    final models = await localDataSource.getPurchaseItems(orderId);

    return PurchaseOrderMapper.itemsToEntities(models);
  }

  // =====================================================
  // Items
  // =====================================================

  @override
  Future<int> addPurchaseItem({
    required int orderId,
    required PurchaseLineInput item,
  }) {
    return localDataSource.addPurchaseItem(
      orderId: orderId,
      item: PurchaseOrderMapper.lineInputFromEntity(item),
    );
  }

  @override
  Future<void> updatePurchaseItem({
    required int itemId,
    required double quantity,
    double? unitPrice,
  }) {
    return localDataSource.updatePurchaseItem(
      itemId: itemId,
      quantity: quantity,
      unitPrice: unitPrice,
    );
  }

  @override
  Future<void> deletePurchaseItem(int itemId) {
    return localDataSource.deletePurchaseItem(itemId);
  }

  // =====================================================
  // Workflow
  // =====================================================

  @override
  Future<void> confirmPurchaseOrder(int orderId) {
    return localDataSource.confirmPurchaseOrder(orderId);
  }

  @override
  Future<void> cancelPurchaseOrder(int orderId) {
    return localDataSource.cancelPurchaseOrder(orderId);
  }

  @override
  Future<void> recalculateOrder(int orderId) {
    return localDataSource.recalculateOrder(orderId);
  }
}
