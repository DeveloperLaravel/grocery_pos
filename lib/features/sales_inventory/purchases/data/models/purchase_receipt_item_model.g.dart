// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_receipt_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PurchaseReceiptItemModel _$PurchaseReceiptItemModelFromJson(
        Map<String, dynamic> json) =>
    _PurchaseReceiptItemModel(
      id: (json['id'] as num).toInt(),
      purchaseReceiptId: (json['purchaseReceiptId'] as num).toInt(),
      purchaseItemId: (json['purchaseItemId'] as num).toInt(),
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
    );

Map<String, dynamic> _$PurchaseReceiptItemModelToJson(
        _PurchaseReceiptItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'purchaseReceiptId': instance.purchaseReceiptId,
      'purchaseItemId': instance.purchaseItemId,
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
    };
