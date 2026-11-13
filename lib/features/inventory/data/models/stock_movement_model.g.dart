// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_movement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StockMovementModel _$StockMovementModelFromJson(Map<String, dynamic> json) =>
    _StockMovementModel(
      id: (json['id'] as num).toInt(),
      productId: (json['product_id'] as num).toInt(),
      type: json['type'] as String,
      quantity: (json['quantity'] as num).toDouble(),
      reference: json['reference'] as String?,
      note: json['note'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$StockMovementModelToJson(_StockMovementModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'type': instance.type,
      'quantity': instance.quantity,
      'reference': instance.reference,
      'note': instance.note,
      'created_at': instance.createdAt.toIso8601String(),
    };
