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
      barcode: json['barcode'] as String?,
      productType: json['productType'] as String? ?? 'piece',
      baseUnit: json['baseUnit'] as String? ?? 'piece',
      allowDecimalQuantity: json['allowDecimalQuantity'] as bool? ?? false,
      costPrice: (json['costPrice'] as num?)?.toDouble() ?? 0.0,
      salePrice: (json['salePrice'] as num?)?.toDouble() ?? 0.0,
      quantity: (json['quantity'] as num?)?.toDouble() ?? 0.0,
      minStock: (json['minStock'] as num?)?.toDouble() ?? 5.0,
      imagePath: json['imagePath'] as String?,
      imageName: json['imageName'] as String?,
      imageUpdatedAt: json['imageUpdatedAt'] == null
          ? null
          : DateTime.parse(json['imageUpdatedAt'] as String),
      isActive: json['isActive'] as bool? ?? true,
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
      'barcode': instance.barcode,
      'productType': instance.productType,
      'baseUnit': instance.baseUnit,
      'allowDecimalQuantity': instance.allowDecimalQuantity,
      'costPrice': instance.costPrice,
      'salePrice': instance.salePrice,
      'quantity': instance.quantity,
      'minStock': instance.minStock,
      'imagePath': instance.imagePath,
      'imageName': instance.imageName,
      'imageUpdatedAt': instance.imageUpdatedAt?.toIso8601String(),
      'isActive': instance.isActive,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
