// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReturnItemModel _$ReturnItemModelFromJson(Map<String, dynamic> json) =>
    _ReturnItemModel(
      id: (json['id'] as num).toInt(),
      returnId: (json['return_id'] as num).toInt(),
      productId: (json['product_id'] as num).toInt(),
      quantity: (json['quantity'] as num).toDouble(),
      refundAmount: (json['refund_amount'] as num).toDouble(),
    );

Map<String, dynamic> _$ReturnItemModelToJson(_ReturnItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'return_id': instance.returnId,
      'product_id': instance.productId,
      'quantity': instance.quantity,
      'refund_amount': instance.refundAmount,
    };
