// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_receipt_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PurchaseReceiptDetailsModel _$PurchaseReceiptDetailsModelFromJson(
        Map<String, dynamic> json) =>
    _PurchaseReceiptDetailsModel(
      receipt: PurchaseReceiptModel.fromJson(
          json['receipt'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>?)
              ?.map((e) =>
                  PurchaseReceiptItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$PurchaseReceiptDetailsModelToJson(
        _PurchaseReceiptDetailsModel instance) =>
    <String, dynamic>{
      'receipt': instance.receipt,
      'items': instance.items,
    };
