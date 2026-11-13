// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CheckoutItemModel _$CheckoutItemModelFromJson(Map<String, dynamic> json) =>
    _CheckoutItemModel(
      productId: (json['product_id'] as num).toInt(),
      quantity: (json['quantity'] as num).toDouble(),
    );

Map<String, dynamic> _$CheckoutItemModelToJson(_CheckoutItemModel instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'quantity': instance.quantity,
    };
