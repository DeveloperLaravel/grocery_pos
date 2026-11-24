// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_line_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PurchaseLineInputModel _$PurchaseLineInputModelFromJson(
        Map<String, dynamic> json) =>
    _PurchaseLineInputModel(
      productId: (json['productId'] as num).toInt(),
      productUnitId: (json['productUnitId'] as num?)?.toInt(),
      quantity: (json['quantity'] as num).toDouble(),
      unitPrice: (json['unitPrice'] as num?)?.toDouble(),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$PurchaseLineInputModelToJson(
        _PurchaseLineInputModel instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'productUnitId': instance.productUnitId,
      'quantity': instance.quantity,
      'unitPrice': instance.unitPrice,
      'notes': instance.notes,
    };
