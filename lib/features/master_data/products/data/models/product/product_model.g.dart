// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductModel _$ProductModelFromJson(Map<String, dynamic> json) =>
    _ProductModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
      categoryId: (json['categoryId'] as num?)?.toInt(),
      brandId: (json['brandId'] as num?)?.toInt(),
      productType: json['productType'] as String,
      baseUnit: json['baseUnit'] as String,
      allowDecimalQuantity: json['allowDecimalQuantity'] as bool,
      costPrice: (json['costPrice'] as num).toDouble(),
      salePrice: (json['salePrice'] as num).toDouble(),
      minStock: (json['minStock'] as num).toDouble(),
      quantity: (json['quantity'] as num).toDouble(),
      isActive: json['isActive'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$ProductModelToJson(_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'categoryId': instance.categoryId,
      'brandId': instance.brandId,
      'productType': instance.productType,
      'baseUnit': instance.baseUnit,
      'allowDecimalQuantity': instance.allowDecimalQuantity,
      'costPrice': instance.costPrice,
      'salePrice': instance.salePrice,
      'minStock': instance.minStock,
      'quantity': instance.quantity,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
