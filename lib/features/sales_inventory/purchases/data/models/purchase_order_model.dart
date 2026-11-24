
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/database/app_database.dart';
import '../../domain/entities/purchase_order.dart';

part 'purchase_order_model.freezed.dart';
part 'purchase_order_model.g.dart';

@freezed
abstract class PurchaseOrderModel with _$PurchaseOrderModel {
  const PurchaseOrderModel._();

  const factory PurchaseOrderModel({
    required int id,
    required int supplierId,
    required String invoiceNumber,
    String? supplierInvoiceNumber,

    required DateTime purchaseDate,
    DateTime? expectedDeliveryDate,
    DateTime? completedAt,

    required double subtotal,
    required double discount,
    required double tax,
    required double shippingCost,
    required double additionalCost,
    required double total,

    required double paidAmount,
    required double remainingAmount,

    @Default('draft') String status,
    @Default('unpaid') String paymentStatus,
    @Default('bank_transfer') String paymentMethod,

    String? notes,
    String? internalNotes,

    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _PurchaseOrderModel;

  factory PurchaseOrderModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PurchaseOrderModelFromJson(json);

  // =====================================================
  // DRIFT -> MODEL
  // =====================================================

  factory PurchaseOrderModel.fromDb(PurchaseOrderDb db) {
    return PurchaseOrderModel(
      id: db.id,
      supplierId: db.supplierId,
      invoiceNumber: db.invoiceNumber,
      supplierInvoiceNumber: db.supplierInvoiceNumber,
      purchaseDate: db.purchaseDate,
      expectedDeliveryDate: db.expectedDeliveryDate,
      completedAt: db.completedAt,
      subtotal: db.subtotal,
      discount: db.discount,
      tax: db.tax,
      shippingCost: db.shippingCost,
      additionalCost: db.additionalCost,
      total: db.total,
      paidAmount: db.paidAmount,
      remainingAmount: db.remainingAmount,
      status: db.status,
      paymentStatus: db.paymentStatus,
      paymentMethod: db.paymentMethod,
      notes: db.notes,
      internalNotes: db.internalNotes,
      createdAt: db.createdAt,
      updatedAt: db.updatedAt,
    );
  }

  // =====================================================
  // ENTITY -> MODEL
  // =====================================================

  factory PurchaseOrderModel.fromEntity(
    PurchaseOrder entity,
  ) {
    return PurchaseOrderModel(
      id: entity.id,
      supplierId: entity.supplierId,
      invoiceNumber: entity.invoiceNumber,
      supplierInvoiceNumber: entity.supplierInvoiceNumber,
      purchaseDate: entity.purchaseDate,
      expectedDeliveryDate: entity.expectedDeliveryDate,
      completedAt: entity.completedAt,
      subtotal: entity.subtotal,
      discount: entity.discount,
      tax: entity.tax,
      shippingCost: entity.shippingCost,
      additionalCost: entity.additionalCost,
      total: entity.total,
      paidAmount: entity.paidAmount,
      remainingAmount: entity.remainingAmount,
      status: entity.status,
      paymentStatus: entity.paymentStatus,
      paymentMethod: entity.paymentMethod,
      notes: entity.notes,
      internalNotes: entity.internalNotes,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  // =====================================================
  // MODEL -> ENTITY
  // =====================================================

  PurchaseOrder toEntity() {
    return PurchaseOrder(
      id: id,
      supplierId: supplierId,
      invoiceNumber: invoiceNumber,
      supplierInvoiceNumber: supplierInvoiceNumber,
      purchaseDate: purchaseDate,
      expectedDeliveryDate: expectedDeliveryDate,
      completedAt: completedAt,
      subtotal: subtotal,
      discount: discount,
      tax: tax,
      shippingCost: shippingCost,
      additionalCost: additionalCost,
      total: total,
      paidAmount: paidAmount,
      remainingAmount: remainingAmount,
      status: status,
      paymentStatus: paymentStatus,
      paymentMethod: paymentMethod,
      notes: notes,
      internalNotes: internalNotes,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
