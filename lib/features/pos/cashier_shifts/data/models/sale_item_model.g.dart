// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SaleItemModel _$SaleItemModelFromJson(Map<String, dynamic> json) =>
    _SaleItemModel(
      id: (json['id'] as num).toInt(),
      saleId: (json['sale_id'] as num).toInt(),
      productId: (json['product_id'] as num).toInt(),
      productName: json['product_name'] as String,
      quantity: (json['quantity'] as num).toDouble(),
      unitPrice: (json['unit_price'] as num).toDouble(),
      costPrice: (json['cost_price'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
    );

Map<String, dynamic> _$SaleItemModelToJson(_SaleItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sale_id': instance.saleId,
      'product_id': instance.productId,
      'product_name': instance.productName,
      'quantity': instance.quantity,
      'unit_price': instance.unitPrice,
      'cost_price': instance.costPrice,
      'total': instance.total,
    };
