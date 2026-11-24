// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_receipt_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PurchaseReceiptModel _$PurchaseReceiptModelFromJson(
        Map<String, dynamic> json) =>
    _PurchaseReceiptModel(
      id: (json['id'] as num).toInt(),
      purchaseOrderId: (json['purchaseOrderId'] as num).toInt(),
      receiptNumber: json['receiptNumber'] as String,
      receivedAt: DateTime.parse(json['receivedAt'] as String),
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$PurchaseReceiptModelToJson(
        _PurchaseReceiptModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'purchaseOrderId': instance.purchaseOrderId,
      'receiptNumber': instance.receiptNumber,
      'receivedAt': instance.receivedAt.toIso8601String(),
      'notes': instance.notes,
      'createdAt': instance.createdAt.toIso8601String(),
    };
