
import 'package:freezed_annotation/freezed_annotation.dart';


import '../../domain/entities/purchase_order_details.dart';

import 'purchase_item_model.dart';
import 'purchase_order_model.dart';
import 'purchase_payment_model.dart';
import 'purchase_receipt_model.dart';

part 'purchase_order_details_model.freezed.dart';
part 'purchase_order_details_model.g.dart';

@freezed
abstract class PurchaseOrderDetailsModel
    with _$PurchaseOrderDetailsModel {
  const PurchaseOrderDetailsModel._();

  const factory PurchaseOrderDetailsModel({
    required PurchaseOrderModel order,
    required String supplierName,

    @Default([])
    List<PurchaseItemModel> items,

    @Default([])
    List<PurchasePaymentModel> payments,

    @Default([])
    List<PurchaseReceiptModel> receipts,
  }) = _PurchaseOrderDetailsModel;

  factory PurchaseOrderDetailsModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PurchaseOrderDetailsModelFromJson(json);

  // =====================================================
  // ENTITY -> MODEL
  // =====================================================

  factory PurchaseOrderDetailsModel.fromEntity(
    PurchaseOrderDetails entity,
  ) {
    return PurchaseOrderDetailsModel(
      order: PurchaseOrderModel.fromEntity(entity.order),
      supplierName: entity.supplierName,
      items: entity.items
          .map(PurchaseItemModel.fromEntity)
          .toList(),
      payments: entity.payments
          .map(PurchasePaymentModel.fromEntity)
          .toList(),
      receipts: entity.receipts
          .map(PurchaseReceiptModel.fromEntity)
          .toList(),
    );
  }

  // =====================================================
  // MODEL -> ENTITY
  // =====================================================

  PurchaseOrderDetails toEntity() {
    return PurchaseOrderDetails(
      order: order.toEntity(),
      supplierName: supplierName,
      items: items.map((e) => e.toEntity()).toList(),
      payments: payments.map((e) => e.toEntity()).toList(),
      receipts: receipts.map((e) => e.toEntity()).toList(),
    );
  }
}
