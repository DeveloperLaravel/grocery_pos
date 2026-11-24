// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PurchasePaymentModel _$PurchasePaymentModelFromJson(
        Map<String, dynamic> json) =>
    _PurchasePaymentModel(
      id: (json['id'] as num).toInt(),
      purchaseOrderId: (json['purchaseOrderId'] as num).toInt(),
      paymentNumber: json['paymentNumber'] as String,
      amount: (json['amount'] as num).toDouble(),
      paymentDate: DateTime.parse(json['paymentDate'] as String),
      paymentMethod: json['paymentMethod'] as String,
      referenceNumber: json['referenceNumber'] as String?,
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$PurchasePaymentModelToJson(
        _PurchasePaymentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'purchaseOrderId': instance.purchaseOrderId,
      'paymentNumber': instance.paymentNumber,
      'amount': instance.amount,
      'paymentDate': instance.paymentDate.toIso8601String(),
      'paymentMethod': instance.paymentMethod,
      'referenceNumber': instance.referenceNumber,
      'notes': instance.notes,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
