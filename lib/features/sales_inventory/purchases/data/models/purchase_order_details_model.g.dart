// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_order_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PurchaseOrderDetailsModel _$PurchaseOrderDetailsModelFromJson(
        Map<String, dynamic> json) =>
    _PurchaseOrderDetailsModel(
      order: PurchaseOrderModel.fromJson(json['order'] as Map<String, dynamic>),
      supplierName: json['supplierName'] as String,
      items: (json['items'] as List<dynamic>?)
              ?.map(
                  (e) => PurchaseItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      payments: (json['payments'] as List<dynamic>?)
              ?.map((e) =>
                  PurchasePaymentModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      receipts: (json['receipts'] as List<dynamic>?)
              ?.map((e) =>
                  PurchaseReceiptModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$PurchaseOrderDetailsModelToJson(
        _PurchaseOrderDetailsModel instance) =>
    <String, dynamic>{
      'order': instance.order,
      'supplierName': instance.supplierName,
      'items': instance.items,
      'payments': instance.payments,
      'receipts': instance.receipts,
    };
