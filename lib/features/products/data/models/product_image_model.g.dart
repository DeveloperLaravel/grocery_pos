// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductImageModel _$ProductImageModelFromJson(Map<String, dynamic> json) =>
    _ProductImageModel(
      id: (json['id'] as num).toInt(),
      productId: (json['productId'] as num).toInt(),
      imagePath: json['imagePath'] as String,
      imageName: json['imageName'] as String?,
      isPrimary: json['isPrimary'] as bool? ?? false,
      sortOrder: (json['sortOrder'] as num?)?.toInt() ?? 0,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ProductImageModelToJson(_ProductImageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'imagePath': instance.imagePath,
      'imageName': instance.imageName,
      'isPrimary': instance.isPrimary,
      'sortOrder': instance.sortOrder,
      'createdAt': instance.createdAt.toIso8601String(),
    };
