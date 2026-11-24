// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_order_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PurchaseOrderDetailsModel _$PurchaseOrderDetailsModelFromJson(
        Map<String, dynamic> json) =>
    _PurchaseOrderDetailsModel(
      order: PurchaseOrderModel.fromJson(json['order'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>?)
              ?.map(
                  (e) => PurchaseItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$PurchaseOrderDetailsModelToJson(
        _PurchaseOrderDetailsModel instance) =>
    <String, dynamic>{
      'order': instance.order,
      'items': instance.items,
    };
