// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PurchaseItemModel _$PurchaseItemModelFromJson(Map<String, dynamic> json) =>
    _PurchaseItemModel(
      id: (json['id'] as num).toInt(),
      purchaseOrderId: (json['purchaseOrderId'] as num).toInt(),
      productId: (json['productId'] as num).toInt(),
      productUnitId: (json['productUnitId'] as num?)?.toInt(),
      productName: json['productName'] as String,
      unitName: json['unitName'] as String,
      quantity: (json['quantity'] as num).toDouble(),
      conversionFactor: (json['conversionFactor'] as num).toDouble(),
      baseQuantity: (json['baseQuantity'] as num).toDouble(),
      unitPrice: (json['unitPrice'] as num).toDouble(),
      baseUnitCost: (json['baseUnitCost'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$PurchaseItemModelToJson(_PurchaseItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'purchaseOrderId': instance.purchaseOrderId,
      'productId': instance.productId,
      'productUnitId': instance.productUnitId,
      'productName': instance.productName,
      'unitName': instance.unitName,
      'quantity': instance.quantity,
      'conversionFactor': instance.conversionFactor,
      'baseQuantity': instance.baseQuantity,
      'unitPrice': instance.unitPrice,
      'baseUnitCost': instance.baseUnitCost,
      'total': instance.total,
      'notes': instance.notes,
    };
