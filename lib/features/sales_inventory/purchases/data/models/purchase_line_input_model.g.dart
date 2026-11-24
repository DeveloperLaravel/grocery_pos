// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_line_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PurchaseLineInputModel _$PurchaseLineInputModelFromJson(
        Map<String, dynamic> json) =>
    _PurchaseLineInputModel(
      productId: (json['productId'] as num).toInt(),
      productUnitId: (json['productUnitId'] as num).toInt(),
      productName: json['productName'] as String,
      unitName: json['unitName'] as String,
      quantity: (json['quantity'] as num).toDouble(),
      conversionFactor: (json['conversionFactor'] as num).toDouble(),
      unitPrice: (json['unitPrice'] as num).toDouble(),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$PurchaseLineInputModelToJson(
        _PurchaseLineInputModel instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'productUnitId': instance.productUnitId,
      'productName': instance.productName,
      'unitName': instance.unitName,
      'quantity': instance.quantity,
      'conversionFactor': instance.conversionFactor,
      'unitPrice': instance.unitPrice,
      'notes': instance.notes,
    };
