// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_barcode_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductBarcodeModel _$ProductBarcodeModelFromJson(Map<String, dynamic> json) =>
    _ProductBarcodeModel(
      id: (json['id'] as num).toInt(),
      productId: (json['productId'] as num).toInt(),
      productUnitId: (json['productUnitId'] as num?)?.toInt(),
      barcode: json['barcode'] as String,
      barcodeType: json['barcodeType'] as String,
      source: json['source'] as String?,
      isDefault: json['isDefault'] as bool,
      isActive: json['isActive'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$ProductBarcodeModelToJson(
        _ProductBarcodeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'productUnitId': instance.productUnitId,
      'barcode': instance.barcode,
      'barcodeType': instance.barcodeType,
      'source': instance.source,
      'isDefault': instance.isDefault,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
