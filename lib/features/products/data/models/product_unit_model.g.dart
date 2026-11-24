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
      unitSymbol: json['unitSymbol'] as String?,
      conversionFactor: (json['conversionFactor'] as num?)?.toDouble() ?? 1.0,
      salePrice: (json['salePrice'] as num?)?.toDouble() ?? 0.0,
      purchasePrice: (json['purchasePrice'] as num?)?.toDouble() ?? 0.0,
      isBaseUnit: json['isBaseUnit'] as bool? ?? false,
      isDefault: json['isDefault'] as bool? ?? false,
      isActive: json['isActive'] as bool? ?? true,
      sortOrder: (json['sortOrder'] as num?)?.toInt() ?? 0,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$ProductUnitModelToJson(_ProductUnitModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'unitName': instance.unitName,
      'unitSymbol': instance.unitSymbol,
      'conversionFactor': instance.conversionFactor,
      'salePrice': instance.salePrice,
      'purchasePrice': instance.purchasePrice,
      'isBaseUnit': instance.isBaseUnit,
      'isDefault': instance.isDefault,
      'isActive': instance.isActive,
      'sortOrder': instance.sortOrder,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
