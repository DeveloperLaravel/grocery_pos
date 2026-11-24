// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_receipt_item_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PurchaseReceiptItemInputModel _$PurchaseReceiptItemInputModelFromJson(
        Map<String, dynamic> json) =>
    _PurchaseReceiptItemInputModel(
      purchaseItemId: (json['purchaseItemId'] as num).toInt(),
      productId: (json['productId'] as num).toInt(),
      productUnitId: (json['productUnitId'] as num?)?.toInt(),
      productName: json['productName'] as String,
      unitName: json['unitName'] as String,
      quantity: (json['quantity'] as num).toDouble(),
      conversionFactor: (json['conversionFactor'] as num).toDouble(),
      unitPrice: (json['unitPrice'] as num).toDouble(),
    );

Map<String, dynamic> _$PurchaseReceiptItemInputModelToJson(
        _PurchaseReceiptItemInputModel instance) =>
    <String, dynamic>{
      'purchaseItemId': instance.purchaseItemId,
      'productId': instance.productId,
      'productUnitId': instance.productUnitId,
      'productName': instance.productName,
      'unitName': instance.unitName,
      'quantity': instance.quantity,
      'conversionFactor': instance.conversionFactor,
      'unitPrice': instance.unitPrice,
    };
