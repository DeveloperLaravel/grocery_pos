// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PurchaseOrderModel _$PurchaseOrderModelFromJson(Map<String, dynamic> json) =>
    _PurchaseOrderModel(
      id: (json['id'] as num).toInt(),
      supplierId: (json['supplierId'] as num).toInt(),
      invoiceNumber: json['invoiceNumber'] as String,
      supplierInvoiceNumber: json['supplierInvoiceNumber'] as String?,
      purchaseDate: DateTime.parse(json['purchaseDate'] as String),
      expectedDeliveryDate: json['expectedDeliveryDate'] == null
          ? null
          : DateTime.parse(json['expectedDeliveryDate'] as String),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      subtotal: (json['subtotal'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
      tax: (json['tax'] as num).toDouble(),
      shippingCost: (json['shippingCost'] as num).toDouble(),
      additionalCost: (json['additionalCost'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      paidAmount: (json['paidAmount'] as num).toDouble(),
      remainingAmount: (json['remainingAmount'] as num).toDouble(),
      status: json['status'] as String? ?? 'draft',
      paymentStatus: json['paymentStatus'] as String? ?? 'unpaid',
      paymentMethod: json['paymentMethod'] as String? ?? 'bank_transfer',
      notes: json['notes'] as String?,
      internalNotes: json['internalNotes'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$PurchaseOrderModelToJson(_PurchaseOrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'supplierId': instance.supplierId,
      'invoiceNumber': instance.invoiceNumber,
      'supplierInvoiceNumber': instance.supplierInvoiceNumber,
      'purchaseDate': instance.purchaseDate.toIso8601String(),
      'expectedDeliveryDate': instance.expectedDeliveryDate?.toIso8601String(),
      'completedAt': instance.completedAt?.toIso8601String(),
      'subtotal': instance.subtotal,
      'discount': instance.discount,
      'tax': instance.tax,
      'shippingCost': instance.shippingCost,
      'additionalCost': instance.additionalCost,
      'total': instance.total,
      'paidAmount': instance.paidAmount,
      'remainingAmount': instance.remainingAmount,
      'status': instance.status,
      'paymentStatus': instance.paymentStatus,
      'paymentMethod': instance.paymentMethod,
      'notes': instance.notes,
      'internalNotes': instance.internalNotes,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
