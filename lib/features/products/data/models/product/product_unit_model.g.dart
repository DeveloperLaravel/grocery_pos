// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_unit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductUnitModel _$ProductUnitModelFromJson(Map<String, dynamic> json) =>
    _ProductUnitModel(
      id: (json['id'] as num).toInt(),
      productId: (json['productId'] as num).toInt(),
      unitName: json['unitName'] as String,
      conversionFactor: (json['conversionFactor'] as num).toDouble(),
      costPrice: (json['costPrice'] as num).toDouble(),
      salePrice: (json['salePrice'] as num).toDouble(),
      isBaseUnit: json['isBaseUnit'] as bool,
      isDefault: json['isDefault'] as bool,
      isActive: json['isActive'] as bool,
      sortOrder: (json['sortOrder'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$ProductUnitModelToJson(_ProductUnitModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'unitName': instance.unitName,
      'conversionFactor': instance.conversionFactor,
      'costPrice': instance.costPrice,
      'salePrice': instance.salePrice,
      'isBaseUnit': instance.isBaseUnit,
      'isDefault': instance.isDefault,
      'isActive': instance.isActive,
      'sortOrder': instance.sortOrder,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
