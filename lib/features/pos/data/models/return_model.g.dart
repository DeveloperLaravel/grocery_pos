// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReturnModel _$ReturnModelFromJson(Map<String, dynamic> json) => _ReturnModel(
      id: (json['id'] as num).toInt(),
      saleId: (json['sale_id'] as num).toInt(),
      total: (json['total'] as num).toDouble(),
      createdAt: DateTime.parse(json['created_at'] as String),
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => ReturnItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ReturnModelToJson(_ReturnModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sale_id': instance.saleId,
      'total': instance.total,
      'created_at': instance.createdAt.toIso8601String(),
      'items': instance.items,
    };
